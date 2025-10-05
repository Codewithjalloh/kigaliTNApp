import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../providers/news_provider.dart';
import '../widgets/news_card.dart';
import '../models/news_article.dart';
import 'category_screen.dart';
import 'article_detail_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: NewsSearchDelegate());
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Categories'),
            Tab(text: 'Trending'),
            Tab(text: 'Latest'),
          ],
        ),
      ),
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {
          return TabBarView(
            controller: _tabController,
            children: [
              _buildCategoriesTab(newsProvider),
              _buildTrendingTab(newsProvider),
              _buildLatestTab(newsProvider),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCategoriesTab(NewsProvider newsProvider) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: newsProvider.categories.length,
      itemBuilder: (context, index) {
        final category = newsProvider.categories[index];
        final backgroundImages = [
          'https://images.unsplash.com/photo-1582213782179-e0d53f98f2ca?w=400&h=200&fit=crop', // Politics
          'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=400&h=200&fit=crop', // Economy
          'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=400&h=200&fit=crop', // Health
          'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400&h=200&fit=crop', // Security
          'https://images.unsplash.com/photo-1582213782179-e0d53f98f2ca?w=400&h=200&fit=crop', // Justice
          'https://images.unsplash.com/photo-1431324155629-1a6deb1dec8d?w=400&h=200&fit=crop', // Sports
          'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400&h=200&fit=crop', // Entertainment
          'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=400&h=200&fit=crop', // Education
          'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=400&h=200&fit=crop', // Technology
          'https://images.unsplash.com/photo-1521737711867-e3b97375f902?w=400&h=200&fit=crop', // Remembrance
          'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400&h=200&fit=crop', // Development
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=200&fit=crop', // Business
        ];

        final descriptions = [
          'Latest news and updates from Rwanda',
          'Economic developments and business news',
          'Health updates and medical news',
          'Security and safety information',
          'Legal news and justice updates',
          'Sports news and match results',
          'Entertainment and cultural events',
          'Education news and school updates',
          'Technology and innovation news',
          'Remembrance and historical events',
          'Development projects and progress',
          'Business news and entrepreneurship',
        ];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryScreen(category: category),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  // Background Image
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl:
                          backgroundImages[index % backgroundImages.length],
                      fit: BoxFit.cover,
                      placeholder:
                          (context, url) => Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFFBB0000),
                              ),
                            ),
                          ),
                      errorWidget:
                          (context, url, error) => Container(
                            color: Colors.grey[300],
                            child: const Icon(
                              Icons.image_not_supported,
                              color: Colors.grey,
                              size: 50,
                            ),
                          ),
                    ),
                  ),

                  // Gradient Overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),

                  // Content
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        // Icon
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              category.icon,
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Text Content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                category.nameInKinyarwanda,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                descriptions[index % descriptions.length],
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),

                        // Arrow Icon
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white70,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTrendingTab(NewsProvider newsProvider) {
    final trendingArticles = newsProvider.articles.take(6).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: trendingArticles.length,
      itemBuilder: (context, index) {
        final article = trendingArticles[index];
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

  Widget _buildLatestTab(NewsProvider newsProvider) {
    final latestArticles = newsProvider.articles.skip(6).toList();

    if (latestArticles.isEmpty) {
      return const Center(child: Text('No latest articles available'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: latestArticles.length,
      itemBuilder: (context, index) {
        final article = latestArticles[index];
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
            return ListTile(
              leading:
                  article.imageUrl.isNotEmpty
                      ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          article.imageUrl,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 60,
                              height: 60,
                              color: Colors.grey[300],
                              child: const Icon(Icons.image_not_supported),
                            );
                          },
                        ),
                      )
                      : Container(
                        width: 60,
                        height: 60,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image_not_supported),
                      ),
              title: Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.excerpt,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    article.timeAgo,
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
              onTap: () {
                // Navigate to article detail
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
