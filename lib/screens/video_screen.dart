import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../widgets/video_news_card.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
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
        title: const Text('Video'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'For you'),
            Tab(text: 'Featured'),
            Tab(text: 'Economy'),
            Tab(text: 'Sports'),
            Tab(text: 'Technology'),
          ],
        ),
      ),
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {
          return TabBarView(
            controller: _tabController,
            children: [
              _buildVideoList(newsProvider.articles), // For you - all articles
              _buildVideoList(newsProvider.featuredArticles), // Featured - featured articles
              _buildVideoList(newsProvider.getArticlesByCategory('economy')), // Economy
              _buildVideoList(newsProvider.getArticlesByCategory('sports')), // Sports
              _buildVideoList(newsProvider.getArticlesByCategory('technology')), // Technology
            ],
          );
        },
      ),
    );
  }

  Widget _buildVideoList(List articles) {
    if (articles.isEmpty) {
      return const Center(child: Text('No video content available'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return VideoNewsCard(
          article: article,
          onTap: () {
            // Navigate to video player
          },
        );
      },
    );
  }
}
