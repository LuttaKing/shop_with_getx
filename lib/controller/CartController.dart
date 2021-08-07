import 'package:get/get.dart';
import 'package:shop_with_getx/models/Product.dart';


class CartController extends GetxController{
  var totalCartItems = 0.obs;
   
   var cart_products = <Product>[].obs;


   void addToCart(Product cartProduct){
     cart_products.add(cartProduct);
   }
   
   void removeFromCart(int index){
  cart_products.removeAt(index);
}
}