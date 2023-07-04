import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controller/counter_controller.dart';
import 'package:getx_practice/controller/product_controller.dart';
import 'package:getx_practice/res/allProducts.dart';
import 'package:getx_practice/views/screens/cartpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterController counterController = Get.put(CounterController());
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping app'),
        centerTitle: true,
        actions: [
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              Get.to(
                () => const CartPage(),
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                transition: Transition.fade,
              );
            },
            child: const Icon(Icons.shopping_cart_outlined),
          ),
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
      body: ListView.builder(
        itemCount: allProducts.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 3,
            child: ListTile(
              isThreeLine: true,
              leading: Text("${i + 1}"),
              title: Text("${allProducts[i].name}"),
              subtitle: Text(
                  "${allProducts[i].category}\nRs. ${allProducts[i].price}"),
              trailing: GestureDetector(
                onTap: () {
                  productController.addProduct(product: allProducts[i]);
                },
                child: const Icon(Icons.add_shopping_cart),
              ),
            ),
          );
        },
      ),

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Obx(
      //         () {
      //           return Text(
      //             "${counterController.counter.i}",
      //             style: const TextStyle(fontSize: 50),
      //           );
      //         },
      //       ),
      //       const SizedBox(height: 20),
      //       ElevatedButton(
      //         onPressed: () {
      //           Get.defaultDialog(
      //             backgroundColor: Colors.white,
      //             title: "Dialog title",
      //             actions: [
      //               const TextField(
      //                 decoration: InputDecoration(
      //                   border: OutlineInputBorder(),
      //                   hintText: 'Enter name',
      //                   labelText: 'NAME',
      //                 ),
      //               ),
      //             ],
      //             cancel: ElevatedButton(
      //               onPressed: () {},
      //               child: const Text("Update"),
      //             ),
      //             confirm: ElevatedButton(
      //               onPressed: () {
      //                 Get.to(const NextPage());
      //               },
      //               child: const Text("Cancel"),
      //             ),
      //             middleText: 'middle',
      //           );
      //         },
      //         child: const Text('show Dialog'),
      //       ),
      //       const SizedBox(height: 20),
      //       ElevatedButton(
      //         onPressed: () {
      //           Get.bottomSheet(
      //             isDismissible: true,
      //             elevation: 5,
      //             enterBottomSheetDuration: const Duration(milliseconds: 500),
      //             exitBottomSheetDuration: const Duration(milliseconds: 500),
      //             Container(
      //               height: 350,
      //               width: double.infinity,
      //               decoration: BoxDecoration(
      //                 color: Colors.grey.shade300,
      //                 borderRadius: BorderRadius.circular(10),
      //               ),
      //               child: const Center(
      //                 child: Text("My BottomSheet"),
      //               ),
      //             ),
      //           );
      //         },
      //         child: const Text('show bottomSheet'),
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.indigo,
      //   onPressed: () {
      //     counterController.increment();
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
