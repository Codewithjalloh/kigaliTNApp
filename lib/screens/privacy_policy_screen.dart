import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
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
                      Icons.privacy_tip_outlined,
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
                          'Privacy Policy',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Last updated: December 2024',
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

            // Introduction
            _buildSection(
              title: 'Introduction',
              content: 'Welcome to Kigali Today. We are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application.',
            ),

            // Information We Collect
            _buildSection(
              title: 'Information We Collect',
              content: 'We may collect information about you in a variety of ways. The information we may collect via the App includes:',
              subsections: [
                'Personal Data: Name, email address, phone number, and other contact information you voluntarily provide.',
                'Usage Data: Information about how you access and use the App, including your reading preferences, saved articles, and interaction patterns.',
                'Device Information: Device type, operating system, unique device identifiers, and mobile network information.',
                'Location Data: General location information based on your IP address or device settings.',
                'Cookies and Tracking: We use cookies and similar tracking technologies to enhance your experience.',
              ],
            ),

            // How We Use Your Information
            _buildSection(
              title: 'How We Use Your Information',
              content: 'We use the information we collect to:',
              subsections: [
                'Provide, operate, and maintain our news service',
                'Improve, personalize, and expand our App',
                'Understand and analyze how you use our App',
                'Develop new products, services, features, and functionality',
                'Communicate with you for customer service and support',
                'Send you news updates and notifications based on your preferences',
                'Process transactions and send related information',
                'Find and prevent fraud and abuse',
              ],
            ),

            // Information Sharing
            _buildSection(
              title: 'Information Sharing and Disclosure',
              content: 'We do not sell, trade, or otherwise transfer your personal information to third parties without your consent, except in the following circumstances:',
              subsections: [
                'Service Providers: We may share information with trusted third-party service providers who assist us in operating our App.',
                'Legal Requirements: We may disclose information when required by law or to protect our rights and safety.',
                'Business Transfers: In the event of a merger, acquisition, or sale of assets, user information may be transferred.',
                'Consent: We may share information with your explicit consent for specific purposes.',
              ],
            ),

            // Data Security
            _buildSection(
              title: 'Data Security',
              content: 'We implement appropriate technical and organizational security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet or electronic storage is 100% secure.',
            ),

            // Your Rights
            _buildSection(
              title: 'Your Rights and Choices',
              content: 'You have certain rights regarding your personal information:',
              subsections: [
                'Access: You can request access to your personal information we hold.',
                'Correction: You can request correction of inaccurate or incomplete information.',
                'Deletion: You can request deletion of your personal information.',
                'Portability: You can request a copy of your data in a portable format.',
                'Opt-out: You can opt-out of certain communications and data processing.',
                'Withdraw Consent: You can withdraw consent for data processing at any time.',
              ],
            ),

            // Data Retention
            _buildSection(
              title: 'Data Retention',
              content: 'We retain your personal information only for as long as necessary to fulfill the purposes outlined in this Privacy Policy, unless a longer retention period is required or permitted by law.',
            ),

            // Children's Privacy
            _buildSection(
              title: 'Children\'s Privacy',
              content: 'Our App is not intended for children under 13 years of age. We do not knowingly collect personal information from children under 13. If you are a parent or guardian and believe your child has provided us with personal information, please contact us.',
            ),

            // International Transfers
            _buildSection(
              title: 'International Data Transfers',
              content: 'Your information may be transferred to and processed in countries other than your own. We ensure appropriate safeguards are in place to protect your information in accordance with this Privacy Policy.',
            ),

            // Changes to Privacy Policy
            _buildSection(
              title: 'Changes to This Privacy Policy',
              content: 'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last updated" date.',
            ),

            // Contact Information
            _buildSection(
              title: 'Contact Us',
              content: 'If you have any questions about this Privacy Policy or our privacy practices, please contact us at:',
              subsections: [
                'Email: privacy@kigalitoday.com',
                'Phone: +250 788 123 456',
                'Address: Kigali, Rwanda',
                'Website: www.kigalitoday.com',
              ],
            ),

            const SizedBox(height: 32),

            // Footer
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    'Kigali Today Privacy Policy',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This privacy policy is effective as of December 2024 and will remain in effect except with respect to any changes in its provisions in the future.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
    List<String>? subsections,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
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
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
          if (subsections != null) ...[
            const SizedBox(height: 12),
            ...subsections.map((subsection) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6, right: 8),
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Color(0xFFBB0000),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      subsection,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ],
      ),
    );
  }
}
