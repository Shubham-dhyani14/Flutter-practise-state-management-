import 'dart:convert';

import 'package:cart_state_management/Providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key , required this.product});
  final Map<String, Object> product ;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  int selectedSize = 0 ;
  @override
  Widget build(BuildContext context) {

   final List<int> sizes = widget.product['sizes'] as List<int>;

    return  Scaffold(
      appBar: AppBar(title: Text('Details' ,style: Theme.of(context).textTheme.titleMedium,),),
      body: Column( 
        children: [
          Text(widget.product['title'] as String , style: Theme.of(context).textTheme.titleLarge,) ,
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Image.asset(widget.product['imageUrl'] as String ,height: 300,),
          ),
          const Spacer(flex: 2,),
          Container(
            // width: double.infinity, -- tip: this will make to give width to listVbuild chips
            height: 250,
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius:  const BorderRadius.vertical(top: Radius.circular(22)),
            ),
            child: Column(children: [
              const SizedBox(height: 22,) ,
              Text('${widget.product['price'].toString()} ₹' ,style: Theme.of(context).textTheme.titleLarge),

                SizedBox(
                  height: 70,
                  // width: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sizes.length,
                    itemBuilder: (context, index) {
                      int size = sizes[index] ;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedSize = size ;
                            });
                          },
                          child: Chip(
                           label: Text(sizes[index].toString()) ,
                           backgroundColor: selectedSize == size ? Theme.of(context).colorScheme.secondary : Colors.teal.shade50  ,
                                                ),
                        ),);
                    },
                  ),
                ),
                const Spacer() ,
                
                SizedBox(
                  width: 300,
                  child: ElevatedButton.icon(
                    
                    onPressed: (){
                      if(selectedSize == 0){
                        ScaffoldMessenger.of(context).showSnackBar(
                           const SnackBar(
                            duration: Duration(seconds: 2), 
                            content: Text('Jadi Shoe size select karoo..'),
                            ),
                          ) ;
                          return ;
                      }
                      Map<String,dynamic> productWithSize =  jsonDecode(jsonEncode(widget.product)) ;
                      productWithSize['selectedSize'] = selectedSize ;
                      // widget.product['selectedSize'] = selectedSize ;

                     
                      Provider.of<CartProvider>(context , listen: false).addProduct(productWithSize);
                      ScaffoldMessenger.of(context).showSnackBar(
                           const SnackBar(
                            duration: Duration(seconds: 2), 
                            content: Text('Hogya Bhai Add Hogya !!'),
                            ),
                          ) ;
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                    ),
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text('Add to cart'),
                    ),
                ) ,
                const Spacer(flex:2),
            ],),
          )
          
        ],
      ),
    ) ;
  }
}