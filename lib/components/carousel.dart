import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:juno_flutter/components/config/carousel_config.dart';

class Carousel extends StatefulWidget {
  List<Widget>? slides;
  // final Map<String, dynamic> slideConfig;

  Carousel({Key? key}) : super(key: key);

  factory Carousel.fromConfig(CarouselConfig config) {
    return Carousel();
  }

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: widget.slides,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 0.8
        ),
      ),
    );
  }
}
