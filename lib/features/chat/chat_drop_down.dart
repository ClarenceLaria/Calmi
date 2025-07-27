import 'package:calmi_app/core/repositories/data.dart';
import 'package:flutter/material.dart';

class ChatDropDown extends StatelessWidget {
  const ChatDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          ...chatDropDownItems.map((item) {
            return ListTile(
              leading: Image.asset(item['icon'], width: 16, height: 16, color: item['color']),
              title: Text(
                item['title'],
                style: TextStyle(
                  fontSize: 12,
                  color: item['color'],
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: item['function'],
            );
          }),
        ],
      ),
    );
  }
}