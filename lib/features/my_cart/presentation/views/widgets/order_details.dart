import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 3.h,
      children: [
        Text(
          'Order Info',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 16.sp),
        ),
        DetailsRow(
          title: 'Subtotal',
          value: '\$27.25',
        ),
        DetailsRow(
          title: 'Shipping Cost',
          value: '\$0.00',
        ),
        DetailsRow(
          title: 'Total',
          value: '\$27.25',
        ),
      ],
    );
  }
}

class DetailsRow extends StatelessWidget {
  const DetailsRow({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 34,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
