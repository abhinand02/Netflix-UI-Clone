import 'package:flutter/material.dart';
import 'package:netflix/screens/Fast%20Laughs/fast_laughs.dart';
import 'package:netflix/screens/Home/home_screen.dart';
import 'package:netflix/screens/Home/widget/bottomnavbar.dart';
import 'package:netflix/screens/New%20&%20Hot/new_hot.dart';
import 'package:netflix/screens/search/search.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});

  final _pages =  [
   const HomeScreen(),
    Search(),
   const NewAndHot(),
   const FastLaughs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexNotifier,
        builder: (context, index, _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavBarItems(),
    );
  }
}
