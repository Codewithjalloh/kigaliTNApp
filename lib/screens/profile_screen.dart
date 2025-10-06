import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'settings_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'saved_screen.dart';
import 'notifications_screen.dart';
import 'help_support_screen.dart';
import 'work_with_us_screen.dart';
import 'radio_app_screen.dart';
import 'kt_press_screen.dart';
import 'language_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LanguageScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Authentication Cards
            Row(
              children: [
                Expanded(
                  child: _buildAuthCard(
                    title: 'Sign In',
                    subtitle: 'Welcome back!',
                    icon: Icons.login,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildAuthCard(
                    title: 'Register',
                    subtitle: 'Join Kigali Today',
                    icon: Icons.person_add,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Stats Cards
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Articles Read',
                    '127',
                    Icons.article_outlined,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard('Saved', '23', Icons.bookmark_outline),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Categories',
                    '8',
                    Icons.category_outlined,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Quick Actions
            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 16),

            _buildActionTile(
              icon: Icons.bookmark_outline,
              title: 'Saved Articles',
              subtitle: 'View your saved articles',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SavedScreen()),
                );
              },
            ),
            _buildActionTile(
              icon: Icons.history,
              title: 'Reading History',
              subtitle: 'See your reading history',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SavedScreen()),
                );
              },
            ),
            _buildActionTile(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              subtitle: 'Manage your notifications',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationsScreen(),
                  ),
                );
              },
            ),
            _buildActionTile(
              icon: Icons.share_outlined,
              title: 'Share App',
              subtitle: 'Share Kigali Today with friends',
              onTap: () {
                _showShareDialog(context);
              },
            ),
            _buildActionTile(
              icon: Icons.help_outline,
              title: 'Help & Support',
              subtitle: 'Get help and contact support',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpSupportScreen(),
                  ),
                );
              },
            ),
            _buildActionTile(
              icon: Icons.business_outlined,
              title: 'Work with Us',
              subtitle: 'Partner with us for advertising opportunities',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WorkWithUsScreen(),
                  ),
                );
              },
            ),
            _buildActionTile(
              icon: Icons.radio,
              title: 'Download Radio App',
              subtitle: 'Listen to Kigali Today Radio',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RadioAppScreen(),
                  ),
                );
              },
            ),
            _buildActionTile(
              icon: Icons.newspaper,
              title: 'Download KT Press',
              subtitle: 'Rwanda\'s leading digital news platform',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const KTPressScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
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
        children: [
          Icon(icon, color: const Color(0xFFBB0000), size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAuthCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFBB0000),
              const Color(0xFFBB0000).withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 32),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
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
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFBB0000)),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A1A),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  void _showShareDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder:
          (context) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle bar
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  // Header
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFFBB0000),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text(
                              'KT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Share Kigali Today',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Help others discover the best news app in Rwanda',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  // Share options
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        _buildShareOption(
                          icon: Icons.chat,
                          title: 'Share via WhatsApp',
                          subtitle: 'Send via WhatsApp',
                          onTap: () => _shareViaWhatsApp(context),
                        ),
                        _buildShareOption(
                          icon: Icons.email_outlined,
                          title: 'Share via Email',
                          subtitle: 'Send via email',
                          onTap: () => _shareViaEmail(context),
                        ),
                        _buildShareOption(
                          icon: Icons.link,
                          title: 'Copy Link',
                          subtitle: 'Copy app download link',
                          onTap: () => _copyLink(context),
                        ),
                        _buildShareOption(
                          icon: Icons.qr_code,
                          title: 'QR Code',
                          subtitle: 'Generate QR code for easy sharing',
                          onTap: () => _showQRCode(context),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Share text preview
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Share Message:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _getShareText(),
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[700],
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Cancel button
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  Widget _buildShareOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFBB0000).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xFFBB0000), size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A1A),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  String _getShareText() {
    return '''📱 Check out Kigali Today - Your trusted source for news in Rwanda!

🔴 Breaking news and current events
📰 Multiple categories: Economy, Sports, Technology & more
💾 Save articles for later reading
🔔 Custom notifications for topics you care about
🔍 Smart search to find what matters to you

Download now and stay informed with the latest news from Rwanda and beyond!

Download: https://play.google.com/store/apps/details?id=com.kigalitoday.app

#KigaliToday #RwandaNews #StayInformed''';
  }

  void _shareViaWhatsApp(BuildContext context) {
    Navigator.pop(context);
    // TODO: Implement native sharing via WhatsApp
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Opening WhatsApp...'),
        backgroundColor: Color(0xFFBB0000),
      ),
    );
  }

  void _shareViaEmail(BuildContext context) {
    Navigator.pop(context);
    // TODO: Implement native sharing via email
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Opening email app...'),
        backgroundColor: Color(0xFFBB0000),
      ),
    );
  }

  void _copyLink(BuildContext context) {
    Navigator.pop(context);
    Clipboard.setData(ClipboardData(text: _getShareText()));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Share text copied to clipboard!'),
        backgroundColor: Color(0xFFBB0000),
      ),
    );
  }

  void _showQRCode(BuildContext context) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('QR Code'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.qr_code, size: 80, color: Color(0xFFBB0000)),
                        SizedBox(height: 8),
                        Text(
                          'QR Code',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Scan this QR code to download Kigali Today',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
    );
  }
}
