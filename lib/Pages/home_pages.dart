import 'package:cart_state_management/Pages/cart_page.dart';
import 'package:cart_state_management/Pages/product_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final List<String> brandsList = const ['All' , 'Adidas' , 'Nike', 'Puma' ] ;
  // int activeBrandChip = 0 ;
  List<Widget> pages =  const [ProductList() , CartPage()] ;
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        bottomNavigationBar:  BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),

          ],
        ),
        body:  IndexedStack(
          index: currentPage,
          children: pages,
        )  ,
        
      ),
    );
  }
}