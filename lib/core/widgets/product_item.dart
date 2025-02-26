import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_mart_app/core/utils/app_color.dart';
import 'package:quick_mart_app/core/utils/navigate.dart';
import 'package:quick_mart_app/features/home/data/models/ProductResponseModel.dart';
import 'package:quick_mart_app/features/home/domain/entities/productResponseEntity.dart';
import 'package:quick_mart_app/features/home/presentation/view/product_details_view.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.nextScreen(ProductDetailsView());
    },
    child: Container(
      //padding: EdgeInsets.all(2.r),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide(width: .5.w, color: AppColors.grey100),
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * .18,
                decoration: ShapeDecoration(
                  color: AppColors.grey50,
                  image: DecorationImage(
                    image: NetworkImage(
                      product.images?.first ?? '',),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              Positioned(
                  top: 5.h,
                  right: 5.w,
                  child: CircleAvatar(
                      radius: 12.r,
                      backgroundColor: AppColors.black,
                      child: Icon(
                        FontAwesomeIcons.heart,
                        size: 10.sp,
                        color: AppColors.white,
                      )))
            ]),
            SizedBox(height: MediaQuery.sizeOf(context).height * .01,),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: 2.0.w),
              child: Column(children: [Text(
                product.title ?? '',

                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    '\$${ product.price ?? ''}',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                ),
               ],),
            )
          ]),
    ),);

  }
}
