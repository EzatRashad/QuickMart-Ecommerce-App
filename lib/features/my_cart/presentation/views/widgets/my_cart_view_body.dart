import 'package:flutter/material.dart';
import 'package:quick_mart_app/core/utils/utils.dart';
import 'package:quick_mart_app/features/my_cart/presentation/my_cart_cubit/cart_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CartItem();
                },
                separatorBuilder: (context, index) => 5.ph,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
