class SlideModel{
  String imagePath;
  String title;
  String desc;

  SlideModel({required this.imagePath, required this.desc, required this.title});
}

class SlideModelItems{
  List<SlideModel> items=[
    SlideModel(
      title: "Unlock Digital Banking with RUB",
      desc: "Empowering Hisar with Digital Banking Solutions",
      imagePath: 'assets/img1.png'
    ),
    SlideModel(
        title: "Smart banking for a smarter future",
        desc: "Simplify your financial life with our innovative banking solutions",
        imagePath: 'assets/img2.png'
    ),
    SlideModel(
        title: "Your privacy is our top priority",
        desc: "Protecting your information with advanced security measures",
        imagePath: 'assets/img3.png'
    ),

  ];
}