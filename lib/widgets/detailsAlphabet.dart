import 'package:flutter/material.dart';
import 'package:flutter_app_childrenproject/widgets/body_Stack.dart';

class AlphabetDetails extends StatefulWidget {
  final imageUrl;
  final title;
  final alphabetdictation;
  final letterSample;
  final sound;
  final soundProduct;
  final url;

  const AlphabetDetails({
    Key key,
    @required this.imageUrl,
    @required this.title,
    @required this.alphabetdictation,
    @required this.letterSample,
    @required this.sound,
    @required this.soundProduct,
    @required this.url,
  }) : super(key: key);

  @override
  _AlphabetDetailsState createState() => _AlphabetDetailsState();
}

class _AlphabetDetailsState extends State<AlphabetDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blueAccent, Colors.orangeAccent],
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Image.network(
                  widget.imageUrl,
                  height: 25,
                  width: 25,
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(50),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.red,
                    Colors.purple,
                    Colors.yellow,
                    Colors.green,
                    Colors.pink,
                    Colors.blue,
                  ],
                ),
              ),
            ),
            BodyStack(
                imageUrl: widget.imageUrl,
                title: widget.title,
                alphabetdictation: widget.alphabetdictation,
                letterSample: widget.letterSample,
                sound: widget.sound,
                soundProduct: widget.soundProduct,
                url: widget.url),
          ],
        ));
  }
}
