import 'package:flutter/material.dart';
import 'package:netflix/constants/colors.dart';

ValueNotifier<int> indexNotifier = ValueNotifier(0);

class BottomNavBarItems extends StatelessWidget {
  const BottomNavBarItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexNotifier,
        builder: (context, int newindex, _) {
          return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: blackClr,
              currentIndex: newindex,
              onTap: (index) => indexNotifier.value = index,
              selectedItemColor: whiteClr,
              unselectedItemColor: greyClr,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                    ),
                    label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.video_library_outlined,
                    ),
                    label: 'New & Hot'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.emoji_emotions_outlined,
                    ),
                    label: 'Fast Laughs')
              ]);
        });
  }
}
