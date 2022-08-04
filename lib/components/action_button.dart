import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final double? width;
  const ActionButton({Key? key, this.width}) : super(key: key);

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: widget.width ?? double.infinity,
        child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xff6F67AE),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 10, color: Colors.black26, offset: Offset(0, 7)),
              ],
            ),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: const Text(
                'Log In',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            )),
      ),
    );
  }
}
