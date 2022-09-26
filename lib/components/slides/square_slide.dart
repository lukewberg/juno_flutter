import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:juno_flutter/api/models/content.dart';
import 'package:juno_flutter/services/app_service.dart';
import 'package:provider/provider.dart';

class SquareSlide extends StatelessWidget {
  final Content content;

  const SquareSlide({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s3Config = Provider.of<AppService>(context).appConfig.s3BucketUrl;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xff6F67AE),
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                content.image != null && content.image != ""
                    ? SizedBox.expand(
                      child: Image.network(
                          // width: double.infinity,
                          // height: double.infinity,
                          s3Config + content.image!,
                          fit: BoxFit.cover,
                        ),
                    )
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
        const SizedBox(height: 10),
        Text(
          content.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
