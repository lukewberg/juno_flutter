import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JunoAppbar extends StatefulWidget with PreferredSizeWidget {
  const JunoAppbar({Key? key}) : super(key: key);

  @override
  State<JunoAppbar> createState() => _JunoAppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class _JunoAppbarState extends State<JunoAppbar> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(
            color: Color(0xff271836),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, color: Colors.black26, offset: Offset(0, 7))
            ],
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xff271836), Color(0xff6F67AE)])),
        child: SafeArea(
          top: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/img/juno_logo.svg',
                      height: 30,
                      color: Colors.white,
                    ),
                    const Spacer(
                      flex: 1,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
