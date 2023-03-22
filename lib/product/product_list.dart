
import 'package:flutter/material.dart';
import 'package:shop/product/product.model.dart';
import 'package:shop/product/product_form.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [];
  String mensaje = "";
  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Productos registrados",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
        child: ListView.separated(
          itemCount: products.isNotEmpty ? products.length : 1,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            if (products.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  child: Text(
                    'No hay productos registrados',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.black, width: 3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nombre: ${products[index].name}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Precio: ${products[index].price}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Cantidad: ${products[index].quantity}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  products[index].status == 1
                                      ? "ACTIVO"
                                      : "INACTIVO",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Product.deleteProduct(products[index].id!);
                              loadProducts();
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8sz4hVbfWpr8ekmKBzd05kSivF22XaoGYGsBUZPcBAKm0TPGDIKgZ0zv1_yLqw7oQH80",
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductForm())),
        child: const Icon(Icons.add),
      ),
    );
  }

  void loadProducts() async {
    final productList = await Product.getProduct();
    setState(() {
      products = productList;
    });
  }
}
