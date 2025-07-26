import 'package:calmi_app/widgets/feelings_grid.dart';
import 'package:calmi_app/widgets/skeleton.dart';
import 'package:calmi_app/screens/add_notes_screen.dart';
import 'package:flutter/material.dart';

class FeelingsScreen extends StatelessWidget {
  const FeelingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      centerWidget: FeelingsGrid(),
      nextScreen: AddNotesScreen(),
      title: 'What is the reason that makes you feel that way?',
      buttonText: 'Continue',
    );
  }
}