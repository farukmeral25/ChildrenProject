import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_childrenproject/widgets/numberDetails.dart';

class LearnNumber extends StatefulWidget {
  @override
  _LearnNumberState createState() => _LearnNumberState();
}

class _LearnNumberState extends State<LearnNumber> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final ref = _firestore.collection("numbers");
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text(
          "Sayıları Öğrenelim",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded,color: Colors.black,),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //ALFABE BODY

              StreamBuilder(
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return Container(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Container(
                          child: NumberTile(
                            title: snapshot.data.docs[index].data()['title'],
                            imageUrl:
                                snapshot.data.docs[index].data()['imageUrl'],
                            imageUrlHand: snapshot.data.docs[index]
                                .data()["imageUrlHand"],
                            value: snapshot.data.docs[index].data()["value"],
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

class NumberTile extends StatelessWidget {
  final imageUrl;
  final imageUrlHand;
  final value;
  final title;

  const NumberTile({
    Key key,
    this.title,
    this.imageUrl,
    this.imageUrlHand,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NumberDetails(
              title: title,
              imageUrl: imageUrl,
              imageUrlHand: imageUrlHand,
              value: value,
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
