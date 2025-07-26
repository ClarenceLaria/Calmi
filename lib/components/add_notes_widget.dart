import 'package:flutter/material.dart';

class AddNotesWidget extends StatelessWidget {
  const AddNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notes (optional)',
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          maxLines: 8,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            hintText: 'Add your notes here...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
            contentPadding: EdgeInsets.all(10),
            fillColor: Color.fromARGB(255, 245, 245, 245),
            filled: true,
          ),
        ),
      ],
    );
  }
}