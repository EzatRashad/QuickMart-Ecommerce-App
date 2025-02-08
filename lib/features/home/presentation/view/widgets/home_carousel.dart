import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/utils/app_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int carouselIndex = 0;

  List<String> images = [
    "assets/images/panner.png",
    "assets/images/panner.png",
    "assets/images/panner.png",
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images
          .map((e) => SizedBox(
                height: 148.h,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Image(
                        image: AssetImage(
                          e,
                        ),
                        height: 184.h,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        right: 16.w,
                        bottom: 12.h,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.r, vertical: 3.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.grey50,
                          ),
                          child: AnimatedSmoothIndicator(
                              activeIndex: carouselIndex,
                              count: images.length,
                              axisDirection: Axis.horizontal,
                              effect: JumpingDotEffect(
                                dotHeight: 10.h,
                                dotWidth: 10.w,
                                activeDotColor: AppColors.cyan,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ))
          .toList(),
      options: CarouselOptions(
        viewportFraction: 1.0,
        height: 148.h,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 9),
        autoPlayAnimationDuration: const Duration(seconds: 2),
        autoPlayCurve: Curves.easeIn,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          carouselIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
