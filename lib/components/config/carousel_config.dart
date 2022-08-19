import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:juno_flutter/router/navigation.dart';

@JsonSerializable()
class CarouselConfig extends ComponentConfig {
  final List<Widget> slides;

  CarouselConfig(super.rawConfig, this.slides);
}