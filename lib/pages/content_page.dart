import 'package:flutter/material.dart';
import 'package:juno_flutter/api/models/content.dart';
import 'package:juno_flutter/components/juno_bottombar.dart';

class ContentPage extends StatelessWidget {
  final Content content;

  const ContentPage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContentPage'),
      ),
      body: const Center(
        child: Text(
          'ContentPage',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: const JunoBottomBar(),
    );
  }
}
