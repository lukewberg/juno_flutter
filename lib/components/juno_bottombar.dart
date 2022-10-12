import 'dart:ui';

import 'package:flutter/material.dart';

class JunoBottomBar extends StatefulWidget {
  const JunoBottomBar({Key? key}) : super(key: key);

  @override
  State<JunoBottomBar> createState() => _JunoBottomBarState();
}

class _JunoBottomBarState extends State<JunoBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                splashColor: Colors.blue,
                onPressed: () {},
                icon: const Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
