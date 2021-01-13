import 'package:flutter/material.dart';

class ImageDetail extends StatefulWidget {
  var imgPath;

  ImageDetail({this.imgPath});

  @override
  _ImageDetailState createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: widget.imgPath,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.imgPath),
            ),
          ),
        ),
      ),
    );
  }
}
