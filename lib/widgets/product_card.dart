// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.pink.shade100 ,
        borderRadius: BorderRadius.circular(12) ,
        ), 
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 21 ,vertical: 12),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Sasta Budget Shoes', style: Theme.of(context).textTheme.titleMedium,) , 
          Text('150 ₹', style: Theme.of(context).textTheme.titleSmall) , 
          Image.asset('assets/images/shoes_3.png')
        ],
      ),
    );
  }
}