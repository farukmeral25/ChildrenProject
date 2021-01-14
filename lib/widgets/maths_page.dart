import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_childrenproject/data/maths_model.dart';
import 'package:flutter_app_childrenproject/widgets/learnNumber.dart';
import 'package:flutter_app_childrenproject/widgets/four_operations.dart';

class MathsPage extends StatefulWidget {
  @override
  _MathsPageState createState() => _MathsPageState();
}

class _MathsPageState extends State<MathsPage> {
  List<MathsModel> maths = new List<MathsModel>();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    maths = getMaths();
  }

  @override
  Widget build(BuildContext context) {
    final ref = _firestore.collection("maths");
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //Maths APPBAR
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
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
                          "Matematik",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          child: Image.asset("assets/images/anasayfa_(4).png"),
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
              //Maths BODY
              StreamBuilder(
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return Container(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return MathsTile(
                          index: index,
                          imageUrl:
                              snapshot.data.docs[index].data()['imageUrl'],
                          title: snapshot.data.docs[index].data()['title'],
                          color: maths[index].color,
                        );
                      },
                      itemCount:
                          snapshot.hasData ? snapshot.data.docs.length : 0,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(right: 20, left: 20, top: 40),
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

class MathsTile extends StatelessWidget {
  final imageUrl;
  final title;
  final color;
  final index;

  const MathsTile({Key key, this.index, this.imageUrl, this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LearnNumber()));
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FourOperations(
                title: title,
                imageUrl: imageUrl,
                color: color,
              ),
            ),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FourOperations(
                title: title,
                imageUrl: imageUrl,
                color: color,
              ),
            ),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FourOperations(
                title: title,
                imageUrl: imageUrl,
                color: color,
              ),
            ),
          );
        } else if (index == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FourOperations(
                title: title,
                imageUrl: imageUrl,
                color: color,
              ),
            ),
          );
        } else {
          return;
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: color,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Image.network(
                  imageUrl,
                  width: 75,
                  height: 75,
                ),
              ],
            )),
      ),
    );
  }
}
