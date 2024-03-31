// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key , required this.title , required this.imageUrl , required this.price , required this.color }); // doubt ⚠️ can't i  make color as optional init with default val
  final String title  ;
  final String imageUrl ;
  final double price  ;
  final Color color ;
  // final List<int> sizes  ;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12) ,
        ), 
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 21 ,vertical: 12),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium,) , 
          Text('${price.toStringAsFixed(0)} ₹', style: Theme.of(context).textTheme.titleSmall) , 
          Image.asset(imageUrl.toString())
        ],
      ),
    );
  }
}