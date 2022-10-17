import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:juno_flutter/services/app_service.dart';
import 'package:provider/provider.dart';

class RoundGridItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String? subtitle;

  const RoundGridItem(
      {Key? key, required this.title, required this.imageUrl, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s3Config = Provider.of<AppService>(context).appConfig.s3BucketUrl;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff6F67AE),
            borderRadius: BorderRadius.circular(200),
          ),
          clipBehavior: Clip.antiAlias,
          child: SizedBox.square(
            dimension: 150,
            child: imageUrl != ""
                ? Image.network(
                    Uri.parse(imageUrl).isAbsolute
                        ? imageUrl
                        : s3Config + imageUrl,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    },
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      );
                    },
                    fit: BoxFit.fitHeight,
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SvgPicture.asset(
                      'assets/img/juno_logo.svg',
                      color: Colors.white,
                    ),
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
        const Text('Subtitle'),
      ],
    );
  }
}
