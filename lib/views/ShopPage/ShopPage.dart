import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_with_getx/controller/CartController.dart';
import 'package:shop_with_getx/controller/ShopController.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({ Key? key }) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

 final shopController = Get.put(ShopController());
 final cartController = Get.put(CartController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child:GetX<ShopController>(builder: (controller){
          print(controller.products.length);

          if (controller.products.length==0) {
            return Center(child: CircularProgressIndicator(),);
            
          } else {
            return ListView.builder(
            itemCount: controller.products.length,
          itemBuilder: (BuildContext context,int index)=>Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(controller.products[index].name),

                  Spacer(),

                  Row(
                    children: [
                      
                      IconButton(onPressed: (){
                        controller.removeFromList(index);
                      }, icon: Icon(Icons.remove)),

                      IconButton(onPressed: (){
                     cartController.addToCart(controller.products[index]);
                      }, icon: Icon(Icons.add)),

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