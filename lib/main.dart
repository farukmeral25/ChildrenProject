import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_app_childrenproject/data/data.dart';
import 'package:flutter_app_childrenproject/widgets/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChildrenDevelopmentPractice());
}

class ChildrenDevelopmentPractice extends StatelessWidget {
  final Future<FirebaseApp> _initialize = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialize,
        builder: (context, firebase) {
          if (firebase.connectionState == ConnectionState.waiting) {
            return Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (firebase.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: "Çocuk Gelişimi",
              home: Home(),
              debugShowCheckedModeBanner: false,
            );
          }
          return SizedBox();
        });
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ref = _firestore.collection("start");
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return Container(
            child: PageView.builder(
              controller: pageController,
              itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemBuilder: (context, index) {
                return SliderTile(
                  imageAssetPath: snapshot.data.docs[index].data()['imageUrl'],
                  title: snapshot.data.docs[index].data()['title'],
                  desc: snapshot.data.docs[index].data()['desc'],
                );
              },
            ),
          );
        },
        stream: ref.snapshots(),
      ),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              height: Platform.isIOS ? 70 : 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      pageController.animateToPage(slides.length - 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: Platform.isIOS ? 120 : 100,
                      color: Color.fromRGBO(248, 166, 2, 1),
                      child: Center(
                        child: Text(
                          "ATLA",
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      for (int i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? pageIndexIndicator(true)
                            : pageIndexIndicator(false)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      pageController.animateToPage(currentIndex + 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: Platform.isIOS ? 120 : 100,
                      color: Color.fromRGBO(84, 104, 205, 1),
                      child: Center(
                        child: Text(
                          "İLERİ",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                alignment: Alignment.center,
                height: Platform.isIOS ? 70 : 60,
                color: Color.fromRGBO(248, 166, 2, 1),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "BAŞLAYIN",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
    );
  }
}

class SliderTile extends StatelessWidget {
  String imageAssetPath, title, desc;

  SliderTile({this.imageAssetPath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(imageAssetPath),
          SizedBox(
            height: 30,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
