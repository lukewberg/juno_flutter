import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:juno_flutter/components/nav_button.dart';

class JunoBottomBar extends StatefulWidget {
  final int currentIndex;

  const JunoBottomBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<JunoBottomBar> createState() => _JunoBottomBarState();
}

class _JunoBottomBarState extends State<JunoBottomBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10, color: Colors.black26, offset: Offset(0, 7))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: const [
                NavButton(
                  isActive: true,
                  title: "Home",
                  icon: Icons.home,
                ),
                NavButton(
                  title: "Search",
                  icon: Icons.search,
                ),
                NavButton(
                  title: "Messages",
                  icon: Icons.chat_bubble_rounded,
                ),
                NavButton(
                  title: "Profile",
                  icon: Icons.person,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
