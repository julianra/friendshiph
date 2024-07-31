import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  BottomNavigation({required this.currentIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 40.0,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      color: Colors.cyan.shade400,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            onPressed: () {
              onItemTapped(0);
            },
          ),
          const Spacer(flex: 2),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              onItemTapped(1);
            },
          ),
          const Spacer(flex: 8),
          IconButton(
            icon: const Icon(
              Icons.print,
              color: Colors.black,
            ),
            onPressed: () {
              onItemTapped(2);
            },
          ),
          const Spacer(flex: 2),
          IconButton(
            icon: const Icon(
              Icons.people,
              color: Colors.black,
            ),
            onPressed: () {
              onItemTapped(3);
            },
          ),
        ],
      ),
    );
  }
}
