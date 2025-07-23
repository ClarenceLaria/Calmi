import 'package:flutter/material.dart';

class MoodsReasonScreen extends StatelessWidget {
  const MoodsReasonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Text(
                'What is the reason that makes you feel that way?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              
            ],
          ),
        ),
      ),
    );
  }
}