import 'package:calmi_app/components/moods_grid.dart';
import 'package:flutter/material.dart';

class MoodsReasonScreen extends StatelessWidget {
  const MoodsReasonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
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
              MoodsReasonGrid(),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}