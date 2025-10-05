import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/news_article.dart';

class BreakingNewsBanner extends StatefulWidget {
  final List<NewsArticle> articles;
  final Function(NewsArticle) onArticleTap;

  const BreakingNewsBanner({
    super.key,
    required this.articles,
    required this.onArticleTap,
  });

  @override
  State<BreakingNewsBanner> createState() => _BreakingNewsBannerState();
}

class _BreakingNewsBannerState extends State<BreakingNewsBanner>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Auto-scroll through breaking news
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _nextPage();
        _animationController.reset();
        _animationController.forward();
      }
    });
    _animationController.forward();
  }

  void _nextPage() {
    if (widget.articles.length > 1) {
      _currentIndex = (_currentIndex + 1) % widget.articles.length;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.articles.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      height: 200,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Breaking News Header
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 40,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.redAccent],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: const Center(
                  child: Text(
                    '🔥 BREAKING NEWS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),

            // News Content
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              bottom: 0,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: widget.articles.length,
                itemBuilder: (context, index) {
                  final article = widget.articles[index];
                  return _buildBreakingNewsItem(article);
                },
              ),
            ),

            // Page Indicators
            if (widget.articles.length > 1)
              Positioned(
                bottom: 12,
                right: 12,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    widget.articles.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _currentIndex == index
                                ? Colors.white
                                : Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreakingNewsItem(NewsArticle article) {
    return GestureDetector(
      onTap: () => widget.onArticleTap(article),
      child: Container(
        decoration: BoxDecoration(
          image:
              article.imageUrl.isNotEmpty
                  ? DecorationImage(
                    image: CachedNetworkImageProvider(article.imageUrl),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      // Handle image load error
                    },
                  )
                  : null,
          color: article.imageUrl.isEmpty ? Colors.grey[300] : null,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Category Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  article.category,
                  style: const TextStyle(
                    color: Color(0xFF1E3A8A),
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Title
              Text(
                article.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 4),

              // Time
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 12,
                    color: Colors.white70,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    article.timeAgo,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
