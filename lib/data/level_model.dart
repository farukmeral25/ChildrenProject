class LevelModel {
  String imageAssetPath;
  bool isSelected;

  LevelModel({this.imageAssetPath, this.isSelected});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setIsSelected(bool getIsSelected) {
    isSelected = getIsSelected;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  bool getIsSelected() {
    return isSelected;
  }
}
int points = 0;
bool selected = false;
String selectedImageAssetPath="";
int selectedTileIndex;
List<LevelModel> visiblePairs = new List<LevelModel>();
List<LevelModel> pairs = new List<LevelModel>();
List<LevelModel> getPairs() {
  List<LevelModel> pairs = new List<LevelModel>();
  LevelModel levelModel;

  //1
  levelModel = new LevelModel();
  levelModel.setImageAssetPath("assets/images/anasayfa_(1).png");
  levelModel.setIsSelected(false);
  pairs.add(levelModel);
  pairs.add(levelModel);
  //1
  levelModel = new LevelModel();
  levelModel.setImageAssetPath("assets/images/anasayfa_(2).png");
  levelModel.setIsSelected(false);
  pairs.add(levelModel);
  pairs.add(levelModel);
  //1
  levelModel = new LevelModel();
  levelModel.setImageAssetPath("assets/images/anasayfa_(3).png");
  levelModel.setIsSelected(false);
  pairs.add(levelModel);
  pairs.add(levelModel);
  //1
  levelModel = new LevelModel();
  levelModel.setImageAssetPath("assets/images/anasayfa_(4).png");
  levelModel.setIsSelected(false);
  pairs.add(levelModel);
  pairs.add(levelModel);
  //1
  levelModel = new LevelModel();
  levelModel.setImageAssetPath("assets/images/anasayfa_(5).png");
  levelModel.setIsSelected(false);
  pairs.add(levelModel);
  pairs.add(levelModel);
  //1
  levelModel = new LevelModel();
  levelModel.setImageAssetPath("assets/images/anasayfa_(6).png");
  levelModel.setIsSelected(false);
  pairs.add(levelModel);
  pairs.add(levelModel);
  //1
  levelModel = new LevelModel();
  levelModel.setImageAssetPath("assets/images/baslangic_(2).png");
  levelModel.setIsSelected(false);
  pairs.add(levelModel);
  pairs.add(levelModel);
  //1
  levelModel = new LevelModel();
  levelModel.setImageAssetPath("assets/images/baslangic_(1).png");
  levelModel.setIsSelected(false);
  pairs.add(levelModel);
  pairs.add(levelModel);
  levelModel = new LevelModel();
  return pairs;
}
List<LevelModel> getQuestions() {
  List<LevelModel> pairs = new List<LevelModel>();
  LevelModel levelModel;

  //1
  levelModel = new LevelModel();
  levelModel.setImageAssetPath("assets/matematik/puzzle.png");
  levelModel.setIsSelected(false);
  pairs.add(levelModel);
  pairs.add(levelModel);
  //1
  levelModel = new LevelModel();
  levelModel.setImageAssetPath("assets/matematik/puzzle.png");
  levelModel.setIsSelected(false);
  pairs.add(levelModel);
  pairs.add(levelModel);
  //1
  levelModel = new LevelModel();
  levelModel.setImageAssetPath("assets/matematik/puzzle.png");
  levelModel.setIsSelected(false);
  pairs.add(levelModel);
  pairs.add(levelModel);
  //1
  levelModel = new LevelModel();
  levelModel.setImageAssetPath("assets/matematik/puzzle.png");
  levelModel.setIsSelected(false);
  pairs.add(levelModel);
  pairs.add(levelModel);
  //1
  levelModel = new LevelModel();
  levelModel.setImageAssetPath("assets/matematik/puzzle.png");
  levelModel.setIsSelected(false);
  pairs.add(levelModel);
  pairs.add(levelModel);
  //1
  levelModel = new LevelModel();
  levelModel.setImageAssetPath("assets/matematik/puzzle.png");
  levelModel.setIsSelected(false);
  pairs.add(levelModel);
  pairs.add(levelModel);
  //1
  levelModel = new LevelModel();
  levelModel.setImageAssetPath("assets/matematik/puzzle.png");
  levelModel.setIsSelected(false);
  pairs.add(levelModel);
  pairs.add(levelModel);
  //1
  levelModel = new LevelModel();
  levelModel.setImageAssetPath("assets/matematik/puzzle.png");
  levelModel.setIsSelected(false);
  pairs.add(levelModel);
  pairs.add(levelModel);
  levelModel = new LevelModel();
  return pairs;
}
