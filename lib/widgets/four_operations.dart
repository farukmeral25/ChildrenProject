import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class FourOperations extends StatefulWidget {
  final color;
  final imageUrl;
  final title;

  const FourOperations({Key key, this.color, this.imageUrl, this.title})
      : super(key: key);

  @override
  _FourOperationsState createState() => _FourOperationsState();
}

class _FourOperationsState extends State<FourOperations> {
  num sayi1, sayi2, sonuc = 0;
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();

  sayiTopla() {
    setState(() {
      sayi1 = num.parse(_textEditingController1.text);
      sayi2 = num.parse(_textEditingController2.text);
      sonuc = sayi1 + sayi2;
    });
  }

  sayiCikar() {
    setState(() {
      sayi1 = num.parse(_textEditingController1.text);
      sayi2 = num.parse(_textEditingController2.text);
      sonuc = sayi1 - sayi2;
    });
  }

  sayiCarp() {
    setState(() {
      sayi1 = num.parse(_textEditingController1.text);
      sayi2 = num.parse(_textEditingController2.text);
      sonuc = sayi1 * sayi2;
    });
  }

  sayiBol() {
    setState(() {
      sayi1 = num.parse(_textEditingController1.text);
      sayi2 = num.parse(_textEditingController2.text);
      sonuc = sayi1 / sayi2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title + " İşlemi",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _textEditingController1,
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _textEditingController2,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                child: Image.network(
                  widget.imageUrl,
                ),
                onTap: () {
                  try {
                    if (widget.title == "Toplama") {
                      sayiTopla();
                    } else if (widget.title == "Çıkarma") {
                      sayiCikar();
                    } else if (widget.title == "Çarpma") {
                      sayiCarp();
                    } else {
                      sayiBol();
                    }
                  } catch (Exception) {
                    Toast.show(
                      "Değer Giriniz",
                      context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.BOTTOM,
                    );
                  }
                },
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                sonuc.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
