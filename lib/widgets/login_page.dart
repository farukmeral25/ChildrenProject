import 'package:flutter/material.dart';
import 'package:flutter_app_childrenproject/common_widget/social_button.dart';
import 'package:flutter_app_childrenproject/widgets/form_card.dart';
import 'package:flutter_app_childrenproject/widgets/sideBar_layout.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Color.fromRGBO(84, 104, 205, 1),
        width: double.infinity,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                width: size.width * 0.4,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "http://civilsocietydialogue.org/wp-content/uploads/2015/12/RESIZED11-820x820.jpg"),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                "Çocuk Gelişimi",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                child: FormCard(),
                padding: EdgeInsets.symmetric(horizontal: 15),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: SocialLoginButton(
                  butonText: "DEVAM ET",
                  textColor: Colors.white,
                  butonColor: Color.fromRGBO(248, 166, 2, 1),
                  yukseklik: 50,
                  radius: 10.0,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SideBarLayout()));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      "ya da",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    SocialLoginButton(
                      butonText: "Facebook ile Giriş Yap",
                      textColor: Colors.white,
                      radius: 8.0,
                      butonColor: Color(0xFF334D92),
                      //butonIcon: Image.asset("assets/images/facebook-logo.png"),
                      onPressed: () {},
                    ),
                    SocialLoginButton(
                      butonText: "Gmail ile Giriş Yap",
                      textColor: Colors.white,
                      butonColor: Colors.red,
                      radius: 8.0,
                      //butonIcon: Image.asset("assets/images/google-logo.png"),
                      onPressed: () {},
                    ),
                    SocialLoginButton(
                      butonText: "Misafir olarak Giriş Yap",
                      textColor: Colors.white,
                      butonColor: Colors.orange,
                      radius: 8.0,
                      //butonIcon: Icon(Icons.person),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
