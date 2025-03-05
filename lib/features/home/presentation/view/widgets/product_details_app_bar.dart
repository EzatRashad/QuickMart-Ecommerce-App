import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_mart_app/core/utils/app_color.dart';
import 'package:quick_mart_app/core/utils/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsAppBar extends StatefulWidget {
  const ProductDetailsAppBar({super.key, required this.images});

  final List<String> images;

  @override
  State<ProductDetailsAppBar> createState() => _ProductDetailsAppBarState();
}

class _ProductDetailsAppBarState extends State<ProductDetailsAppBar> {
  int carouselIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: AppColors.black,
          child: Icon(
            FontAwesomeIcons.heart,
            size: 20.sp,
            color: AppColors.white,
          ),
        ),
        20.pw
      ],
      expandedHeight: MediaQuery.sizeOf(context).height * 0.4,
      elevation: 0,
      pinned: true,
      backgroundColor: AppColors.white,
      stretch: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () => Navigator.of(context).pop(),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: Column(
          children: [
            Container(
              height: 32.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r),
                ),
              ),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: widget.images.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.cyan,
                  dotHeight: 6.h,
                  dotWidth: 6.w,
                  expansionFactor: 3,
                ),
              ),
            ),
          ],
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [StretchMode.blurBackground, StretchMode.zoomBackground],
        background: PageView.builder(
          controller: _pageController,
          itemCount: widget.images.length,
          onPageChanged: (index) {
            setState(() {
              carouselIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return Image.network(
              widget.images[index] ?? "",
              fit: BoxFit.fill,
              height: MediaQuery.sizeOf(context).height * 0.46,
              width: double.infinity,
            );
          },
        ),
      ),
    );
  }
}
