import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_childrenproject/data/alphabetsounds.dart';
import 'package:flutter_app_childrenproject/widgets/detailsAlphabet.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AlfabePage extends StatefulWidget {
  @override
  _AlfabePageState createState() => _AlfabePageState();
}

class _AlfabePageState extends State<AlfabePage> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<AlphabetSoundsModel> sounds = new List<AlphabetSoundsModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sounds = getAlphabetSound();
  }

  @override
  Widget build(BuildContext context) {
    final ref = _firestore.collection("alphabet");
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //ALFABE APPBAR
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
              //ALFABE BODY

              StreamBuilder(
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return Container(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Container(
                          child: AlfabeTile(
                            imageUrl:
                                snapshot.data.docs[index].data()['imageUrl'],
                            title: snapshot.data.docs[index].data()['title'],
                            alphabetDictation: snapshot.data.docs[index]
                                .data()['letterDictation'],
                            letterSample: snapshot.data.docs[index]
                                .data()['letterSample'],
                            sound: sounds[index].sound,
                            soundProduct: sounds[index].soundProduct,
                            url: snapshot.data.docs[index].data()['url'],
                          ),
                          padding: EdgeInsets.all(5),
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
}

class AlfabeTile extends StatelessWidget {
  final imageUrl;
  final title;
  final alphabetDictation;
  final letterSample;
  final sound;
  final soundProduct;
  final url;

  const AlfabeTile({
    Key key,
    this.sound,
    this.soundProduct,
    this.imageUrl,
    this.title,
    this.alphabetDictation,
    this.letterSample,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlphabetDetails(
              title: title,
              imageUrl: imageUrl,
              alphabetdictation: alphabetDictation,
              letterSample: letterSample,
              sound: sound,
              soundProduct: soundProduct,
              url:url,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: Image.network(imageUrl),
      ),
    );
  }
}

