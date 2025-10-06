import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
        backgroundColor: const Color(0xFFBB0000),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose your preferred language',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Select a language to change the app interface',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  _buildLanguageCard(
                    context,
                    'Kinyarwanda',
                    '🇷🇼',
                    'Ikinyarwanda',
                    'The official language of Rwanda',
                    'rw',
                    true, // Currently selected (you can make this dynamic)
                  ),
                  const SizedBox(height: 12),
                  _buildLanguageCard(
                    context,
                    'English',
                    '🇺🇸',
                    'English',
                    'International language',
                    'en',
                    false,
                  ),
                  const SizedBox(height: 12),
                  _buildLanguageCard(
                    context,
                    'French',
                    '🇫🇷',
                    'Français',
                    'Language commonly used in Africa',
                    'fr',
                    false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageCard(
    BuildContext context,
    String title,
    String flag,
    String nativeName,
    String description,
    String languageCode,
    bool isSelected,
  ) {
    return Card(
      elevation: isSelected ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? const Color(0xFFBB0000) : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: () => _changeLanguage(context, languageCode),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Flag
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(flag, style: const TextStyle(fontSize: 24)),
                ),
              ),
              const SizedBox(width: 16),
              // Language info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color:
                            isSelected
                                ? const Color(0xFFBB0000)
                                : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      nativeName,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
              // Selection indicator
              if (isSelected)
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Color(0xFFBB0000),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                )
              else
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _changeLanguage(BuildContext context, String languageCode) {
    // Show a snackbar to indicate language change
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          languageCode == 'rw'
              ? 'Ururimi rwihinduye ku Ikinyarwanda'
              : languageCode == 'fr'
              ? 'Langue changée en Français'
              : 'Language changed to English',
        ),
        backgroundColor: const Color(0xFFBB0000),
        duration: const Duration(seconds: 2),
      ),
    );

    // TODO: Implement actual language change logic
    // This would typically involve:
    // 1. Saving the language preference to SharedPreferences
    // 2. Updating the app's locale
    // 3. Restarting the app or rebuilding with new locale
    print('Language changed to: $languageCode');

    // Navigate back to previous screen
    Navigator.pop(context);
  }
}
