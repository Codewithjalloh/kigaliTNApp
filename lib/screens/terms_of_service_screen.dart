import 'package:flutter/material.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
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
                      Icons.description_outlined,
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
                          'Terms of Service',
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
              title: 'Agreement to Terms',
              content: 'By accessing and using the Kigali Today mobile application, you accept and agree to be bound by the terms and provision of this agreement. If you do not agree to abide by the above, please do not use this service.',
            ),

            // Use License
            _buildSection(
              title: 'Use License',
              content: 'Permission is granted to temporarily download one copy of Kigali Today for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not:',
              subsections: [
                'Modify or copy the materials',
                'Use the materials for any commercial purpose or for any public display',
                'Attempt to reverse engineer any software contained in the App',
                'Remove any copyright or other proprietary notations from the materials',
              ],
            ),

            // User Accounts
            _buildSection(
              title: 'User Accounts',
              content: 'When you create an account with us, you must provide information that is accurate, complete, and current at all times. You are responsible for:',
              subsections: [
                'Safeguarding the password and all activities under your account',
                'Notifying us immediately of any unauthorized use of your account',
                'Ensuring your account information remains accurate and up-to-date',
                'Maintaining the confidentiality of your account credentials',
              ],
            ),

            // Acceptable Use
            _buildSection(
              title: 'Acceptable Use Policy',
              content: 'You agree not to use the App in any way that:',
              subsections: [
                'Violates any applicable laws or regulations',
                'Infringes upon the rights of others',
                'Is harmful, threatening, abusive, or harassing',
                'Contains viruses, malware, or other harmful code',
                'Attempts to gain unauthorized access to our systems',
                'Interferes with the proper functioning of the App',
                'Spams or sends unsolicited communications',
              ],
            ),

            // Content and Intellectual Property
            _buildSection(
              title: 'Content and Intellectual Property',
              content: 'The App and its original content, features, and functionality are and will remain the exclusive property of Kigali Today and its licensors. The App is protected by copyright, trademark, and other laws. Our trademarks and trade dress may not be used in connection with any product or service without our prior written consent.',
            ),

            // User-Generated Content
            _buildSection(
              title: 'User-Generated Content',
              content: 'Our App may allow you to post, link, store, share and otherwise make available certain information, text, graphics, videos, or other material. You are responsible for the content that you post to the App, including its legality, reliability, and appropriateness.',
            ),

            // Privacy Policy
            _buildSection(
              title: 'Privacy Policy',
              content: 'Your privacy is important to us. Please review our Privacy Policy, which also governs your use of the App, to understand our practices.',
            ),

            // Prohibited Uses
            _buildSection(
              title: 'Prohibited Uses',
              content: 'You may not use our App:',
              subsections: [
                'For any unlawful purpose or to solicit others to perform unlawful acts',
                'To violate any international, federal, provincial, or state regulations, rules, laws, or local ordinances',
                'To infringe upon or violate our intellectual property rights or the intellectual property rights of others',
                'To harass, abuse, insult, harm, defame, slander, disparage, intimidate, or discriminate',
                'To submit false or misleading information',
                'To upload or transmit viruses or any other type of malicious code',
              ],
            ),

            // Disclaimer
            _buildSection(
              title: 'Disclaimer',
              content: 'The information on this App is provided on an "as is" basis. To the fullest extent permitted by law, this Company excludes all representations, warranties, conditions and terms relating to our App and the use of this App.',
            ),

            // Limitations
            _buildSection(
              title: 'Limitations',
              content: 'In no event shall Kigali Today or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the App, even if Kigali Today or a Kigali Today authorized representative has been notified orally or in writing of the possibility of such damage.',
            ),

            // Accuracy of Materials
            _buildSection(
              title: 'Accuracy of Materials',
              content: 'The materials appearing on Kigali Today could include technical, typographical, or photographic errors. Kigali Today does not warrant that any of the materials on its App are accurate, complete, or current. Kigali Today may make changes to the materials contained on its App at any time without notice.',
            ),

            // Links
            _buildSection(
              title: 'Links',
              content: 'Kigali Today has not reviewed all of the sites linked to our App and is not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by Kigali Today of the site. Use of any such linked website is at the user\'s own risk.',
            ),

            // Modifications
            _buildSection(
              title: 'Modifications',
              content: 'Kigali Today may revise these terms of service for its App at any time without notice. By using this App, you are agreeing to be bound by the then current version of these terms of service.',
            ),

            // Governing Law
            _buildSection(
              title: 'Governing Law',
              content: 'These terms and conditions are governed by and construed in accordance with the laws of Rwanda and you irrevocably submit to the exclusive jurisdiction of the courts in that state or location.',
            ),

            // Termination
            _buildSection(
              title: 'Termination',
              content: 'We may terminate or suspend your account and bar access to the App immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever and without limitation, including but not limited to a breach of the Terms.',
            ),

            // Contact Information
            _buildSection(
              title: 'Contact Information',
              content: 'If you have any questions about these Terms of Service, please contact us at:',
              subsections: [
                'Email: legal@kigalitoday.com',
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
                    'Kigali Today Terms of Service',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'By using Kigali Today, you acknowledge that you have read and understood these terms and agree to be bound by them.',
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
