import 'package:flutter/material.dart';
import 'package:juno_flutter/api/models/content.dart';

class SquareSlide extends StatelessWidget {
  final Content content;

  const SquareSlide({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Image.network(
              content.image ?? '',
              fit: BoxFit.cover,
            ),
            Text(content.name),
          ],
        ),
      ),
    );
  }
}
