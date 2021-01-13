import 'package:flutter/material.dart';
import 'package:flutter_app_childrenproject/data/level_model.dart';

class LevelPage extends StatefulWidget {
  int index;

  LevelPage({this.index});

  @override
  _LevelPageState createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pairs = getPairs();
    //Karıştırma İşlemi
    pairs.shuffle();
    visiblePairs = pairs;
    selected = true;
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        visiblePairs = getQuestions();
        selected = false;
      });
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.yellow.shade800,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
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
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              points = 0;
                              setState(() {});
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            )),
                        Text(
                          "SEVİYE " + widget.index.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        //Image Gelecek
                        Container(
                          child: Image.asset("assets/images/anasayfa_(6).png"),
                          height: 80,
                        ),
                        Opacity(
                          opacity: 0,
                          child: Icon(
                            Icons.search,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    points != 800
                        ? Column(
                            children: [
                              Text(
                                "$points/800",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text("PUAN"),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: 20,
                    ),
                    points != 800
                        ? GridView(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              mainAxisSpacing: 0.0,
                              maxCrossAxisExtent: 100,
                            ),
                            children: List.generate(
                                visiblePairs.length,
                                (index) => Tile(
                                      imageAssetPath: visiblePairs[index]
                                          .getImageAssetPath(),
                                      parent: this,
                                      tileIndex: index,
                                    )),
                            shrinkWrap: true,
                          )
                        : GestureDetector(
                            onTap: () {
                              if (mounted) {
                                points = 0;
                                setState(() {});
                              }

                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                              child: Text(
                                "TEBRİKLER",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(24)),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  String imageAssetPath;

  int tileIndex;
  _LevelPageState parent;

  Tile({
    this.imageAssetPath,
    this.tileIndex,
    this.parent,
  });

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          if (selectedImageAssetPath != "") {
            if (selectedImageAssetPath ==
                pairs[widget.tileIndex].getImageAssetPath()) {
              print("Doğru");
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                points = points + 100;

                setState(() {});
                selected = false;
                widget.parent.setState(() {
                  pairs[widget.tileIndex].setImageAssetPath("");
                  pairs[selectedTileIndex].setImageAssetPath("");
                });
                selectedImageAssetPath = "";
              });
            } else {
              print("Yanlış");
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                selected = false;
                widget.parent.setState(() {
                  pairs[widget.tileIndex].setIsSelected(false);
                  pairs[selectedTileIndex].setIsSelected(false);
                });
                selectedImageAssetPath = "";
              });
            }
          } else {
            selectedTileIndex = widget.tileIndex;
            selectedImageAssetPath =
                pairs[widget.tileIndex].getImageAssetPath();
          }
          setState(() {
            pairs[widget.tileIndex].setIsSelected(true);
          });
          print("You click me");
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: pairs[widget.tileIndex].getImageAssetPath() != ""
            ? Image.asset(
                pairs[widget.tileIndex].getIsSelected()
                    ? pairs[widget.tileIndex].getImageAssetPath()
                    : widget.imageAssetPath,
              )
            : Image.asset("assets/matematik/correct.png"),
      ),
    );
  }
}
