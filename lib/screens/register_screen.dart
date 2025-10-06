import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _agreeToTerms = false;

  // New fields for enhanced registration
  String? _selectedDistrict;
  String? _selectedLanguage;
  List<String> _selectedInterests = [];
  String? _selectedUserType;
  String? _selectedAgeRange;
  String? _selectedIncomeLevel;
  String? _selectedEducation;
  String? _selectedArticleLength;
  String? _selectedReadingTime;
  List<String> _selectedContentTypes = [];
  String? _selectedNewsFrequency;
  String? _selectedDeviceUsage;
  String? _selectedEngagementLevel;

  // Rwanda districts
  final List<String> _districts = [
    'Kigali City',
    'Gasabo',
    'Kicukiro',
    'Nyarugenge',
    'Bugesera',
    'Gatsibo',
    'Kayonza',
    'Kirehe',
    'Ngoma',
    'Nyagatare',
    'Rwamagana',
    'Burera',
    'Gakenke',
    'Gicumbi',
    'Musanze',
    'Rulindo',
    'Gisagara',
    'Huye',
    'Kamonyi',
    'Muhanga',
    'Nyamagabe',
    'Nyanza',
    'Nyaruguru',
    'Ruhango',
    'Karongi',
    'Ngororero',
    'Nyabihu',
    'Nyamasheke',
    'Rubavu',
    'Rusizi',
    'Rutsiro',
    'Other',
  ];

  // News categories
  final List<String> _newsCategories = [
    'Politics & Government',
    'Business & Economy',
    'Sports',
    'Technology',
    'Health',
    'Education',
    'Entertainment',
    'International News',
    'Local News',
    'Crime & Security',
  ];

  // Languages
  final List<String> _languages = ['Kinyarwanda', 'English', 'French'];

  // User Types/Professions
  final List<String> _userTypes = [
    'Student',
    'Government Employee',
    'Business Owner',
    'Private Sector Employee',
    'Journalist/Media',
    'NGO Worker',
    'Healthcare Worker',
    'Teacher/Educator',
    'Farmer',
    'Retiree',
    'Unemployed',
    'Other',
  ];

  // Age Ranges
  final List<String> _ageRanges = [
    '18-24',
    '25-34',
    '35-44',
    '45-54',
    '55-64',
    '65+',
  ];

  // Income Levels (in RWF)
  final List<String> _incomeLevels = [
    'Under 100,000 RWF',
    '100,000 - 300,000 RWF',
    '300,000 - 500,000 RWF',
    '500,000 - 1,000,000 RWF',
    '1,000,000 - 2,000,000 RWF',
    'Over 2,000,000 RWF',
    'Prefer not to say',
  ];

  // Education Levels
  final List<String> _educationLevels = [
    'Primary School',
    'Secondary School',
    'High School',
    'Diploma/Certificate',
    'Bachelor\'s Degree',
    'Master\'s Degree',
    'PhD/Doctorate',
    'Other',
  ];

  // Article Length Preferences
  final List<String> _articleLengths = [
    'Short (1-2 minutes)',
    'Medium (3-5 minutes)',
    'Long (5+ minutes)',
    'No preference',
  ];

  // Reading Time Preferences
  final List<String> _readingTimes = [
    'Early Morning (6-9 AM)',
    'Morning (9-12 PM)',
    'Afternoon (12-5 PM)',
    'Evening (5-9 PM)',
    'Night (9 PM+)',
    'No specific time',
  ];

  // Content Types
  final List<String> _contentTypes = [
    'Text Articles',
    'Video Content',
    'Audio/Podcasts',
    'Infographics',
    'Live Updates',
    'Photo Galleries',
  ];

  // News Consumption Frequency
  final List<String> _newsFrequencies = [
    'Multiple times daily',
    'Once daily',
    'Few times a week',
    'Weekly',
    'Occasionally',
  ];

  // Device Usage
  final List<String> _deviceUsage = [
    'Mobile phone only',
    'Mobile + Computer',
    'Computer only',
    'Tablet + Mobile',
    'All devices equally',
  ];

  // Engagement Level
  final List<String> _engagementLevels = [
    'Passive reader',
    'Occasional commenter',
    'Active commenter',
    'Content sharer',
    'Content creator',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Create Account'),
        backgroundColor: const Color(0xFFBB0000),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              // Logo and Welcome Text
              Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFFBB0000),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'KT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Join Kigali Today',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Create your account to get started',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Full Name Field
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFBB0000)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  if (value.length < 2) {
                    return 'Name must be at least 2 characters';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Email Field
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFBB0000)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Password Field
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Create a password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFBB0000)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Confirm Password Field
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm your password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFBB0000)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // District Selection
              DropdownButtonFormField<String>(
                value: _selectedDistrict,
                decoration: InputDecoration(
                  labelText: 'District (Optional)',
                  hintText: 'Select your district',
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFBB0000)),
                  ),
                ),
                items:
                    _districts.map((String district) {
                      return DropdownMenuItem<String>(
                        value: district,
                        child: Text(district),
                      );
                    }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDistrict = newValue;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Language Preference
              DropdownButtonFormField<String>(
                value: _selectedLanguage,
                decoration: InputDecoration(
                  labelText: 'Preferred Language (Optional)',
                  hintText: 'Select your preferred language',
                  prefixIcon: const Icon(Icons.language_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFBB0000)),
                  ),
                ),
                items:
                    _languages.map((String language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLanguage = newValue;
                  });
                },
              ),

              const SizedBox(height: 20),

              // News Interests Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'News Interests (Optional)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Select topics you\'re interested in:',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        _newsCategories.map((String category) {
                          final isSelected = _selectedInterests.contains(
                            category,
                          );
                          return FilterChip(
                            label: Text(
                              category,
                              style: TextStyle(
                                color:
                                    isSelected
                                        ? Colors.white
                                        : const Color(0xFFBB0000),
                                fontSize: 12,
                              ),
                            ),
                            selected: isSelected,
                            onSelected: (bool selected) {
                              setState(() {
                                if (selected) {
                                  _selectedInterests.add(category);
                                } else {
                                  _selectedInterests.remove(category);
                                }
                              });
                            },
                            backgroundColor: Colors.white,
                            selectedColor: const Color(0xFFBB0000),
                            checkmarkColor: Colors.white,
                            side: BorderSide(
                              color: const Color(0xFFBB0000),
                              width: 1,
                            ),
                          );
                        }).toList(),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // User Type/Profession
              DropdownButtonFormField<String>(
                value: _selectedUserType,
                decoration: InputDecoration(
                  labelText: 'Profession/User Type (Optional)',
                  hintText: 'Select your profession',
                  prefixIcon: const Icon(Icons.work_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFBB0000)),
                  ),
                ),
                items:
                    _userTypes.map((String userType) {
                      return DropdownMenuItem<String>(
                        value: userType,
                        child: Text(userType),
                      );
                    }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedUserType = newValue;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Demographics Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Demographics (Optional)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Age Range
                  DropdownButtonFormField<String>(
                    value: _selectedAgeRange,
                    decoration: InputDecoration(
                      labelText: 'Age Range',
                      hintText: 'Select your age range',
                      prefixIcon: const Icon(Icons.cake_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFBB0000)),
                      ),
                    ),
                    items:
                        _ageRanges.map((String ageRange) {
                          return DropdownMenuItem<String>(
                            value: ageRange,
                            child: Text(ageRange),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedAgeRange = newValue;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  // Income Level
                  DropdownButtonFormField<String>(
                    value: _selectedIncomeLevel,
                    decoration: InputDecoration(
                      labelText: 'Monthly Income Range',
                      hintText: 'Select your income range',
                      prefixIcon: const Icon(Icons.attach_money_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFBB0000)),
                      ),
                    ),
                    items:
                        _incomeLevels.map((String incomeLevel) {
                          return DropdownMenuItem<String>(
                            value: incomeLevel,
                            child: Text(incomeLevel),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedIncomeLevel = newValue;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  // Education Level
                  DropdownButtonFormField<String>(
                    value: _selectedEducation,
                    decoration: InputDecoration(
                      labelText: 'Education Level',
                      hintText: 'Select your education level',
                      prefixIcon: const Icon(Icons.school_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFBB0000)),
                      ),
                    ),
                    items:
                        _educationLevels.map((String education) {
                          return DropdownMenuItem<String>(
                            value: education,
                            child: Text(education),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedEducation = newValue;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Content Preferences Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Content Preferences (Optional)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Article Length
                  DropdownButtonFormField<String>(
                    value: _selectedArticleLength,
                    decoration: InputDecoration(
                      labelText: 'Preferred Article Length',
                      hintText: 'Select article length preference',
                      prefixIcon: const Icon(Icons.article_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFBB0000)),
                      ),
                    ),
                    items:
                        _articleLengths.map((String length) {
                          return DropdownMenuItem<String>(
                            value: length,
                            child: Text(length),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedArticleLength = newValue;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  // Reading Time
                  DropdownButtonFormField<String>(
                    value: _selectedReadingTime,
                    decoration: InputDecoration(
                      labelText: 'Preferred Reading Time',
                      hintText: 'When do you usually read news?',
                      prefixIcon: const Icon(Icons.access_time_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFBB0000)),
                      ),
                    ),
                    items:
                        _readingTimes.map((String time) {
                          return DropdownMenuItem<String>(
                            value: time,
                            child: Text(time),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedReadingTime = newValue;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  // Content Types
                  Text(
                    'Preferred Content Types:',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        _contentTypes.map((String contentType) {
                          final isSelected = _selectedContentTypes.contains(
                            contentType,
                          );
                          return FilterChip(
                            label: Text(
                              contentType,
                              style: TextStyle(
                                color:
                                    isSelected
                                        ? Colors.white
                                        : const Color(0xFFBB0000),
                                fontSize: 12,
                              ),
                            ),
                            selected: isSelected,
                            onSelected: (bool selected) {
                              setState(() {
                                if (selected) {
                                  _selectedContentTypes.add(contentType);
                                } else {
                                  _selectedContentTypes.remove(contentType);
                                }
                              });
                            },
                            backgroundColor: Colors.white,
                            selectedColor: const Color(0xFFBB0000),
                            checkmarkColor: Colors.white,
                            side: BorderSide(
                              color: const Color(0xFFBB0000),
                              width: 1,
                            ),
                          );
                        }).toList(),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Behavioral Data Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'News Consumption Habits (Optional)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // News Frequency
                  DropdownButtonFormField<String>(
                    value: _selectedNewsFrequency,
                    decoration: InputDecoration(
                      labelText: 'How often do you read news?',
                      hintText: 'Select your news consumption frequency',
                      prefixIcon: const Icon(Icons.schedule_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFBB0000)),
                      ),
                    ),
                    items:
                        _newsFrequencies.map((String frequency) {
                          return DropdownMenuItem<String>(
                            value: frequency,
                            child: Text(frequency),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedNewsFrequency = newValue;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  // Device Usage
                  DropdownButtonFormField<String>(
                    value: _selectedDeviceUsage,
                    decoration: InputDecoration(
                      labelText: 'Primary Device for News',
                      hintText: 'How do you usually access news?',
                      prefixIcon: const Icon(Icons.devices_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFBB0000)),
                      ),
                    ),
                    items:
                        _deviceUsage.map((String device) {
                          return DropdownMenuItem<String>(
                            value: device,
                            child: Text(device),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedDeviceUsage = newValue;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  // Engagement Level
                  DropdownButtonFormField<String>(
                    value: _selectedEngagementLevel,
                    decoration: InputDecoration(
                      labelText: 'Engagement Level',
                      hintText: 'How do you typically engage with news?',
                      prefixIcon: const Icon(Icons.thumb_up_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFBB0000)),
                      ),
                    ),
                    items:
                        _engagementLevels.map((String engagement) {
                          return DropdownMenuItem<String>(
                            value: engagement,
                            child: Text(engagement),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedEngagementLevel = newValue;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Terms and Conditions
              Row(
                children: [
                  Checkbox(
                    value: _agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value ?? false;
                      });
                    },
                    activeColor: const Color(0xFFBB0000),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                        children: [
                          const TextSpan(text: 'I agree to the '),
                          TextSpan(
                            text: 'Terms of Service',
                            style: const TextStyle(
                              color: Color(0xFFBB0000),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: const TextStyle(
                              color: Color(0xFFBB0000),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Create Account Button
              ElevatedButton(
                onPressed: _agreeToTerms ? _register : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBB0000),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Create Account',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 24),

              // Divider
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[300])),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'OR',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey[300])),
                ],
              ),

              const SizedBox(height: 24),

              // Social Register Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // TODO: Implement Google sign up
                      },
                      icon: const Icon(Icons.g_mobiledata, size: 24),
                      label: const Text('Google'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // TODO: Implement Facebook sign up
                      },
                      icon: const Icon(Icons.facebook, size: 24),
                      label: const Text('Facebook'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Sign In Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color(0xFFBB0000),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Collect all registration data
      final registrationData = {
        // Basic Information
        'name': _nameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,

        // Location & Language
        'district': _selectedDistrict,
        'language': _selectedLanguage,

        // Content Preferences
        'interests': _selectedInterests,
        'contentTypes': _selectedContentTypes,
        'articleLength': _selectedArticleLength,
        'readingTime': _selectedReadingTime,

        // Demographics
        'userType': _selectedUserType,
        'ageRange': _selectedAgeRange,
        'incomeLevel': _selectedIncomeLevel,
        'education': _selectedEducation,

        // Behavioral Data
        'newsFrequency': _selectedNewsFrequency,
        'deviceUsage': _selectedDeviceUsage,
        'engagementLevel': _selectedEngagementLevel,

        // Metadata
        'timestamp': DateTime.now().toIso8601String(),
        'registrationVersion': '2.0', // Track form version
        'dataCompleteness': _calculateDataCompleteness(),
      };

      // TODO: Implement actual registration logic
      // Send registrationData to your backend
      print('Registration Data: $registrationData');

      // Calculate completion percentage
      final completionPercentage = _calculateDataCompleteness();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Account created successfully!'),
              if (_selectedInterests.isNotEmpty ||
                  _selectedContentTypes.isNotEmpty)
                const Text('✓ Personalized news feed enabled'),
              if (_selectedDistrict != null)
                const Text('✓ Local news delivery configured'),
              if (_selectedLanguage != null)
                const Text('✓ Language preference saved'),
              if (completionPercentage > 50)
                Text('✓ Profile ${completionPercentage}% complete'),
            ],
          ),
          backgroundColor: const Color(0xFFBB0000),
          duration: const Duration(seconds: 4),
        ),
      );

      // Navigate to login screen after successful registration
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      });
    }
  }

  int _calculateDataCompleteness() {
    int completedFields = 0;
    int totalOptionalFields = 12; // Total optional fields we're tracking

    // Check each optional field
    if (_selectedDistrict != null) completedFields++;
    if (_selectedLanguage != null) completedFields++;
    if (_selectedInterests.isNotEmpty) completedFields++;
    if (_selectedUserType != null) completedFields++;
    if (_selectedAgeRange != null) completedFields++;
    if (_selectedIncomeLevel != null) completedFields++;
    if (_selectedEducation != null) completedFields++;
    if (_selectedArticleLength != null) completedFields++;
    if (_selectedReadingTime != null) completedFields++;
    if (_selectedContentTypes.isNotEmpty) completedFields++;
    if (_selectedNewsFrequency != null) completedFields++;
    if (_selectedDeviceUsage != null) completedFields++;
    if (_selectedEngagementLevel != null) completedFields++;

    return ((completedFields / totalOptionalFields) * 100).round();
  }
}
