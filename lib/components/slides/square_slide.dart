import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:juno_flutter/components/image_helper.dart';
import 'package:juno_flutter/services/app_service.dart';
import 'package:provider/provider.dart';

typedef OnTap = void Function();

class SquareSlide extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imageUrl;
  final bool rounded;
  final bool? showTitle;
  final OnTap? onTap;

  const SquareSlide({
    Key? key,
    required this.title,
    required this.subtitle,
    this.imageUrl,
    required this.rounded,
    this.showTitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s3Config = Provider.of<AppService>(context).appConfig.s3BucketUrl;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: const Color(0xff6F67AE),
                borderRadius: BorderRadius.circular(rounded ? 20 : 0),
              ),
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  imageUrl != null && imageUrl != ""
                      ? SizedBox.expand(
                          child: ImageHelper(
                          imageUrl: Uri.parse(imageUrl!).isAbsolute
                              ? imageUrl!
                              : s3Config + imageUrl!,
                          fit: BoxFit.cover,
                        ))
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SvgPicture.asset(
                            'assets/img/juno_logo.svg',
                            color: Colors.white,
                          ),
                        ),
                ],
              ),
            ),
          ),
          if (showTitle ?? true)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
