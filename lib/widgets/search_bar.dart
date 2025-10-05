import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final VoidCallback? onTap;

  const SearchBar({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
      child: TextField(
        onChanged: onChanged,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16),
          prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        style: const TextStyle(fontSize: 16, color: Color(0xFF1A1A1A)),
      ),
    );
  }
}
