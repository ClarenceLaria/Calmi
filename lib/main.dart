import 'package:calmi_app/providers/chat_search_provider.dart';
import 'package:calmi_app/widgets/entry_point.dart';
import 'package:calmi_app/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatSearchProvider()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calmi app',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const EntryPoint(),
    );
  }
}