import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_childrenproject/data/picture_model.dart';

class PicturePage extends StatefulWidget {
  @override
  _PicturePageState createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  List<PictureModel> picture = new List<PictureModel>();
  List<PictureModel> favorite = new List<PictureModel>();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    picture = getPicture();
    favorite = getFavorite();
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    picture.clear();
    favorite.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final refFavorite = _firestore.collection("pictureFavorite");
    final refGetPicture = _firestore.collection("pictureGet");
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //Picture APPBAR
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.green.shade700,
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
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            )),
                        Text(
                          "Resim",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          child: Image.asset("assets/images/anasayfa_(5).png"),
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
              //Picture BODY
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Resim Yap",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    StreamBuilder(
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        return Container(
                          height: 300,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return PictureTile(
                                imageAssetPath: snapshot.data.docs[index]
                                    .data()['imageUrl'],
                                imageName: snapshot.data.docs[index]
                                    .data()['title'],
                                color: picture[index].color,
                                route: picture[index].route,
                              );
                            },
                            itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        );
                      },
                      stream: refGetPicture.snapshots(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //Öneriler
                    Row(
                      children: [
                        Text(
                          "Öneriler",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    StreamBuilder(
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        return Container(
                          height: 150,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return FavoriteTile(
                                imageAssetPath: snapshot.data.docs[index].data()['imageUrl'],
                                imageName: snapshot.data.docs[index].data()['title'],
                                color: favorite[index].color,
                              );
                            },
                            itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        );
                      },
                      stream: refFavorite.snapshots(),
                    ),
                    SizedBox(
                      height: 10,
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

class PictureTile extends StatelessWidget {
  final imageAssetPath;
  final imageName;
  final color;
  final route;

  const PictureTile(
      {Key key, this.imageAssetPath, this.imageName, this.color, this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => route));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 35),
            height: 250,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: color,
            ),
            alignment: Alignment.center,
            child: Image.network(imageAssetPath),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text(
                imageName,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}

class FavoriteTile extends StatelessWidget {
  final imageAssetPath;
  final imageName;
  final color;

  const FavoriteTile({Key key, this.imageAssetPath, this.imageName, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 15),
        width: 150,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              imageAssetPath,
              width: 100,
              height: 100,
            ),
            Text(
              imageName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
