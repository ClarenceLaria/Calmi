import 'package:calmi_app/components/moods_gauge.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MoodScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class MoodScreen extends StatefulWidget {
  @override
  _MoodScreenState createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  int selectedMood = 1;

  final List<Map<String, dynamic>> moods = [
    {"emoji": "😡", "label": "Angry", "color": Colors.red},
    {"emoji": "😟", "label": "Not Good", "color": Colors.orange},
    {"emoji": "😐", "label": "Okay", "color": Colors.amber},
    {"emoji": "🙂", "label": "Good", "color": Colors.lightGreen},
    {"emoji": "😄", "label": "Great", "color": Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    final mood = moods[selectedMood];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.close, size: 30),
              ),
              SizedBox(height: 20),
              Text(
                "How do you feel today?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Text(
                mood['emoji'],
                style: TextStyle(fontSize: 100, color: mood['color']),
              ),
              SizedBox(height: 10),
              Text(
                mood['label'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              MoodsGauge(mood: mood,),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Save mood or navigate
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  ),
                  child: Text(
                    "I Feel ${mood['label']}!",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
