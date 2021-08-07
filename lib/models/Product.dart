import 'package:flutter/material.dart';
import 'package:shop_with_getx/views/CartPage/CartPage.dart';
import 'package:shop_with_getx/views/ShopPage/ShopPage.dart';

class Product{
  final String name;
  final String imageLink;

  Product({required this.name,required this.imageLink});

}

const List<Widget> pages = <Widget>[
  ShopPage(),
  CartPage(),
];