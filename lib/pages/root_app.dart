import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fincance/pages/home_page.dart';
import 'package:flutter_fincance/pages/player_list.dart';
import 'package:flutter_fincance/pages/profile_page.dart';
import 'package:flutter_fincance/pages/transactions_page.dart';
import 'package:flutter_fincance/theme/color.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'accont_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setTabs(4);
        },
        child: const Icon(Icons.add, size: 25),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        Center(
          child: HomePage(),
        ),
        Center(
          child: TransactionPage(),
        ),
        Center(
          child: AccontPage(),
        ),
        Center(
          child: ProfilePage(),
        ),
        Center(
          child: PlaylistScreen(),//Text("Adicionar"),
        ),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.md_calendar,
      Ionicons.md_stats,
      Ionicons.md_wallet,
      Ionicons.md_person,
    ];
    return AnimatedBottomNavigationBar(
        icons: iconItems,
        activeColor: primary,
        splashColor: secondary,
        inactiveColor: black.withOpacity(0.5),
        activeIndex: pageIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        iconSize: 25,
        rightCornerRadius: 10,
        onTap: (index) {
          setTabs(index);
        });
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
