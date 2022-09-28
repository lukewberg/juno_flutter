import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:juno_flutter/api/legacy_api.dart';
import 'package:juno_flutter/api/models/content.dart';
import 'package:juno_flutter/components/config/carousel_config.dart';
import 'package:juno_flutter/components/config/component_api_config.dart';
import 'package:juno_flutter/components/slides/square_slide.dart';
import 'package:juno_flutter/utils/api_route.dart';
import 'package:juno_flutter/utils/request_type.dart';

class Carousel extends StatefulWidget {
  List<Widget> slides = [];
  final String title;
  final bool hasArrows;
  final bool hasDots;
  final ComponentApiConfig? apiConfig;

  // final Map<String, dynamic> slideConfig;

  Carousel(
      {Key? key,
      required this.title,
      required this.hasArrows,
      required this.hasDots,
      this.apiConfig})
      : super(key: key);

  factory Carousel.fromConfig(CarouselConfig config) {
    return Carousel(
      title: config.title ?? '',
      hasArrows: config.hasArrows ?? true,
      hasDots: config.hasDots ?? true,
      apiConfig: config.apiConfig,
    );
  }

  Future<List<Widget>> getSlides() async {
    // TODO: update to use apiConfig
    if (apiConfig != null) {
      List<Content> content = await LegacyAPI().queryContent(
          REQUEST_TYPE.post,
          apiConfig!.contentType.map((e) => BUCKETS.values.byName(e)).toList(),
          API_ROUTE.v2,
          apiConfig!.requiredTags,
          apiConfig!.slug,
          5);
      return content.map((e) => SquareSlide.fromContent(e)).toList();
    } else {
      return [];
    }
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
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        CarouselSlider(
          items: widget.slides.map((e) {
            return Builder(
              builder: (BuildContext context) {
                return e;
              },
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            pageSnapping: false,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.75,
          ),
        ),
      ],
    );
  }
}
