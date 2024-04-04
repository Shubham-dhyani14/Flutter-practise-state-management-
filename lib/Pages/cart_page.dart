import 'package:cart_state_management/Providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String,dynamic>> cart = Provider.of<CartProvider>(context).cart ;
    return  Scaffold(

      appBar: AppBar(title: Text('Cart', style: Theme.of(context).textTheme.titleMedium,),),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
        final cartItem = cart[index] ;
        return  ListTile(
          leading:  CircleAvatar(
            radius: 34,
            backgroundImage: AssetImage(cartItem['imageUrl'],),
          ),
          title: Text(cartItem['title'] ,style: Theme.of(context).textTheme.titleMedium,),
          subtitle: Text(cartItem['selectedSize'].toString()),
          trailing: IconButton(onPressed:  (){
            context.read<CartProvider>().removeProduct(cartItem) ;
          }, icon: const Icon(Icons.delete , color: Colors.red,)),
        ) ;
        },
      )
      
      
      
    ) ;
  }
}