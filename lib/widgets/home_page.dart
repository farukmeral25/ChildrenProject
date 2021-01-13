import 'package:flutter/material.dart';
import 'package:flutter_app_childrenproject/data/home_page_data.dart';
import 'package:flutter_app_childrenproject/widgets/Firestore_Islemleri.dart';
import 'package:flutter_app_childrenproject/widgets/alfabe_page.dart';
import 'package:flutter_app_childrenproject/widgets/animal_page.dart';
import 'package:flutter_app_childrenproject/widgets/find_the_couple_page.dart';
import 'package:flutter_app_childrenproject/widgets/maths_page.dart';
import 'package:flutter_app_childrenproject/widgets/picture_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> itemsCategoriesData = [];

  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  void getCategoriesData() {
    List<dynamic> responseList = CATAGORIES;
    List<Widget> listCategoryItems = [];
    responseList.forEach(
      (post) {
        listCategoryItems.add(
          Container(
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Color(post["color"]),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(100), blurRadius: 10.0),
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        post["name"],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/images/${post["image"]}",
                    height: 75,
                    width: 75,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
    setState(
      () {
        itemsCategoriesData = listCategoryItems;
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoriesData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            width: size.width,
            height: size.height * 0.24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Color.fromRGBO(84, 104, 205, 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.035,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: size.height * 0.1,
                      width: size.width * 0.2,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "http://civilsocietydialogue.org/wp-content/uploads/2015/12/RESIZED11-820x820.jpg"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.008,
                ),
                Text(
                  "Hoşgeldin",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: controller,
              itemCount: itemsCategoriesData.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                double scale = 1.0;
                if (topContainer > 0.5) {
                  scale = index + 0.5 - topContainer;
                  if (scale < 0) {
                    scale = 0;
                  } else if (scale > 1) {
                    scale = 1;
                  }
                }
                return Opacity(
                  opacity: scale,
                  child: Transform(
                    transform: Matrix4.identity()..scale(scale, scale),
                    alignment: Alignment.bottomCenter,
                    child: Align(
                      heightFactor: 0.7,
                      alignment: Alignment.topCenter,
                      child: ListTile(
                        title: itemsCategoriesData[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => index == 0
                                  ? AlfabePage()
                                  : index == 1
                                      ? AnimalPage()
                                      : index == 2
                                          ? MathsPage()
                                          : index == 3
                                              ? PicturePage()
                                              : index == 4
                                                  ? FindTheCouplePage()
                                                  : Container(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
