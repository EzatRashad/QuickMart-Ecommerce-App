import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quick_mart_app/core/utils/utils.dart';

class RateWidget extends StatelessWidget {
  const RateWidget(
      {super.key, required this.ratingsAverage, required this.ratingsQuantity});
  final num ratingsAverage;
  final num ratingsQuantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$ratingsAverage ($ratingsQuantity reviews) ",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Spacer(),
        RatingBar.builder(
          itemSize: 15,
          initialRating: 2.5,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        5.pw,
      ],
    );
  }
}
