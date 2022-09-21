import 'package:flutter/material.dart';
import 'package:juno_flutter/router/navigation.dart';

typedef OnTap = Future<void> Function();

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
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!_isLoading) {
          showLoading(true);
          widget.onTap().then((value) {
            showLoading(false);
          });
        }
      },
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (_isLoading)
                  const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                else
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }
}
