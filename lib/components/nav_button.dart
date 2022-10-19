import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  final bool? isActive;
  final String title;
  final IconData icon;

  const NavButton(
      {Key? key,
      this.isActive = false,
      required this.title,
      required this.icon})
      : super(key: key);

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.isActive! ? const Color(0xff6F67AE) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if (widget.isActive!)
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 0), // changes position of shadow
            ),
        ],
      ),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        children: [
          Icon(widget.icon,
              color: widget.isActive! ? Colors.white : Colors.black),
          if (widget.isActive!)
            Text(
              widget.title,
              style: TextStyle(
                color: widget.isActive! ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
        ],
      ),
    );
  }
}
