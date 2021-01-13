import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MathsModel {
  Color color;
}

List<MathsModel> getMaths() {
  List<MathsModel> maths = new List<MathsModel>();
  MathsModel mathsModel;
  //Öğrenme
  mathsModel = new MathsModel();

  mathsModel.color = Colors.red.shade600;
  maths.add(mathsModel);
  //  +
  mathsModel = new MathsModel();

  mathsModel.color = Colors.orange.shade600;
  maths.add(mathsModel);
  //  -
  mathsModel = new MathsModel();

  mathsModel.color = Colors.blue;
  maths.add(mathsModel);
  //  *
  mathsModel = new MathsModel();

  mathsModel.color = Colors.pinkAccent;
  maths.add(mathsModel);
  //  /
  mathsModel = new MathsModel();

  mathsModel.color = Colors.green;
  maths.add(mathsModel);
  mathsModel = new MathsModel();
  return maths;
}
