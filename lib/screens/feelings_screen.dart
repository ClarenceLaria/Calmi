import 'package:calmi_app/components/feelings_grid.dart';
import 'package:calmi_app/components/skeleton.dart';
import 'package:flutter/material.dart';

class FeelingsScreen extends StatelessWidget {
  const FeelingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      gridWidget: FeelingsGrid(),
      nexScreen: null,
      title: 'What is the reason that makes you feel that way?',
      buttonText: 'Continue',
    );
  }
}