import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controller/product_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  ProductController productController = Get.find();
  int index = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
        centerTitle: true,
        actions: [
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              Get.changeThemeMode(
                  (Get.isDarkMode == true) ? ThemeMode.light : ThemeMode.dark);
            },
            child: const Icon(Icons.light_mode_outlined),
          ),
          const SizedBox(width: 10),
        ],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          (productController.addProducts.isEmpty)
              ? const Center(
                  child: Text("No items yet..."),
                )
              : Obx(
                  () {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: productController.addProducts.length,
                          itemBuilder: (context, i) {
                            index = i;
                            return Card(
                              elevation: 3,
                              margin: const EdgeInsets.all(10),
                              child: SizedBox(
                                height: 100,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("${i + 1}"),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 11,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          children: [
                                            Text(
                                              "${productController.addProducts.keys.toList()[i].name}",
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "${productController.addProducts.keys.toList()[i].category}",
                                              style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              "Rs. ${productController.addProducts.keys.toList()[i].price}",
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                productController.removeProduct(
                                                    product: productController
                                                        .addProducts.keys
                                                        .toList()[i]);
                                              },
                                              icon: const Icon(
                                                Icons
                                                    .remove_shopping_cart_outlined,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    productController.addProduct(
                                                        product:
                                                            productController
                                                                .addProducts
                                                                .keys
                                                                .toList()[i]);
                                                  },
                                                  child: Container(
                                                    height: 25,
                                                    width: 25,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color:
                                                            (Get.isDarkMode ==
                                                                    true)
                                                                ? Colors.white
                                                                : Colors.black,
                                                        width: 1,
                                                      ),
                                                      color: Colors.transparent,
                                                    ),
                                                    child: const Icon(Icons.add,
                                                        size: 17),
                                                  ),
                                                ),
                                                Container(
                                                  height: 25,
                                                  width: 25,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: (Get.isDarkMode ==
                                                              true)
                                                          ? Colors.white
                                                          : Colors.black,
                                                      width: 1,
                                                    ),
                                                    color: Colors.transparent,
                                                  ),
                                                  child: Text(
                                                      "${productController.addProducts.values.toList()[i]}"),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    productController
                                                        .removeProduct(
                                                            product:
                                                                productController
                                                                    .addProducts
                                                                    .keys
                                                                    .toList()[i]);
                                                  },
                                                  child: Container(
                                                    height: 25,
                                                    width: 25,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color:
                                                            (Get.isDarkMode ==
                                                                    true)
                                                                ? Colors.white
                                                                : Colors.black,
                                                        width: 1,
                                                      ),
                                                      color: Colors.transparent,
                                                    ),
                                                    child: const Icon(
                                                        Icons.remove,
                                                        size: 17),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        Text("Total Price : ${productController.totalPrice}"),
                      ],
                    );
                  },
                ),
        ],
      ),
    );
  }
}
