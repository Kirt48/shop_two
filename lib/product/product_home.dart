
import 'package:flutter/material.dart';
import 'package:shop/product/product_form.dart';
import 'package:shop/product/product_list.dart';

class ProductHome extends StatefulWidget {
  const ProductHome({super.key});

  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Productos",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductForm()));
            },
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 230,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
                        child: Image.network(
                            "https://icon-library.com/images/add-to-cart-icon/add-to-cart-icon-20.jpg"),
                      ),
                      const Text(
                        "Agregar producto",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductList()));
            },
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 230,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      border: Border.all(color: Colors.black, width: 3)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
                        child: Image.network(
                            "https://uxwing.com/wp-content/themes/uxwing/download/logistics-shipping-delivery/search-product-icon.png"),
                      ),
                      const Text(
                        "Ver productos",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
