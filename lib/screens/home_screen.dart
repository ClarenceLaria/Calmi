import 'package:calmi_app/components/timeline.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> moodImages = [
    {'image': 'assets/icons/angry.png', 'color': Colors.red},
    {'image': 'assets/icons/sad.png', 'color': Colors.orange},
    {'image': 'assets/icons/confused.png', 'color': Color.fromARGB(255,252,193,51)},
    {'image': 'assets/icons/happy.png', 'color': Color.fromARGB(255,152,175,98)},
    {'image': 'assets/icons/happiness.png', 'color': Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.menu),
        ),
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      'Introduction to Mental Health Issues',
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/icons/thank_you.png',
                      height: 50,
                      width: 50,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'How do you feel today?',
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: moodImages.map((img) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Image.asset(
                          img['image'] as String,
                          height: 40,
                          width: 40,
                          color: img['color'] as Color,
                        ),
                      )).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/chatbot.png',
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Chat with Calmi',
                          style: TextStyle(
                            fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/teacher.png',
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Talk to a Coach',
                          style: TextStyle(
                            fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 25),
              Text(
                'Your Plans for Today (0/5)',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 25),
              TimelineWidget(),
            ],
          )
        ),
      )
    );
  }

  Widget MoodCard(String emoji, String mood){
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 220,251,255),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            offset: Offset(0, 2),
          ),
        ]
      ),
      child: Column(
        children: [
          Text(
            emoji,
            style: TextStyle(fontSize: 50),
          ),
          SizedBox(height: 10),
          Text(
            mood,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}