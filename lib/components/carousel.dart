import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:juno_flutter/api/legacy_api.dart';
import 'package:juno_flutter/api/models/content.dart';
import 'package:juno_flutter/components/config/carousel_config.dart';
import 'package:juno_flutter/components/config/component_api_config.dart';
import 'package:juno_flutter/components/slides/square_slide.dart';
import 'package:juno_flutter/utils/api_route.dart';
import 'package:juno_flutter/utils/content_builder.dart';
import 'package:juno_flutter/utils/request_type.dart';

class Carousel extends StatefulWidget {
  List<Widget> slides;
  final String title;
  final bool hasArrows;
  final bool hasDots;
  final ComponentApiConfig? apiConfig;
  final bool isFullWidth;

  // final Map<String, dynamic> slideConfig;

  Carousel(
      {Key? key,
      required this.title,
      required this.hasArrows,
      required this.hasDots,
      required this.slides,
      this.isFullWidth = false,
      this.apiConfig})
      : super(key: key);

  factory Carousel.fromConfig(CarouselConfig config) {
    return Carousel(
      title: config.title ?? '',
      hasArrows: config.hasArrows ?? true,
      hasDots: config.hasDots ?? true,
      apiConfig: config.apiConfig,
      isFullWidth: config.isFullWidth ?? false,
      slides: config.contentList
          .map((e) => SquareSlide(
                title: e.name,
                subtitle: e.description ?? '',
                image: e.image,
                rounded: !(config.isFullWidth ?? false),
                showTitle: !(config.isFullWidth ?? false),
              ))
          .toList(),
    );
  }

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!widget.isFullWidth)
          Column(
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
            ],
          ),
        CarouselSlider(
          items: widget.slides.map((e) {
            return Builder(
              builder: (BuildContext context) {
                return e;
              },
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: widget.isFullWidth ? false : true,
            pageSnapping: false,
            pauseAutoPlayOnTouch: true,
            // aspectRatio: widget.isFullWidth ? 2.0 : 1.0,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: widget.isFullWidth ? 1.0 : 0.8,
          ),
        ),
      ],
    );
  }
}
