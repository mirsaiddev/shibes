import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class ImageDetailPage extends StatefulWidget {
  final String url;

  const ImageDetailPage({Key key, @required this.url}) : super(key: key);
  @override
  _ImageDetailPageState createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Blur(
            blur: 10,
            blurColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.url), fit: BoxFit.cover),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Image.network(widget.url),
            ),
          )
        ],
      ),
    );
  }
}
