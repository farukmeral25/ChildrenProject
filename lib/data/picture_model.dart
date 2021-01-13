import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_childrenproject/widgets/picture_pages/draw_picture_page.dart';

class PictureModel {
  Color color;
  var route;
//DateTime dateTime;
}

List<PictureModel> getFavorite() {
  List<PictureModel> favorite = new List<PictureModel>();
  PictureModel pictureModel;
  //1
  pictureModel = new PictureModel();

  pictureModel.color = Colors.pink;
  favorite.add(pictureModel);
  //2
  pictureModel = new PictureModel();

  pictureModel.color = Colors.yellow;
  favorite.add(pictureModel);
  //3
  pictureModel = new PictureModel();

  pictureModel.color = Colors.blue;
  favorite.add(pictureModel);
  pictureModel = new PictureModel();
  return favorite;
}

List<PictureModel> getPicture() {
  List<PictureModel> pictures = new List<PictureModel>();
  PictureModel pictureModel;
  //1
  pictureModel = new PictureModel();

  pictureModel.color = Colors.pink.shade300;
  pictureModel.route = DrawPicturePage();
  pictures.add(pictureModel);
  //2
  pictureModel = new PictureModel();

  pictureModel.color = Colors.red.shade600;
  pictureModel.route = DrawPicturePage();
  pictures.add(pictureModel);
  //3
  pictureModel = new PictureModel();

  pictureModel.color = Colors.blue.shade600;
  pictureModel.route = DrawPicturePage();
  pictures.add(pictureModel);
  pictureModel = new PictureModel();
  return pictures;
}
