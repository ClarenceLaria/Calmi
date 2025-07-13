import 'package:flutter/material.dart';
import 'package:calmi_app/screens/home_screen.dart';

class EntryPoint extends StatefulWidget{
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  final screens = [
    {'title': 'Home','icon': Icons.home,'route': HomeScreen()},
    {'title': 'AI Chat','icon': Icons.chat,'route': Center(child: Text('AI Chat Screen'),),},
    {'title': 'Live Coach','icon': Icons.person,'route': Center(child: Text('Live Coach Screen'),),},
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Calmi App',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ...screens.map((screen) {
              return ListTile(
                leading: Icon(screen['icon'] as IconData),
                title: Text(screen['title'] as String),
                onTap: () {
                  _onItemTapped(screens.indexOf(screen));
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => screen['route'] as Widget),
                  );
                },
              );
            }).toList(),
          ],
        ),
      ),
      body: screens[_selectedIndex]['route'] as Widget,
    );
  }
}