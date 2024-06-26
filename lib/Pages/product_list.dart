import 'package:cart_state_management/Pages/product_details_page.dart';
import 'package:cart_state_management/constants/product_data.dart';
import 'package:cart_state_management/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProductList> {
  final List<String> brandsList = const ['All' , 'Adidas' , 'Nike', 'Puma' ] ;

  int activeBrandChip = 0 ;

  @override
  Widget build(BuildContext context) {
    return  Container(
          padding: const EdgeInsets.fromLTRB(12, 43, 0, 0) ,
          child:  
          Column(children: [
            const Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Shoes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold ,
                    fontSize: 32 ,
                  ),
                  ),
                  Text('Collection',
                  style: TextStyle(
                    fontWeight: FontWeight.bold ,
                    fontSize: 32 ,
                  ),
                  ),
                ],
              ) ,
             SizedBox(width: 23,),
              Expanded(
               child:  TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Kuch bhi...' ,
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(32))
                  )
                ),
              ),
              )
              
            ],),
            SizedBox(
              height: 100,
              // width: 100,
              // color: Colors.black,
            child:  ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: brandsList.length,
              itemBuilder: (context, index){  return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8 ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      activeBrandChip = index ;
                    });
                  },
                  child: Chip(label:  Text(
                   brandsList[index],style: const TextStyle(color: Colors.black54),) ,
                   backgroundColor: activeBrandChip == index ? Theme.of(context).colorScheme.secondary : Colors.black12 ,
                  //  backgroundColor: Theme.of(context).colorScheme.secondary,
                   padding: const  EdgeInsets.symmetric(horizontal: 18 , vertical: 10),
                   side: BorderSide.none,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23) ),
                   ),
                ),
              );}
              ,)
            ,),
      
            //  Padding( !!doubt : why this widget not giving listview expanded height⚠️⚠️⚠️⚠️
            //   padding:  const EdgeInsets.only(right: 12),
            //   child:  
              Expanded( 
                
                child: Padding(
                  padding:const EdgeInsets.only(right: 12),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    // shrinkWrap: true,
                    itemCount: products.length ,
                    itemBuilder: (context, index) {
                      // return const Text('fdf');
                      return  Column(
                        children: [
                          
                           GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)
                              {
                                return ProductDetail(product: products[index]) ;
                              })) ;
                            },
                             child: ProductCard(
                              title: products[index]['title'].toString(),
                              price: products[index]['price'] as double,
                              imageUrl: products[index]['imageUrl'] as String,
                              color: index%2 == 0 ? Colors.pink.shade100 : Colors.blue.shade100  ,
                              ),
                           ),
                           const SizedBox(height: 22,),
                        ],
                      );
                    },
                  ),
                ),
              )
            // ),
           
          ],),
      
        ) ;
      
  }
}
 
 