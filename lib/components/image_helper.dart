import 'package:flutter/material.dart';

class ImageHelper extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;

  const ImageHelper({Key? key, required this.imageUrl, required this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: fit,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.block_outlined, color: Colors.white, size: 75);
      },
    );
  }
}
