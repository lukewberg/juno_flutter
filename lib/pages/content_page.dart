import 'package:flutter/material.dart';
import 'package:juno_flutter/api/models/content.dart';
import 'package:juno_flutter/components/image_helper.dart';
import 'package:juno_flutter/components/juno_appbar.dart';
import 'package:juno_flutter/components/juno_bottombar.dart';
import 'package:juno_flutter/services/app_service.dart';
import 'package:provider/provider.dart';

class ContentPage extends StatelessWidget {
  final Content content;

  const ContentPage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s3Config = Provider.of<AppService>(context).appConfig.s3BucketUrl;
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        const SizedBox(height: 25),
        Text(
          content.name,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        if (content.image != null)
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff6F67AE),
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: ImageHelper(
                imageUrl: Uri.parse(content.image!).isAbsolute
                    ? content.image!
                    : s3Config + content.image!,
                fit: BoxFit.cover,
              ),
            ),
          ),
      ],
    );
  }
}
