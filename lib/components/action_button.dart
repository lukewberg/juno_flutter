import 'package:flutter/material.dart';
import 'package:juno_flutter/components/action_button.dart';
import 'package:juno_flutter/router/navigation.dart';

typedef void OnTap();

class ActionButton extends StatefulWidget {
  final String text;
  final double? width;
  final Color? color;
  final OnTap onTap;

  const ActionButton(this.text, this.onTap, {Key? key, this.width, this.color})
      : super(key: key);

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        width: widget.width ?? double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: widget.color ?? const Color(0xff6F67AE),
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
            child: Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ActionButtonConfig extends ComponentConfig {
  ActionButtonConfig(super.rawConfig);
}
