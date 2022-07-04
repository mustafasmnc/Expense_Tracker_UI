import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:expense_tracker1/pages/daily_page.dart';
import 'package:expense_tracker1/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[300],
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setTabs(4),
        child: Icon(
          Icons.add,
          size: 25,
        ),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        DailyPage(),
        Center(
          child: Text('Stats page'),
        ),
        Center(
          child: Text('Budget page'),
        ),
        Center(
          child: Text('Profile page'),
        ),
        Center(
          child: Text('Create budget page'),
        ),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.md_calculator,
      Ionicons.md_stats,
      Ionicons.md_wallet,
      Ionicons.md_person,
    ];
    return AnimatedBottomNavigationBar(
      icons: iconItems,
      activeIndex: pageIndex,
      onTap: (index) => setTabs(index),
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: black.withOpacity(0.5),
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.sharpEdge,
      leftCornerRadius: 10,
      rightCornerRadius: 10,
      iconSize: 25,
    );
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
