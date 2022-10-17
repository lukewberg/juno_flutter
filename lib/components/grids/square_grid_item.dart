import 'package:flutter/material.dart';
import 'package:juno_flutter/components/image_helper.dart';
import 'package:juno_flutter/services/app_service.dart';
import 'package:provider/provider.dart';

typedef OnTap = void Function();

class SquareGridItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String? subtitle;
  final OnTap? onTap;

  const SquareGridItem(
      {Key? key,
      required this.title,
      required this.imageUrl,
      this.subtitle,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s3Config = Provider.of<AppService>(context).appConfig.s3BucketUrl;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff6F67AE),
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: ImageHelper(
                imageUrl: Uri.parse(imageUrl).isAbsolute
                    ? imageUrl
                    : s3Config + imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (subtitle != null) Text(subtitle!),
        ],
      ),
    );
  }
}
