import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../providers/news_provider.dart';
import '../widgets/news_card.dart';
import '../widgets/breaking_news_banner.dart';
import 'article_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 12, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewsProvider>().loadLatestNews();
    });
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _onRefresh() async {
    await context.read<NewsProvider>().refreshNews();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            // Kigali Today Logo
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: Text(
                  'KT',
                  style: TextStyle(
                    color: Color(0xFFBB0000),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'KIGALI TODAY',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFBB0000),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(context: context, delegate: NewsSearchDelegate());
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'News'),
            Tab(text: 'Economy'),
            Tab(text: 'Health'),
            Tab(text: 'Security'),
            Tab(text: 'Justice'),
            Tab(text: 'Sports'),
            Tab(text: 'Entertainment'),
            Tab(text: 'Education'),
            Tab(text: 'Technology'),
            Tab(text: 'Remembrance'),
            Tab(text: 'Development'),
            Tab(text: 'Business'),
          ],
        ),
      ),
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {
          if (newsProvider.isLoading && newsProvider.articles.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFBB0000)),
              ),
            );
          }

          if (newsProvider.error.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading news',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    newsProvider.error,
                    style: TextStyle(color: Colors.grey[500]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => newsProvider.loadLatestNews(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFBB0000),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return TabBarView(
            controller: _tabController,
            children: [
              _buildCategoryTab(newsProvider, 'News'),
              _buildCategoryTab(newsProvider, 'Economy'),
              _buildCategoryTab(newsProvider, 'Health'),
              _buildCategoryTab(newsProvider, 'Security'),
              _buildCategoryTab(newsProvider, 'Justice'),
              _buildCategoryTab(newsProvider, 'Sports'),
              _buildCategoryTab(newsProvider, 'Entertainment'),
              _buildCategoryTab(newsProvider, 'Education'),
              _buildCategoryTab(newsProvider, 'Technology'),
              _buildCategoryTab(newsProvider, 'Remembrance'),
              _buildCategoryTab(newsProvider, 'Development'),
              _buildCategoryTab(newsProvider, 'Business'),
            ],
          );
        },
      ),
    );
  }

  Widget _buildForYouTab(NewsProvider newsProvider) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breaking News Banner
            if (newsProvider.breakingNews.isNotEmpty)
              BreakingNewsBanner(
                articles: newsProvider.breakingNews,
                onArticleTap: (article) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => ArticleDetailScreen(article: article),
                    ),
                  );
                },
              ),

            // At the moment section
            if (newsProvider.featuredArticles.isNotEmpty)
              _buildAtTheMomentSection(newsProvider.featuredArticles.first),

            // Latest News
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Latest News',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: newsProvider.regularArticles.length,
                    itemBuilder: (context, index) {
                      final article = newsProvider.regularArticles[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: NewsCard(
                          article: article,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        ArticleDetailScreen(article: article),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAtTheMomentSection(article) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // At the moment header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFBB0000),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: const Text(
              'At the moment',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Article content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  article.excerpt,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF2D2D2D),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      article.timeAgo,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const Text(' • ', style: TextStyle(color: Colors.grey)),
                    Text(
                      'By ${article.author}',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(NewsProvider newsProvider, String categoryName) {
    // For the first tab (News), show all articles with breaking news banner
    if (categoryName == 'News') {
      return SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breaking News Banner
              if (newsProvider.breakingNews.isNotEmpty)
                BreakingNewsBanner(
                  articles: newsProvider.breakingNews,
                  onArticleTap: (article) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => ArticleDetailScreen(article: article),
                      ),
                    );
                  },
                ),

              // At the moment section
              if (newsProvider.featuredArticles.isNotEmpty)
                _buildAtTheMomentSection(newsProvider.featuredArticles.first),

              // Latest News
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Latest News',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: newsProvider.regularArticles.length,
                      itemBuilder: (context, index) {
                        final article = newsProvider.regularArticles[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: NewsCard(
                            article: article,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          ArticleDetailScreen(article: article),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    // For other categories, show filtered articles
    final categoryArticles = newsProvider.getArticlesByCategory(
      categoryName.toLowerCase(),
    );
    return _buildNewsList(categoryArticles);
  }

  Widget _buildNewsList(List articles) {
    if (articles.isEmpty) {
      return const Center(child: Text('No articles available'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: NewsCard(
            article: article,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetailScreen(article: article),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class NewsSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text('Enter a search term'));
    }

    return Consumer<NewsProvider>(
      builder: (context, newsProvider, child) {
        if (newsProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFBB0000)),
            ),
          );
        }

        if (newsProvider.searchResults.isEmpty) {
          return const Center(child: Text('No articles found'));
        }

        return ListView.builder(
          itemCount: newsProvider.searchResults.length,
          itemBuilder: (context, index) {
            final article = newsProvider.searchResults[index];
            return NewsCard(
              article: article,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleDetailScreen(article: article),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('Start typing to search...'));
  }

  @override
  String get searchFieldLabel => 'Search news...';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFBB0000),
        foregroundColor: Colors.white,
      ),
    );
  }
}
