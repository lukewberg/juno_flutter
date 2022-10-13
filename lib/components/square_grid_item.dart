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
      color: Colors.red,
      child: Column(
        children: [
          // Image.network(imageUrl, errorBuilder: (context, error, stackTrace) {
          //   return const Icon(Icons.error);
          // }),
          Text(title),
          if (subtitle != null) Text(subtitle!),
        ],
      ),
    );
  }
}
