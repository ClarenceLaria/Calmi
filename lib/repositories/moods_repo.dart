import 'package:flutter/material.dart';
import 'package:calmi_app/models/mood_model.dart';

final List<MoodModel> moodsList = [
  MoodModel(emoji: "😡", label: "Angry", color: Colors.red),
  MoodModel(emoji: "😟", label: "Not Good", color: Colors.orange),
  MoodModel(emoji: "😐", label: "Okay", color: Colors.amber),
  MoodModel(emoji: "🙂", label: "Good", color: Colors.lightGreen),
  MoodModel(emoji: "😄", label: "Great", color: Colors.green),
];