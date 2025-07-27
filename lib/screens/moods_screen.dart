import 'package:calmi_app/widgets/moods_gauge.dart';
import 'package:calmi_app/core/models/mood_model.dart';
import 'package:calmi_app/screens/moods_reason_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MoodScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class MoodScreen extends StatefulWidget {
  const MoodScreen({super.key});
  
  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  MoodModel? selectedMood;
  void _onMoodSelected(MoodModel mood) {
    setState(() {
      selectedMood = mood;
    });
    debugPrint('Selected mood: ${mood.label}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close, color: Colors.black),
        ),
      ),
      extendBody: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              Text(
                "How do you feel today?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              if (selectedMood != null) ...[
              Text(
                  selectedMood!.emoji,
                  style: TextStyle(fontSize: 100, color: selectedMood!.color),
                ),
                SizedBox(height: 10),
                Text(
                  selectedMood!.label,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
              ] else ...[
                Text(
                  "Choose a mood below",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(height: 30),
              ],
              SizedBox(height: 20),
              MoodsGauge(onMoodSelected: _onMoodSelected,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 0.5),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: selectedMood != null
            ? SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MoodsReasonScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  ),
                  child: Text(
                    "I Feel ${selectedMood!.label}!",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: null, // Disable button if no mood is selected
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                    backgroundColor: Colors.grey, 
                  ),
                  child: Text(
                    "Select a Mood First",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
      ),
    );
  }
}
