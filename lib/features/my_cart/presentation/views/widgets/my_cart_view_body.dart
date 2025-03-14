import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_mart_app/core/utils/utils.dart';
import 'package:quick_mart_app/core/widgets/custom_button.dart';
import 'package:quick_mart_app/features/my_cart/presentation/my_cart_cubit/cart_item.dart';
import 'package:quick_mart_app/features/my_cart/presentation/views/widgets/empty_cart.dart';
import 'package:quick_mart_app/features/my_cart/presentation/views/widgets/order_details.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    int count = 1;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          "My Cart",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: count == 0
          ? EmptyCart()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate([
                            ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return CartItem();
                              },
                              separatorBuilder: (context, index) => 5.ph,
                            ),
                            5.ph,
                            OrderDetail(),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: CustomButton(
                      text: "Checkout",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
