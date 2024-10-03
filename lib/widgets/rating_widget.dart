import 'package:ekhoncharge/settings/pamas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWidget extends StatelessWidget {
  final double rating;

  RatingWidget({required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating, // Replace with your rating
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 12,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        // Handle the rating update if needed
        print(rating);
      },
    );
  }
}
