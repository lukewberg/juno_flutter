import 'package:flutter/material.dart';
import 'package:juno_flutter/components/config/blurb_config.dart';

class Blurb extends StatelessWidget {
  final Map<String, dynamic> config;

  const Blurb(this.config, {Key? key}) : super(key: key);

  factory Blurb.fromConfig(BuildContext context, BlurbConfig config) {
    return Blurb(config.content);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('This is a blurb'),
    );
  }
}
