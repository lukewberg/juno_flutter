import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/app_service.dart';

class SquareGridItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String? subtitle;

  const SquareGridItem(
      {Key? key, required this.title, required this.imageUrl, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s3Config = Provider.of<AppService>(context).appConfig.s3BucketUrl;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff6F67AE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
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
              fit: BoxFit.cover,
            ),
          ),
          Text(title),
          if (subtitle != null) Text(subtitle!),
        ],
      ),
    );
  }
}
