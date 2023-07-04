import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/views/screens/homepage.dart';
import 'package:getx_practice/views/screens/cartpage.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData.light(useMaterial3: true),
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/cart_page', page: () => const CartPage()),
      ],
    ),
  );
}
