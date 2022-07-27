import 'package:flutter/material.dart';

class JunoAppbar extends StatefulWidget {
  const JunoAppbar({Key? key}) : super(key: key);

  @override
  State<JunoAppbar> createState() => _JunoAppbarState();
}

class _JunoAppbarState extends State<JunoAppbar> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(decoration: const BoxDecoration(
      color: Color(0xff271836),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Text("Juno", style: TextStyle(
              color: Colors.white
          )),
        )
      ],
    )
    );

  }
}
