import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:juno_flutter/api/legacy_api.dart';
import 'package:juno_flutter/api/models/content.dart';
import 'package:juno_flutter/components/config/carousel_config.dart';
import 'package:juno_flutter/utils/api_route.dart';
import 'package:juno_flutter/utils/request_type.dart';

class Carousel extends StatefulWidget {
  List<Widget>? slides;
  final String title;
  final bool hasArrows;
  final bool hasDots;

  // final Map<String, dynamic> slideConfig;

  Carousel(
      {Key? key,
      required this.title,
      required this.hasArrows,
      required this.hasDots})
      : super(key: key);

  factory Carousel.fromConfig(CarouselConfig config) {
    return Carousel(
      title: config.title ?? '',
      hasArrows: config.hasArrows ?? true,
      hasDots: config.hasDots ?? true,
    );
  }

  Future<List<Widget>> getSlides() async {
    var slideContent = await LegacyAPI().queryContent(
        REQUEST_TYPE.post, BUCKETS.OTSession, API_ROUTE.v2, {}, '', 10);
    return slideContent.map((e) => Text(e.name)).toList();
  }

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  void initState() {
    super.initState();
    widget.getSlides().then((value) => setState(() {
          widget.slides = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title),
        CarouselSlider(
          items: widget.slides ?? [],
          options: CarouselOptions(
            height: 400.0,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
      ],
    );
  }
}
