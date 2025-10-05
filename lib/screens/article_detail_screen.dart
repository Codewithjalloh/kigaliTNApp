import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/news_article.dart';

class ArticleDetailScreen extends StatelessWidget {
  final NewsArticle article;

  const ArticleDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Article',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () => _shareArticle(context),
          ),
          IconButton(
            icon: const Icon(Icons.open_in_browser, color: Colors.white),
            onPressed: () => _openInBrowser(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article Image
            if (article.imageUrl.isNotEmpty)
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(article.imageUrl),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      // Handle image load error
                    },
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child:
                      article.isBreaking
                          ? Container(
                            margin: const EdgeInsets.all(16),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'BREAKING',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          )
                          : null,
                ),
              ),

            // Article Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E3A8A).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      article.category,
                      style: const TextStyle(
                        color: Color(0xFF1E3A8A),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Article Title
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                      height: 1.3,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Article Meta Info
                  Row(
                    children: [
                      const Icon(
                        Icons.person_outline,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        article.author,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        article.timeAgo,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Article Content
                  Text(
                    article.content,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2D2D2D),
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Read More Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => _openInBrowser(),
                      icon: const Icon(Icons.open_in_browser),
                      label: const Text('Read Full Article'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E3A8A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Share Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () => _shareArticle(context),
                      icon: const Icon(Icons.share),
                      label: const Text('Share Article'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF1E3A8A),
                        side: const BorderSide(color: Color(0xFF1E3A8A)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _shareArticle(BuildContext context) {
    // In a real app, you would implement sharing functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Share functionality would be implemented here'),
        backgroundColor: Color(0xFF1E3A8A),
      ),
    );
  }

  void _openInBrowser() async {
    if (article.url.isNotEmpty) {
      final uri = Uri.parse(article.url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }
}
