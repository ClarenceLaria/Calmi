import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TimelineWidget extends StatefulWidget {
  const TimelineWidget({super.key});

  @override
  State<TimelineWidget> createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<TimelineWidget> {
  final List<Map<String, dynamic>> timelineItems = [
    {'title': 'Meditation', 'description': 'Intro to Meditation', 'length': '8 mins', 'image': 'assets/icons/meditation.png'},
    {'title': 'Mindfulness', 'description': 'Mindfulness Practices', 'length': '10 mins', 'image': 'assets/icons/mindfulness.png'},
    {'title': 'Journaling', 'description': 'Journaling Techniques', 'length': '5 mins', 'image': 'assets/icons/journaling.png'},
    {'title': 'Breathing', 'description': 'Breathing Techniques', 'length': '5 mins', 'image': 'assets/icons/mindfulness.png'},
    {'title': 'Yoga', 'description': 'Yoga for Relaxation', 'length': '10 mins', 'image': 'assets/icons/yoga.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      theme: TimelineThemeData(
        color: Theme.of(context).primaryColor,
        indicatorTheme: IndicatorThemeData(
          size: 20,
          color: Theme.of(context).primaryColor,
        ),
        connectorTheme: ConnectorThemeData(
          color: Theme.of(context).primaryColor,
          thickness: 2,
        ),
      ),
      builder: TimelineTileBuilder.fromStyle(
        contentsAlign: ContentsAlign.basic,
        connectorStyle: ConnectorStyle.dashedLine,
        indicatorStyle: IndicatorStyle.outlined,
        contentsBuilder: (context, index) => _activityCard(timelineItems[index]),
        itemCount: timelineItems.length,
      ),
    );
  }

  Widget _activityCard(Map<String, dynamic> item){
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                item['title'] as String,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 4),
              Text(
                item['description'] as String,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                item['length'] as String,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          Spacer(),
          Image.asset(
            item['image'] as String,
            height: 50,
            width: 50,
          ),
        ],
      ),
    );
  }
}