import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _breakingNewsEnabled = true;
  bool _dailyDigestEnabled = true;
  bool _sportsNewsEnabled = false;
  bool _economyNewsEnabled = true;
  bool _technologyNewsEnabled = false;
  bool _pushNotificationsEnabled = true;
  bool _emailNotificationsEnabled = false;
  bool _smsNotificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: const Color(0xFFBB0000),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
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
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.notifications_active,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Stay Updated',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Customize your notification preferences',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // General Notifications
            _buildSectionTitle('General Notifications'),
            const SizedBox(height: 12),

            _buildNotificationTile(
              title: 'Push Notifications',
              subtitle: 'Receive push notifications on your device',
              value: _pushNotificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _pushNotificationsEnabled = value;
                });
              },
            ),

            _buildNotificationTile(
              title: 'Email Notifications',
              subtitle: 'Receive notifications via email',
              value: _emailNotificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _emailNotificationsEnabled = value;
                });
              },
            ),

            _buildNotificationTile(
              title: 'SMS Notifications',
              subtitle: 'Receive notifications via SMS',
              value: _smsNotificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _smsNotificationsEnabled = value;
                });
              },
            ),

            const SizedBox(height: 24),

            // News Categories
            _buildSectionTitle('News Categories'),
            const SizedBox(height: 12),

            _buildNotificationTile(
              title: 'Breaking News',
              subtitle: 'Get notified about breaking news immediately',
              value: _breakingNewsEnabled,
              onChanged: (value) {
                setState(() {
                  _breakingNewsEnabled = value;
                });
              },
            ),

            _buildNotificationTile(
              title: 'Daily Digest',
              subtitle: 'Receive a daily summary of top stories',
              value: _dailyDigestEnabled,
              onChanged: (value) {
                setState(() {
                  _dailyDigestEnabled = value;
                });
              },
            ),

            _buildNotificationTile(
              title: 'Sports News',
              subtitle: 'Get updates on sports and matches',
              value: _sportsNewsEnabled,
              onChanged: (value) {
                setState(() {
                  _sportsNewsEnabled = value;
                });
              },
            ),

            _buildNotificationTile(
              title: 'Economy News',
              subtitle: 'Stay updated on economic developments',
              value: _economyNewsEnabled,
              onChanged: (value) {
                setState(() {
                  _economyNewsEnabled = value;
                });
              },
            ),

            _buildNotificationTile(
              title: 'Technology News',
              subtitle: 'Get the latest tech updates',
              value: _technologyNewsEnabled,
              onChanged: (value) {
                setState(() {
                  _technologyNewsEnabled = value;
                });
              },
            ),

            const SizedBox(height: 24),

            // Notification Timing
            _buildSectionTitle('Notification Timing'),
            const SizedBox(height: 12),

            _buildTimeTile(
              title: 'Quiet Hours',
              subtitle: 'Set times when you don\'t want notifications',
              onTap: () {
                _showQuietHoursDialog();
              },
            ),

            _buildTimeTile(
              title: 'Daily Digest Time',
              subtitle: 'Choose when to receive your daily digest',
              onTap: () {
                _showDigestTimeDialog();
              },
            ),

            const SizedBox(height: 32),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveSettings,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBB0000),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Save Settings',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1A1A1A),
      ),
    );
  }

  Widget _buildNotificationTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
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
      child: SwitchListTile(
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
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFFBB0000),
      ),
    );
  }

  Widget _buildTimeTile({
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

  void _showQuietHoursDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Quiet Hours'),
            content: const Text(
              'Set quiet hours when you don\'t want to receive notifications.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBB0000),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Set'),
              ),
            ],
          ),
    );
  }

  void _showDigestTimeDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Daily Digest Time'),
            content: const Text(
              'Choose when you want to receive your daily news digest.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBB0000),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Set'),
              ),
            ],
          ),
    );
  }

  void _saveSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notification settings saved successfully!'),
        backgroundColor: Color(0xFFBB0000),
      ),
    );
  }
}
