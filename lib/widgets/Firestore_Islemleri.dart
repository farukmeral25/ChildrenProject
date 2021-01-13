import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
class FirestoreIslemleri extends StatefulWidget {
  @override
  _FirestoreIslemleriState createState() => _FirestoreIslemleriState();
}

class _FirestoreIslemleriState extends State<FirestoreIslemleri> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final ref = _firestore.collection("alphabet");
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
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            )),
                        Text(
                          "Alfabe",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
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
              StreamBuilder(
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return Container(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Container(
                          child: Image.network(
                              snapshot.data.docs[index].data()['imageUrl']),
                          padding: EdgeInsets.all(5),
                          color: Colors.grey[200],
                          margin: EdgeInsets.all(10),
                        );
                      },
                      itemCount:
                          snapshot.hasData ? snapshot.data.docs.length : 0,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(right: 20, left: 20, top: 10),
                      physics: ClampingScrollPhysics(),
                    ),
                  );
                },
                stream: ref.snapshots(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  veriEkle() {
    _firestore.collection("alphabet").doc("Q").set({
      "imageUrl": "assets/alfabe/alfabe_(7).png",
      "title": "Q"
    }).whenComplete(() => debugPrint(" Eklendi."));
  }
}

class ImageGridItem extends StatefulWidget {
  int _index;

  ImageGridItem(index) {
    this._index = index;
  }

  @override
  _ImageGridItemState createState() => _ImageGridItemState();
}

class _ImageGridItemState extends State<ImageGridItem> {
  Uint8List imageFile;

  getImage() {
    int MAX_SIZE = 1024 * 1024;
    firebase_storage.Reference alphabetStorage = firebase_storage
        .FirebaseStorage.instance
        .ref("alphabet/image${widget._index}.png");
    alphabetStorage.getData(MAX_SIZE).then((data) {
      this.setState(() {
        imageFile = data;
      });
    }).catchError(() {});
  }

  Widget decideGridTileWidget() {
    if (imageFile == null) {
      return Center(
        child: Text("No Data"),
      );
    } else {
      return Image.memory(
        imageFile,
        fit: BoxFit.cover,
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(child: decideGridTileWidget());
  }
}
