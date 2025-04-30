import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_mart_app/core/utils/app_color.dart';
import 'package:quick_mart_app/core/utils/utils.dart';
import 'package:quick_mart_app/features/home/domain/entities/get_cart_response_entity.dart';
import 'package:quick_mart_app/features/home/presentation/get_cart_items_cubit/get_cart_items_cubit.dart';

class CartAndWishProduct extends StatelessWidget {
  const CartAndWishProduct(
      {super.key, this.isCart = false, required this.getProductsEntity});
  final bool isCart;
  final GetProductsEntity? getProductsEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 3.h, right: 3.w, bottom: 3.h),
      height: 132.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              getProductsEntity?.product?.imageCover ?? "",
              fit: BoxFit.fill,
              width: 120.w,
              height: 132.h,
            ),
          ),
          5.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(getProductsEntity?.product!.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.07,
                        )),
                Text('\$${getProductsEntity?.price}',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 12,
                        )),
                Text(
                  '\$${(getProductsEntity?.price ?? 0) + 20}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                ),
                Spacer(),
                isCart
                    ? Row(
                        children: [
                          Container(
                            width: 96.w,
                            height: 28.h,
                            padding: const EdgeInsets.all(4),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: AppColors.grey50),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      GetCartItemsCubit.get(context)
                                          .updateCartItemQuantity(
                                              getProductsEntity?.product?.id ??
                                                  "",
                                              ((getProductsEntity?.count ?? 0) +
                                                      1)
                                                  .toString());
                                    },
                                    child: Icon(Icons.add, size: 18.sp)),
                                Text(getProductsEntity?.count.toString() ?? "0",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                        )),
                                GestureDetector(
                                    onTap: () {
                                      GetCartItemsCubit.get(context)
                                          .updateCartItemQuantity(
                                              getProductsEntity?.product?.id ??
                                                  "",
                                              ((getProductsEntity?.count ?? 0) -
                                                      1)
                                                  .toString());
                                    },
                                    child: Icon(Icons.minimize, size: 18.sp)),
                              ],
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              GetCartItemsCubit.get(context).deleteItemFromCart(
                                  getProductsEntity?.product?.id ?? "");
                            },
                            child: SvgPicture.asset('assets/images/trash.svg',
                                height: 22.h),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: SvgPicture.asset('assets/images/trash.svg',
                                height: 22.h),
                          ),
                          5.pw,
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
