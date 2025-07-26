import 'package:calmi_app/screens/ai_chat.dart';
import 'package:calmi_app/widgets/timeline.dart';
import 'package:calmi_app/screens/moods_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> moodImages = [
    {'image': 'assets/icons/angry.png', 'color': Colors.red},
    {'image': 'assets/icons/sad.png', 'color': Colors.orange},
    {'image': 'assets/icons/confused.png', 'color': Color.fromARGB(255, 252, 193, 51)},
    {'image': 'assets/icons/laugh.png', 'color': Color.fromARGB(255, 152, 175, 98)},
    {'image': 'assets/icons/happy.png', 'color': Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize ?? 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255,245,245,245),
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Introduction to Mental Health Issues',
                        style: TextStyle(
                          fontSize: Theme.of(context).textTheme.bodySmall?.fontSize ?? 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/icons/thank_you.png',
                      height: 150,
                      width: 150,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'How do you feel today?',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Theme.of(context).textTheme.bodySmall?.fontSize ?? 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: moodImages
                          .map((img) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MoodScreen(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    img['image'] as String,
                                    height: 40,
                                    width: 40,
                                    color: img['color'] as Color,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AiChat(),
                          ),
                        );
                      },
                      child: Container(
                        height: 65,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/chatbot.png',
                              height: 50,
                              width: 50,
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                'Chat with Calmi',
                                style: TextStyle(
                                  fontSize: Theme.of(context).textTheme.bodySmall?.fontSize ?? 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/teacher.png',
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              'Talk to a Coach',
                              style: TextStyle(
                                fontSize: Theme.of(context).textTheme.bodySmall?.fontSize ?? 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Text(
                'Your Plans for Today (0/5)',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodySmall?.fontSize ?? 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 25),
              Container(
                height: 300,
                width: double.infinity,
                child: const TimelineWidget()
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
