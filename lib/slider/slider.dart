import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_controller.dart';

class SliderP extends StatefulWidget {
  SliderP({Key? key}) : super(key: key);

  @override
  State<SliderP> createState() => _SliderPState();
}

class _SliderPState extends State<SliderP> {
  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    'assets/images/slider1.png',
    'assets/images/slider2.png',
    'assets/images/slider3.png',
    'assets/images/slider4.png',
    'assets/images/slider5.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          disableGesture: true,
          itemCount: urlImages.length,
          itemBuilder: (context, index, realIndex) {
            final urlImage = urlImages[index];
            return buildImage(urlImage, index);
          },
          options: CarouselOptions(
            aspectRatio: 3.4,
            autoPlay: true,
            disableCenter: true,
            animateToClosest: false,
            enableInfiniteScroll: false,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: buildIndicator(),
          ),
        )
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: CustomizableEffect(
          dotDecoration: DotDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(.4),
            dotBorder: const DotBorder(
              width: 1,
              color: Colors.white,
            ),
            height: 12.h,
            width: 12.w,
          ),
          activeDotDecoration: DotDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            width: 12.h,
            height: 12.w,
            dotBorder: const DotBorder(
              width: 1,
              color: Colors.white,
            ),
          ),
          spacing: 5,
        ),
        activeIndex: activeIndex,
        count: urlImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String urlImage, int index) => Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage(urlImage), fit: BoxFit.fitHeight),
        borderRadius: BorderRadius.circular(16),
      ),
    );
