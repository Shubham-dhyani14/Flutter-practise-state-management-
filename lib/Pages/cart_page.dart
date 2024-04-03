import 'package:cart_state_management/Providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(Provider.of<CartProvider>(context).cart);
    return  Scaffold(
      appBar: AppBar(title: Text('Cart', style: Theme.of(context).textTheme.titleMedium,),),
      body: ListTile(
        leading: const CircleAvatar(
          radius: 34,
          backgroundImage: AssetImage('assets/images/shoes_1.png',),
        ),
        title: Text('data' ,style: Theme.of(context).textTheme.titleMedium,),
        subtitle: const Text('subed'),
        trailing: IconButton(onPressed:  (){}, icon: const Icon(Icons.delete , color: Colors.red,)),
      ),
    ) ;
  }
}