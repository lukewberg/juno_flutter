import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:juno_flutter/router/navigation.dart';

class Carousel extends StatefulWidget {
  final List<Widget> slides;

  const Carousel(this.slides, {Key? key}) : super(key: key);

  factory Carousel.fromConfig(CarouselConfig config) {
    return Carousel(config.slides);
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

class CarouselConfig extends ComponentConfig {
  final List<Widget> slides;

  CarouselConfig(super.rawConfig, this.slides);
}
