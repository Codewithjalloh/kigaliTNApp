class NewsCategory {
  final String id;
  final String name;
  final String nameInKinyarwanda;
  final String icon;
  final String color;
  final String url;

  NewsCategory({
    required this.id,
    required this.name,
    required this.nameInKinyarwanda,
    required this.icon,
    required this.color,
    required this.url,
  });

  factory NewsCategory.fromJson(Map<String, dynamic> json) {
    return NewsCategory(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      nameInKinyarwanda: json['nameInKinyarwanda'] ?? '',
      icon: json['icon'] ?? '',
      color: json['color'] ?? '#2196F3',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nameInKinyarwanda': nameInKinyarwanda,
      'icon': icon,
      'color': color,
      'url': url,
    };
  }
}

// Predefined categories based on Kigali Today website
class NewsCategories {
  static List<NewsCategory> get categories => [
    NewsCategory(
      id: 'amakuru',
      name: 'News',
      nameInKinyarwanda: 'Amakuru',
      icon: '📰',
      color: '#2196F3',
      url: '/amakuru',
    ),
    NewsCategory(
      id: 'ubukungu',
      name: 'Economy',
      nameInKinyarwanda: 'Ubukungu',
      icon: '💰',
      color: '#4CAF50',
      url: '/ubukungu',
    ),
    NewsCategory(
      id: 'ubuzima',
      name: 'Health',
      nameInKinyarwanda: 'Ubuzima',
      icon: '🏥',
      color: '#F44336',
      url: '/ubuzima',
    ),
    NewsCategory(
      id: 'umutekano',
      name: 'Security',
      nameInKinyarwanda: 'Umutekano',
      icon: '🛡️',
      color: '#FF9800',
      url: '/umutekano',
    ),
    NewsCategory(
      id: 'ubutabera',
      name: 'Justice',
      nameInKinyarwanda: 'Ubutabera',
      icon: '⚖️',
      color: '#9C27B0',
      url: '/ubutabera',
    ),
    NewsCategory(
      id: 'imikino',
      name: 'Sports',
      nameInKinyarwanda: 'Imikino',
      icon: '⚽',
      color: '#00BCD4',
      url: '/imikino',
    ),
    NewsCategory(
      id: 'imyidagaduro',
      name: 'Entertainment',
      nameInKinyarwanda: 'Imyidagaduro',
      icon: '🎭',
      color: '#E91E63',
      url: '/imyidagaduro',
    ),
    NewsCategory(
      id: 'uburezi',
      name: 'Education',
      nameInKinyarwanda: 'Uburezi',
      icon: '🎓',
      color: '#795548',
      url: '/uburezi',
    ),
    NewsCategory(
      id: 'ikoranabuhanga',
      name: 'Technology',
      nameInKinyarwanda: 'Ikoranabuhanga',
      icon: '💻',
      color: '#607D8B',
      url: '/ikoranabuhanga',
    ),
    NewsCategory(
      id: 'kwibuka',
      name: 'Remembrance',
      nameInKinyarwanda: 'Kwibuka',
      icon: '🕊️',
      color: '#3F51B5',
      url: '/kwibuka',
    ),
    NewsCategory(
      id: 'iterambere',
      name: 'Development',
      nameInKinyarwanda: 'Iterambere',
      icon: '🏗️',
      color: '#FF5722',
      url: '/iterambere',
    ),
    NewsCategory(
      id: 'ubucuruzi',
      name: 'Business',
      nameInKinyarwanda: 'Ubucuruzi',
      icon: '🏢',
      color: '#009688',
      url: '/ubucuruzi',
    ),
    NewsCategory(
      id: 'ubuhinzi',
      name: 'Agriculture',
      nameInKinyarwanda: 'Ubuhinzi',
      icon: '🌾',
      color: '#8BC34A',
      url: '/ubuhinzi',
    ),
  ];
}
