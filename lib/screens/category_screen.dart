import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../models/news_category.dart';
import '../providers/news_provider.dart';
import '../widgets/news_card.dart';
import 'article_detail_screen.dart';

class CategoryScreen extends StatefulWidget {
  final NewsCategory category;

  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewsProvider>().loadNewsByCategory(widget.category.id);
    });
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() async {
    await context.read<NewsProvider>().refreshNews();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          widget.category.nameInKinyarwanda,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(
          int.parse(widget.category.color.replaceFirst('#', '0xFF')),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {
          if (newsProvider.isLoading && newsProvider.categoryArticles.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1E3A8A)),
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
                    onPressed:
                        () =>
                            newsProvider.loadNewsByCategory(widget.category.id),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(
                        int.parse(
                          widget.category.color.replaceFirst('#', '0xFF'),
                        ),
                      ),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (newsProvider.categoryArticles.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.article_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No articles found',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'There are no articles in this category yet.',
                    style: TextStyle(color: Colors.grey[500]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return SmartRefresher(
            controller: _refreshController,
            onRefresh: _onRefresh,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: newsProvider.categoryArticles.length,
              itemBuilder: (context, index) {
                final article = newsProvider.categoryArticles[index];
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
          );
        },
      ),
    );
  }
}
