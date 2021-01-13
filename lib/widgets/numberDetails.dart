import 'package:flutter/material.dart';

class NumberDetails extends StatefulWidget {
  final imageUrl;
  final imageUrlHand;
  final value;
  final title;

  const NumberDetails(
      {Key key,
      @required this.title,
      @required this.imageUrl,
      @required this.imageUrlHand,
      @required this.value})
      : super(key: key);

  @override
  _NumberDetailsState createState() => _NumberDetailsState();
}

class _NumberDetailsState extends State<NumberDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.amber, Colors.lightBlue],
            ),
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(50),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.orange.shade400,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(widget.imageUrl),
                SizedBox(
                  height: 25,
                ),
                Text(
                  widget.title,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Image.network(widget.imageUrlHand),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
