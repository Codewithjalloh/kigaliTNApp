import 'package:flutter/material.dart';

class KTPressScreen extends StatelessWidget {
  const KTPressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KT Press'),
        backgroundColor: const Color(0xFFBB0000),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFBB0000),
                    const Color(0xFFBB0000).withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'KT',
                        style: TextStyle(
                          color: Color(0xFFBB0000),
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'KT Press',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rwanda\'s leading digital news platform covering national, regional, and international news',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Features Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'News Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureItem(
                    icon: Icons.newspaper,
                    title: 'National & Regional News',
                    description:
                        'Stay updated with local and regional developments',
                  ),
                  _buildFeatureItem(
                    icon: Icons.business,
                    title: 'Business & Technology',
                    description: 'Companies, Economy, Markets, and Tech news',
                  ),
                  _buildFeatureItem(
                    icon: Icons.sports,
                    title: 'Sports',
                    description: 'Latest sports news and updates from Rwanda',
                  ),
                  _buildFeatureItem(
                    icon: Icons.people,
                    title: 'Society & ShowBiz',
                    description: 'Social issues, entertainment, and lifestyle',
                  ),
                  _buildFeatureItem(
                    icon: Icons.record_voice_over,
                    title: 'Voices',
                    description: 'Opinion pieces and editorial content',
                  ),
                  _buildFeatureItem(
                    icon: Icons.analytics,
                    title: 'Special Reports',
                    description: 'In-depth investigative journalism',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Key Features Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'App Features',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureItem(
                    icon: Icons.notifications_active,
                    title: 'Breaking News Alerts',
                    description: 'Get instant notifications for breaking news',
                  ),
                  _buildFeatureItem(
                    icon: Icons.bookmark,
                    title: 'Save Articles',
                    description: 'Bookmark articles for later reading',
                  ),
                  _buildFeatureItem(
                    icon: Icons.search,
                    title: 'Smart Search',
                    description: 'Find specific topics and articles quickly',
                  ),
                  _buildFeatureItem(
                    icon: Icons.offline_bolt,
                    title: 'Offline Reading',
                    description: 'Read articles even without internet',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Download Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Download Now',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Google Play Store
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () => _openPlayStore(context),
                      icon: const Icon(Icons.shop),
                      label: const Text('Download on Google Play'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFBB0000),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // App Store
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () => _openAppStore(context),
                      icon: const Icon(Icons.apple),
                      label: const Text('Download on App Store'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // QR Code Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Or scan QR code to download',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.qr_code,
                            size: 80,
                            color: Color(0xFFBB0000),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'QR Code',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Website Info
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blue[200]!),
              ),
              child: Column(
                children: [
                  const Icon(Icons.web, color: Colors.blue, size: 24),
                  const SizedBox(height: 8),
                  const Text(
                    'Visit our website',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'www.ktpress.rw',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Contact: info@ktpress.rw',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFBB0000).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFFBB0000), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openPlayStore(BuildContext context) {
    // TODO: Implement opening Google Play Store
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Opening Google Play Store...'),
        backgroundColor: Color(0xFFBB0000),
      ),
    );
  }

  void _openAppStore(BuildContext context) {
    // TODO: Implement opening App Store
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Opening App Store...'),
        backgroundColor: Color(0xFFBB0000),
      ),
    );
  }
}
