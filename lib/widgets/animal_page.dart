import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_childrenproject/widgets/imageDetails.dart';


class AnimalPage extends StatefulWidget {
  @override
  _AnimalPageState createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final ref = _firestore.collection("animals");
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //Animal APPBAR
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blue.shade700,
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
                          "Hayvanlar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          child: Image.asset("assets/images/anasayfa_(3).png"),
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
              //Animal BODY
              StreamBuilder(
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return Container(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Container(
                          child: AnimalTile(
                            imageUrl:
                                snapshot.data.docs[index].data()['imageUrl'],
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

class AnimalTile extends StatelessWidget {
  final imageUrl;

  const AnimalTile({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ImageDetail(
                  imgPath: imageUrl,
                ),
              ),
            );
          },
          child: Hero(
            tag: imageUrl,
            child: Image.network(imageUrl),
          ),
        ),
      ),
    );
  }
}
