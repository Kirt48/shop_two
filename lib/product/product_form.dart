
import 'package:flutter/material.dart';
import 'package:shop/product/product.model.dart';
import 'package:shop/product/product_list.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _statusController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Agregar producto",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      border: Border.all(color: Colors.black, width: 4)),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                            width: 500,
                            height: 300,
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Registrar producto",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGnpPiXaX_B-pX89wUuGa3dkHjm_P2Nt6s9w"),
                              ],
                            )),
                        Divider(),

                        // NAME
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            autofocus: true,
                            controller: _nameController,
                            decoration: const InputDecoration(
                                floatingLabelStyle:
                                    TextStyle(color: Colors.black),
                                focusColor: Colors.black,
                                icon: Icon(Icons.abc),
                                label: Text("Ingrese el nombre"),
                                focusedBorder: OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ingrese un nombre";
                              }
                              return null;
                            },
                          ),
                        ),

                        // PRICE
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            autofocus: true,
                            controller: _priceController,
                            decoration: const InputDecoration(
                                floatingLabelStyle:
                                    TextStyle(color: Colors.black),
                                focusColor: Colors.black,
                                icon: Icon(Icons.price_change),
                                label: Text("Ingrese el precio"),
                                focusedBorder: OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ingrese un precio";
                              } else if (int.parse(value) < 0) {
                                return "Ingrese un precio valido";
                              }
                              return null;
                            },
                          ),
                        ),

                        // QUANTITY
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            autofocus: true,
                            controller: _quantityController,
                            decoration: const InputDecoration(
                                floatingLabelStyle:
                                    TextStyle(color: Colors.black),
                                focusColor: Colors.black,
                                icon: Icon(Icons.price_change),
                                label: Text("Ingrese la cantidad"),
                                focusedBorder: OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ingrese una cantidad";
                              } else if (int.parse(value) < 0) {
                                return "Ingrese una cantidad valida";
                              }
                              return null;
                            },
                          ),
                        ),

                        //  STATE
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            autofocus: true,
                            controller: _statusController,
                            decoration: const InputDecoration(
                                floatingLabelStyle:
                                    TextStyle(color: Colors.black),
                                focusColor: Colors.black,
                                icon: Icon(Icons.price_change),
                                label: Text("Ingrese el estado"),
                                focusedBorder: OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ingrese un estado";
                              } else if (int.parse(value) != 1 &&
                                  int.parse(value) != 2) {
                                return "Ingrese un estado valido";
                              }
                              return null;
                            },
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.red)),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Cancelando')),
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancelar',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => Colors.black),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      saveProduct();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Registro exitoso')),
                                      );
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProductList()));
                                    }
                                  },
                                  child: const Text(
                                    'Enviar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void saveProduct() async {
    final name = _nameController.text;
    final price = _priceController.text;
    final quantity = _quantityController.text;
    final status = _statusController.text;
    Product product = Product(
      name: name,
      price: int.parse(price),
      quantity: int.parse(quantity),
      status: int.parse(status),
    );
    await Product.insertProduct(product);
  }
}
