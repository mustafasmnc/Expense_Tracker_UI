import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expense_tracker1/pages/budget_page.dart';
import 'package:expense_tracker1/pages/create_budget_page.dart';
import 'package:expense_tracker1/pages/daily_page.dart';
import 'package:expense_tracker1/pages/profile_page.dart';
import 'package:expense_tracker1/pages/stats_page.dart';
import 'package:expense_tracker1/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  final autoSizeGroup = AutoSizeGroup();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: showFab
          ? FloatingActionButton(
              onPressed: () => setTabs(4),
              child: Icon(
                Icons.add,
                size: 25,
              ),
              backgroundColor: primary,
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        DailyPage(),
        StatsPage(),
        BudgetPage(),
        ProfilePage(),
        CreateBudgetPage()
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
    List<String> navItemsTexts = [
      "Daily",
      "Stats",
      "Budget",
      "Profile",
    ];
    return AnimatedBottomNavigationBar.builder(
      itemCount: iconItems.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? primary : black.withOpacity(0.5);
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconItems[index],
              size: 24,
              color: color,
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: AutoSizeText(
                navItemsTexts[index],
                maxLines: 1,
                style: TextStyle(color: color),
                group: autoSizeGroup,
              ),
            )
          ],
        );
      },
      activeIndex: pageIndex,
      onTap: (index) => setTabs(index),
      splashColor: secondary,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.smoothEdge,
      leftCornerRadius: 20,
      rightCornerRadius: 20,
      shadow: BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 12,
        spreadRadius: 0.5,
        color: Colors.grey,
      ),
      //iconSize: 25,
    );
    // return AnimatedBottomNavigationBar(
    //   icons: iconItems,
    //   activeIndex: pageIndex,
    //   onTap: (index) => setTabs(index),
    //   activeColor: primary,
    //   splashColor: secondary,
    //   inactiveColor: black.withOpacity(0.5),
    //   gapLocation: GapLocation.center,
    //   notchSmoothness: NotchSmoothness.smoothEdge,
    //   leftCornerRadius: 20,
    //   rightCornerRadius: 20,
    //   iconSize: 25,
    // );
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
