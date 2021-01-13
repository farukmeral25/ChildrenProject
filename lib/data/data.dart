class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("ÇİZGİ ÇALIŞMALARI ADINA CÜMLE");
  sliderModel.setTitle("Çizgi Çalışmaları");
  sliderModel.setImageAssetPath("assets/images/baslangic_(1).png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("KONUŞMAYA DAYALI ADINA CÜMLE");
  sliderModel.setTitle("Konuşmaya Dayalı");
  sliderModel.setImageAssetPath("assets/images/baslangic_(2).png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("ÖĞRETİCİLİK ADINA CÜMLE");
  sliderModel.setTitle("Öğretici");
  sliderModel.setImageAssetPath("assets/images/baslangic_(3).png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  //4
  sliderModel.setDesc("GÜVENİLİRLİK ADINA CÜMLE");
  sliderModel.setTitle("Güvenilirlik");
  sliderModel.setImageAssetPath("assets/images/baslangic_(4).png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}

