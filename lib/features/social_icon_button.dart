import 'package:flutter/material.dart';

class SocialIconButton extends StatelessWidget {
  final Widget icon;

  const SocialIconButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 48,
        width: 72,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        child: icon,
      ),
    );
  }
}