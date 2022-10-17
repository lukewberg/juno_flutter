import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:juno_flutter/components/nav_button.dart';

class JunoBottomBar extends StatefulWidget {
  const JunoBottomBar({Key? key}) : super(key: key);

  @override
  State<JunoBottomBar> createState() => _JunoBottomBarState();
}

class _JunoBottomBarState extends State<JunoBottomBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              NavButton(),
              NavButton(),
              NavButton(),
              NavButton(),
            ],
          ),
        ),
      ),
    );
  }
}
