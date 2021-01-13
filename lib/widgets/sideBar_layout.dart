import 'package:flutter/material.dart';
import 'package:flutter_app_childrenproject/widgets/home_page.dart';
import 'package:flutter_app_childrenproject/widgets/sidebar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          HomePage(),
          SideBar(),
        ],
      ),
    );
  }
}
