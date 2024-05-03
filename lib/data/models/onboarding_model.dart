class OnBoardingModel {
  final String image;
  final String title;
  final String subTitle;

  OnBoardingModel({required this.image, required this.title,required this.subTitle});
}

List<OnBoardingModel> boarding = [
  OnBoardingModel(
    subTitle: 'Patisseries',
    image: 'assets/images/onboard1.jpg',
    title: 'Fresh & Daily Backed',
  ),
  OnBoardingModel(
    subTitle:'Your Place',
    image: 'assets/images/onboard2.png',
    title: 'Fast Delivery to',
  ),
];
