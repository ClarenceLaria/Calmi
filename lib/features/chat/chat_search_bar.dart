import 'package:flutter/material.dart';

class ChatSearchBar extends StatelessWidget {
  final VoidCallback onToggle;

  ChatSearchBar({
    super.key,
    required this.onToggle,
  });

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500
        ),
        focusNode: _focusNode,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 245, 245, 245),
          filled: true,
          hintText: 'Search...',
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(Icons.search, color: Colors.black, size: 18),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.expand_more, size: 18, color: Colors.black),
                onPressed: onToggle,
              ),

              IconButton(
                icon: const Icon(Icons.expand_less, size: 18, color: Colors.black),
                onPressed: onToggle,
              ),
            ],
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
