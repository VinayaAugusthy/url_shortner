 import 'package:flutter/material.dart';

bool isValidUrl(String url) {
    // Define a regular expression pattern for URL validation
    RegExp urlRegExp = RegExp(
      r'^(https?://)?' // Optional scheme (http:// or https://)
      r'(([A-Z0-9-]+\.)+[A-Z]{2,63})' // Domain (example.com)
      r'(/[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|])?' // Optional path
      r'$', // End of string
      caseSensitive: false, // Case-insensitive matching
    );

    // Use the RegExp's hasMatch method to check if the input matches the pattern
    return urlRegExp.hasMatch(url);
  }

  showSnackbar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
     SizedBox height() {
    return const SizedBox(
      height: 10,
    );
  }
  }