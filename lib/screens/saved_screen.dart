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
    _tabController = TabController(length: 8, vsync: this);
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
            Tab(text: 'Downloads'),
            Tab(text: 'Offline'),
            Tab(text: 'Bookmarks'),
            Tab(text: 'Collections'),
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
              _buildDownloadsArticles(newsProvider.articles),
              _buildOfflineArticles(newsProvider.articles),
              _buildBookmarksArticles(newsProvider.articles),
              _buildCollectionsArticles(newsProvider.articles),
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
    return _buildEmptyState(
      icon: Icons.history,
      title: 'No reading history',
      subtitle: 'Articles you read will appear here',
    );
  }

  Widget _buildHighlightsArticles(List articles) {
    return _buildEmptyState(
      icon: Icons.highlight_outlined,
      title: 'No highlighted articles',
      subtitle: 'Highlight text in articles to save important quotes',
    );
  }

  Widget _buildFollowingArticles(List articles) {
    return _buildEmptyState(
      icon: Icons.people_outline,
      title: 'No followed sources',
      subtitle: 'Follow news sources to see their latest articles here',
    );
  }

  Widget _buildDownloadsArticles(List articles) {
    return _buildEmptyState(
      icon: Icons.download_outlined,
      title: 'No downloaded articles',
      subtitle: 'Download articles to read them offline',
    );
  }

  Widget _buildOfflineArticles(List articles) {
    return _buildEmptyState(
      icon: Icons.offline_bolt_outlined,
      title: 'No offline content',
      subtitle: 'Download articles to access them without internet',
    );
  }

  Widget _buildBookmarksArticles(List articles) {
    return _buildEmptyState(
      icon: Icons.bookmark_border,
      title: 'No bookmarked articles',
      subtitle: 'Bookmark articles to organize your reading list',
    );
  }

  Widget _buildCollectionsArticles(List articles) {
    return _buildEmptyState(
      icon: Icons.collections_bookmark_outlined,
      title: 'No collections',
      subtitle: 'Create collections to organize your saved articles',
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
