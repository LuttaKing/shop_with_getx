import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_with_getx/controller/CartController.dart';


class CartPage extends StatefulWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child:GetX<CartController>(builder: (controller){
         // print(controller.products.length);

          if (controller.cart_products.length==0) {
            return Center(child:Text('Your Cart is empty'));
            
          } else {
            return ListView.builder(
            itemCount: controller.cart_products.length,
          itemBuilder: (BuildContext context,int index)=>Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(controller.cart_products[index].name),

                  Spacer(),

                  Row(
                    children: [
                      IconButton(onPressed: (){
                        controller.removeFromCart(index);
                      }, icon: Icon(Icons.remove)),
                      
                    ],
                  ),
                ],
              ),
            ),),
          ));
          }

          
        },),
    
        
      ),
    );
  }
}