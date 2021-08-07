import 'package:get/get.dart';
import 'package:shop_with_getx/models/Product.dart';

class ShopController extends GetxController{
 var products = <Product>[].obs;
  @override
  void onInit() {
super.onInit();
fetchProducts();

  }


  Future fetchProducts() async {
   
        await Future.delayed(Duration(seconds: 2));
        List<Product> someList=[];

                    for (var i in [1,2,3,4]) {
                      Product product = Product(name:'Product '+i.toString(), imageLink:'Pic Link Here',);

                      someList.add(product);
                      products.value= someList;
     
                    }   
                  
        
}

void removeFromList(int index){
  products.removeAt(index);
}


}

