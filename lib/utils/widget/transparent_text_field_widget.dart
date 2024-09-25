import 'package:flutter/material.dart';

class TransparentSearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSearch;

  TransparentSearchField({required this.onSearch , required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onSearch, // Trigger the search logic when text changes
      style: TextStyle(color: Colors.white), // Adjust the text color
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.1), // Make the field transparent
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)), // Hint style
        prefixIcon: Icon(Icons.search, color: Colors.white), // Add search icon
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // Rounded border
          borderSide: BorderSide.none, // No border to make it smooth
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.5)), // Border color for enabled state
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white), // Border color for focused state
        ),
      ),
    );
  }
}
