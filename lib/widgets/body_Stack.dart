import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_childrenproject/widgets/imageDetails.dart';
import 'package:flutter_app_childrenproject/widgets/picture_pages/draw_picture_page.dart';
import 'package:flutter_app_childrenproject/widgets/youtube_player_page.dart';

class BodyStack extends StatefulWidget {
  final imageUrl;
  final title;
  final alphabetdictation;
  final letterSample;
  final sound;
  final soundProduct;
  final url;

  const BodyStack({
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
  _BodyStackState createState() => _BodyStackState();
}

class _BodyStackState extends State<BodyStack> {
  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      playLocal(widget.sound);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ImageDetail(
                            imgPath: widget.alphabetdictation,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: widget.alphabetdictation,
                      child: Image.network(widget.alphabetdictation),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          playLocal(widget.soundProduct);
                        },
                        child: Image.network(widget.letterSample),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.5,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DrawPicturePage(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.grey.shade800,
                    size: 80,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => YoutubePlayerPage(
                            url: widget.url,imagePath: widget.alphabetdictation,
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.ondemand_video,
                      color: Colors.red,
                      size: 120,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  playLocal(String sound) async {
    audioPlayer = await audioCache.play(sound);
  }
}
