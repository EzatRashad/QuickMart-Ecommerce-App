import 'package:flutter/material.dart';
import 'package:quick_mart_app/core/utils/utils.dart';
import 'package:quick_mart_app/core/widgets/custom_button.dart';
import 'package:quick_mart_app/core/widgets/empty_and_wish_product.dart';
import 'package:quick_mart_app/core/widgets/empty_widget.dart';
import 'package:quick_mart_app/features/home/presentation/view/widgets/order_details.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    int count = 2;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          "My Cart",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: count == 0
          ? EmptyWidget(
              image: 'assets/images/empty1.png',
              description:
                  "Looks like you have not added anything in your cart. Go ahead and explore top categories.",
              message: 'Your Cart is empty')
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
                                return EmptyAndWishProduct(
                                  isCart: true,
                                );
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
