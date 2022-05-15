import 'package:flutter/material.dart';

class RatingAndClicks extends StatelessWidget {
  const RatingAndClicks(
      {Key? key,
      required this.size,
      required this.averageVotes,
      required this.voteCount,
      required this.textColor})
      : super(key: key);
  final Color textColor;
  final Size size;
  final double averageVotes;
  final int voteCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.1,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 32, right: 8),
            child: Icon(
              Icons.star,
              size: 36,
              color: Colors.amber,
            ),
          ),
          Column(
            children: [
              Text(
                "$averageVotes / 10",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              ),
              Text(
                '$voteCount votes',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
