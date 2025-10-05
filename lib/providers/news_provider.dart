import 'package:flutter/foundation.dart';
import '../models/news_article.dart';
import '../models/news_category.dart';
import '../services/news_service.dart';

class NewsProvider with ChangeNotifier {
  List<NewsArticle> _articles = [];
  List<NewsArticle> _categoryArticles = [];
  final List<NewsCategory> _categories = NewsCategories.categories;
  String _selectedCategory = '';
  bool _isLoading = false;
  String _error = '';
  String _searchQuery = '';
  List<NewsArticle> _searchResults = [];

  // Getters
  List<NewsArticle> get articles => _articles;
  List<NewsArticle> get categoryArticles => _categoryArticles;
  List<NewsCategory> get categories => _categories;
  String get selectedCategory => _selectedCategory;
  bool get isLoading => _isLoading;
  String get error => _error;
  String get searchQuery => _searchQuery;
  List<NewsArticle> get searchResults => _searchResults;

  // Get breaking news
  List<NewsArticle> get breakingNews =>
      _articles.where((article) => article.isBreaking).toList();

  // Get featured articles (first 3)
  List<NewsArticle> get featuredArticles => _articles.take(3).toList();

  // Get regular articles (excluding featured)
  List<NewsArticle> get regularArticles => _articles.skip(3).toList();

  // Load latest news
  Future<void> loadLatestNews() async {
    _setLoading(true);
    _setError('');

    try {
      final news = await NewsService.fetchLatestNews();
      _articles = news;
      notifyListeners();
    } catch (e) {
      _setError('Failed to load news: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Load news by category
  Future<void> loadNewsByCategory(String categoryId) async {
    _setLoading(true);
    _setError('');
    _selectedCategory = categoryId;

    try {
      final category = _categories.firstWhere((cat) => cat.id == categoryId);
      final news = await NewsService.fetchNewsByCategory(category.url);
      _categoryArticles = news;
      notifyListeners();
    } catch (e) {
      _setError('Failed to load category news: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Search news
  Future<void> searchNews(String query) async {
    if (query.isEmpty) {
      _searchResults = [];
      _searchQuery = '';
      notifyListeners();
      return;
    }

    _setLoading(true);
    _setError('');
    _searchQuery = query;

    try {
      final results = await NewsService.searchNews(query);
      _searchResults = results;
      notifyListeners();
    } catch (e) {
      _setError('Failed to search news: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Clear search
  void clearSearch() {
    _searchResults = [];
    _searchQuery = '';
    notifyListeners();
  }

  // Refresh news
  Future<void> refreshNews() async {
    if (_selectedCategory.isNotEmpty) {
      await loadNewsByCategory(_selectedCategory);
    } else {
      await loadLatestNews();
    }
  }

  // Get articles for current view
  List<NewsArticle> get currentArticles {
    if (_searchQuery.isNotEmpty) {
      return _searchResults;
    } else if (_selectedCategory.isNotEmpty) {
      return _categoryArticles;
    } else {
      return _articles;
    }
  }

  // Helper methods
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  // Get category by ID
  NewsCategory? getCategoryById(String id) {
    try {
      return _categories.firstWhere((category) => category.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get articles by category ID
  List<NewsArticle> getArticlesByCategory(String categoryId) {
    // Map English category names to Kinyarwanda categories in dummy data
    final categoryMapping = {
      'news': ['Mu Rwanda'],
      'economy': ['Ubukungu', 'Ubucuruzi'],
      'health': ['Ubuzima'],
      'security': ['Mu Rwanda'], // Security news is typically under general news
      'justice': ['Mu Rwanda'], // Justice news is typically under general news
      'sports': ['Imikino', 'Amagare', 'Football', 'Basketball'],
      'entertainment': ['Mu Rwanda'], // Entertainment news is typically under general news
      'education': ['Uburezi', 'Amashuri'],
      'technology': ['Ikoranabuhanga'],
      'remembrance': ['Mu Rwanda'], // Remembrance news is typically under general news
      'development': ['Iterambere'],
      'business': ['Ubucuruzi', 'Ubukungu'],
    };

    final mappedCategories = categoryMapping[categoryId.toLowerCase()] ?? [categoryId];
    
    return _articles
        .where(
          (article) => mappedCategories.any(
            (mappedCategory) => article.category.toLowerCase().contains(mappedCategory.toLowerCase()),
          ),
        )
        .toList();
  }
}
