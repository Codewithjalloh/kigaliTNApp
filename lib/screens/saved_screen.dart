import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../widgets/news_card.dart';
import 'article_detail_screen.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
        title: const Text('My Library'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Saved'),
            Tab(text: 'History'),
            Tab(text: 'Highlights'),
            Tab(text: 'Following'),
          ],
        ),
      ),
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {
          return TabBarView(
            controller: _tabController,
            children: [
              _buildSavedArticles(newsProvider.articles),
              _buildHistoryArticles(newsProvider.articles),
              _buildHighlightsArticles(newsProvider.articles),
              _buildFollowingArticles(newsProvider.articles),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSavedArticles(List articles) {
    if (articles.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bookmark_outline, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No saved articles',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Save articles to read them later',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
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

  Widget _buildHistoryArticles(List articles) {
    return _buildSavedArticles(articles);
  }

  Widget _buildHighlightsArticles(List articles) {
    return _buildSavedArticles(articles);
  }

  Widget _buildFollowingArticles(List articles) {
    return _buildSavedArticles(articles);
  }
}
