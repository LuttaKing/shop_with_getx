import 'package:flutter/material.dart';
import 'package:shop_with_getx/controller/CartController.dart';
import 'package:shop_with_getx/views/CartPage/CartPage.dart';
import 'package:shop_with_getx/views/ShopPage/ShopPage.dart';
import 'package:get/get.dart';
import 'package:shop_with_getx/controller/ShopController.dart';

class MainNavPage extends StatefulWidget {
  const MainNavPage({ Key? key }) : super(key: key);

  @override
  _MainNavPageState createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  int _selectedIndex = 0; 
  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}
final shopController = Get.put(ShopController());
static const List<Widget> _pages = <Widget>[
  ShopPage(),
  CartPage(),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingBtn(),

      appBar: AppBar(title: Text('Shop With Getx'),centerTitle: true,actions: [
       IconButton(onPressed: (){
shopController.fetchProducts();
       }, 
       icon:  Icon(Icons.add,color: Colors.white,)) ],),

       body: Center(child: _pages[_selectedIndex],),

    bottomNavigationBar: BottomNavigationBar(   currentIndex: _selectedIndex, onTap: _onItemTapped,  
    items: const <BottomNavigationBarItem>[BottomNavigationBarItem( icon: Icon(Icons.home), label: 'Shop',  ),BottomNavigationBarItem(  icon: Icon(Icons.shopping_cart_outlined),label: 'Cart', ),
    ],
  ),
      
    );


  }
}

class FloatingBtn extends StatelessWidget {
  const FloatingBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(onPressed: (){},label: GetX<CartController>(builder: (controller){
       return Text(controller.cart_products.length.toString()+'Cart items');
     }),
   );
  }
}