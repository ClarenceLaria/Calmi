import 'package:calmi_app/components/add_notes_widget.dart';
import 'package:calmi_app/components/skeleton.dart';
import 'package:calmi_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AddNotesScreen extends StatelessWidget {
  const AddNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeleton(
      centerWidget: AddNotesWidget(),
      title: 'Add notes',
      buttonText: 'Save',
      color: Colors.white,
      nextScreen: HomeScreen(),
    );
  }
}