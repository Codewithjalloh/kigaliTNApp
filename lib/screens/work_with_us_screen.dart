import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WorkWithUsScreen extends StatefulWidget {
  const WorkWithUsScreen({super.key});

  @override
  State<WorkWithUsScreen> createState() => _WorkWithUsScreenState();
}

class _WorkWithUsScreenState extends State<WorkWithUsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _companyNameController = TextEditingController();
  final _contactNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _websiteController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _requirementsController = TextEditingController();
  final _budgetController = TextEditingController();

  String _selectedIndustry = '';
  String _selectedCampaignType = '';
  String _selectedDuration = '';
  bool _hasPreviousExperience = false;

  final List<String> _industries = [
    'Technology',
    'Finance & Banking',
    'Healthcare',
    'Education',
    'Retail & E-commerce',
    'Real Estate',
    'Food & Beverage',
    'Travel & Tourism',
    'Automotive',
    'Fashion & Beauty',
    'Sports & Fitness',
    'Entertainment',
    'Government',
    'Non-profit',
    'Other',
  ];

  final List<String> _campaignTypes = [
    'Banner Ads',
    'Sponsored Articles',
    'Video Ads',
    'Newsletter Sponsorship',
    'Social Media Promotion',
    'Event Sponsorship',
    'Brand Partnership',
    'Content Marketing',
    'Other',
  ];

  final List<String> _durations = [
    '1 month',
    '3 months',
    '6 months',
    '1 year',
    'Ongoing',
    'Custom',
  ];

  @override
  void dispose() {
    _companyNameController.dispose();
    _contactNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _websiteController.dispose();
    _descriptionController.dispose();
    _requirementsController.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work with Us'),
        backgroundColor: const Color(0xFFBB0000),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                width: double.infinity,
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
                child: Column(
                  children: [
                    const Icon(Icons.business, color: Colors.white, size: 48),
                    const SizedBox(height: 12),
                    const Text(
                      'Partner with Kigali Today',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Reach thousands of engaged readers across Rwanda',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Company Information Section
              _buildSectionTitle('Company Information'),
              const SizedBox(height: 16),

              _buildTextField(
                controller: _companyNameController,
                label: 'Company Name',
                hint: 'Enter your company name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your company name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: _contactNameController,
                label: 'Contact Person',
                hint: 'Enter contact person name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter contact person name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: _emailController,
                label: 'Email Address',
                hint: 'Enter your email address',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: _phoneController,
                label: 'Phone Number',
                hint: 'Enter your phone number',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: _websiteController,
                label: 'Website (Optional)',
                hint: 'Enter your website URL',
                keyboardType: TextInputType.url,
              ),

              const SizedBox(height: 24),

              // Business Details Section
              _buildSectionTitle('Business Details'),
              const SizedBox(height: 16),

              _buildDropdown(
                label: 'Industry',
                value: _selectedIndustry,
                items: _industries,
                onChanged: (value) {
                  setState(() {
                    _selectedIndustry = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your industry';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: _descriptionController,
                label: 'Company Description',
                hint: 'Tell us about your company and what you do',
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide a company description';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              // Campaign Details Section
              _buildSectionTitle('Campaign Details'),
              const SizedBox(height: 16),

              _buildDropdown(
                label: 'Campaign Type',
                value: _selectedCampaignType,
                items: _campaignTypes,
                onChanged: (value) {
                  setState(() {
                    _selectedCampaignType = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a campaign type';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              _buildDropdown(
                label: 'Campaign Duration',
                value: _selectedDuration,
                items: _durations,
                onChanged: (value) {
                  setState(() {
                    _selectedDuration = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select campaign duration';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: _requirementsController,
                label: 'Specific Requirements',
                hint:
                    'Describe your specific advertising requirements and goals',
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please describe your requirements';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: _budgetController,
                label: 'Budget Range (USD)',
                hint: 'e.g., \$1,000 - \$5,000',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide your budget range';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Previous Experience
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: _hasPreviousExperience,
                      onChanged: (value) {
                        setState(() {
                          _hasPreviousExperience = value!;
                        });
                      },
                      activeColor: const Color(0xFFBB0000),
                    ),
                    const Expanded(
                      child: Text(
                        'I have previous experience with digital advertising',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFBB0000),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Submit Partnership Request',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Contact Info
              SizedBox(
                width: double.infinity,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue[200]!),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                        size: 24,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Need immediate assistance?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Email: partnerships@kigalitoday.com\nPhone: +250 788 123 456',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFBB0000), width: 2),
            ),
            filled: true,
            fillColor: Colors.grey[50],
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value.isEmpty ? null : value,
          items:
              items.map((String item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            hintText: 'Select $label',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFBB0000), width: 2),
            ),
            filled: true,
            fillColor: Colors.grey[50],
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Show success dialog
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Request Submitted'),
              content: const Text(
                'Thank you for your interest in partnering with Kigali Today! We will review your request and get back to you within 2-3 business days.',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    Navigator.pop(context); // Go back to profile screen
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    }
  }
}
