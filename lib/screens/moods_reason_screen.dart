import 'package:calmi_app/widgets/moods_grid.dart';
import 'package:calmi_app/widgets/skeleton.dart';
import 'package:calmi_app/screens/feelings_screen.dart';
import 'package:flutter/material.dart';

class MoodsReasonScreen extends StatelessWidget {
  const MoodsReasonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      centerWidget: MoodsReasonGrid(),
      nextScreen: FeelingsScreen(),
      title: 'What is the reason that makes you feel that way?',
      buttonText: 'Continue',
    );
  }
}