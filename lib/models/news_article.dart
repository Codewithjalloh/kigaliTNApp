class NewsArticle {
  final String id;
  final String title;
  final String content;
  final String excerpt;
  final String imageUrl;
  final String category;
  final String author;
  final DateTime publishedDate;
  final String url;
  final bool isBreaking;

  NewsArticle({
    required this.id,
    required this.title,
    required this.content,
    required this.excerpt,
    required this.imageUrl,
    required this.category,
    required this.author,
    required this.publishedDate,
    required this.url,
    this.isBreaking = false,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      excerpt: json['excerpt'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      category: json['category'] ?? '',
      author: json['author'] ?? '',
      publishedDate:
          DateTime.tryParse(json['publishedDate'] ?? '') ?? DateTime.now(),
      url: json['url'] ?? '',
      isBreaking: json['isBreaking'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'excerpt': excerpt,
      'imageUrl': imageUrl,
      'category': category,
      'author': author,
      'publishedDate': publishedDate.toIso8601String(),
      'url': url,
      'isBreaking': isBreaking,
    };
  }

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(publishedDate);

    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just now';
    }
  }
}
