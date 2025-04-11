import 'package:flutter/material.dart';
import 'package:quick_mart_app/core/utils/utils.dart';
import 'package:quick_mart_app/core/widgets/empty_and_wish_product.dart';
import 'package:quick_mart_app/core/widgets/empty_widget.dart';

class WishListViewBody extends StatelessWidget {
  const WishListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    int count = 0;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          "Wishlist",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: count == 0
          ? EmptyWidget(
              image: 'assets/images/empty2.png',
              description:
                  "Tap heart button to start saving your favorite items.",
              message: 'Your wishlist is empty')
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
                                return EmptyAndWishProduct();
                              },
                              separatorBuilder: (context, index) => 5.ph,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
