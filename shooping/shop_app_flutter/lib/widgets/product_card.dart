import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color bgColor;
  const ProductCard(
      {required this.title,
      required this.price,
      required this.image,
      required this.bgColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color:bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '\$$price',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: 10,
          ),
          Center(child: Image.asset(height: 175, image)),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
