import 'package:flutter/material.dart';
import 'premium_screen.dart';
import 'about_screen.dart';
import 'account_screen.dart';
import 'privacy_policy_screen.dart';
import 'terms_of_service_screen.dart';
import 'feedback_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Premium Section
          Container(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Free Account',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Upgrade to premium for an ad-free experience',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PremiumScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFBB0000),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Go Premium'),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Account Section
          _buildSettingsSection('Account', [
            _buildSettingsItem(
              icon: Icons.person_outline,
              title: 'Account',
              subtitle: 'Manage your account information',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccountScreen(),
                  ),
                );
              },
            ),
          ]),

          const SizedBox(height: 24),

          // Data Saver Section
          _buildSettingsSection('Data Saver', [
            _buildSettingsItem(
              icon: Icons.video_settings_outlined,
              title: 'Video quality',
              subtitle: 'Set your video quality to low',
              trailing: Switch(
                value: false,
                onChanged: (value) {},
                activeColor: const Color(0xFFBB0000),
              ),
              onTap: () {},
            ),
          ]),

          const SizedBox(height: 24),

          // Background Section
          _buildSettingsSection('Background', [
            _buildSettingsItem(
              icon: Icons.picture_in_picture_outlined,
              title: 'Picture-in-picture',
              subtitle: 'Allow video to play on other apps',
              trailing: Switch(
                value: false,
                onChanged: (value) {},
                activeColor: const Color(0xFFBB0000),
              ),
              onTap: () {},
            ),
          ]),

          const SizedBox(height: 24),

          // About Section
          _buildSettingsSection('About', [
            _buildSettingsItem(
              icon: Icons.info_outline,
              title: 'About Kigali Today',
              subtitle: 'Learn more about the app',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),
            _buildSettingsItem(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
              subtitle: 'Read our privacy policy',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicyScreen(),
                  ),
                );
              },
            ),
            _buildSettingsItem(
              icon: Icons.description_outlined,
              title: 'Terms of Service',
              subtitle: 'Read our terms of service',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsOfServiceScreen(),
                  ),
                );
              },
            ),
          ]),

          const SizedBox(height: 24),

          // Feedback Section
          _buildSettingsSection('Feedback', [
            _buildSettingsItem(
              icon: Icons.feedback_outlined,
              title: 'Send Feedback',
              subtitle: 'Help us improve Kigali Today',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeedbackScreen(),
                  ),
                );
              },
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ),
        Container(
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
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
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
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
