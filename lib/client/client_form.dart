
import 'package:flutter/material.dart';
import 'package:shop/client/client.model.dart';
import 'package:shop/client/client_list.dart';
import 'package:shop/product/product_list.dart';

class ClientForm extends StatefulWidget {
  const ClientForm({super.key});

  @override
  State<ClientForm> createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _statusController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Agregar Cliente",
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
                                    "Registrar cliente",
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
                        const Divider(),

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

                        // LAST NAME
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            autofocus: true,
                            controller: _lastNameController,
                            decoration: const InputDecoration(
                                floatingLabelStyle:
                                    TextStyle(color: Colors.black),
                                focusColor: Colors.black,
                                icon: Icon(Icons.price_change),
                                label: Text("Ingrese el apellido"),
                                focusedBorder: OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ingrese un apellido";
                              }
                              return null;
                            },
                          ),
                        ),

                        // EMAIL
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            autofocus: true,
                            controller: _emailController,
                            decoration: const InputDecoration(
                                floatingLabelStyle:
                                    TextStyle(color: Colors.black),
                                focusColor: Colors.black,
                                icon: Icon(Icons.price_change),
                                label: Text("Ingrese el correo"),
                                focusedBorder: OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ingrese un correo electronico";
                              } 
                              return null;
                            },
                          ),
                        ),
                        
                        // phone
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            autofocus: true,
                            controller: _phoneController,
                            decoration: const InputDecoration(
                                floatingLabelStyle:
                                    TextStyle(color: Colors.black),
                                focusColor: Colors.black,
                                icon: Icon(Icons.price_change),
                                label: Text("Ingrese el telefono"),
                                focusedBorder: OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ingrese un telefono";
                              } 
                              return null;
                            },
                          ),
                        ),
                        
                        // ADDRESS
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            autofocus: true,
                            controller: _addressController,
                            decoration: const InputDecoration(
                                floatingLabelStyle:
                                    TextStyle(color: Colors.black),
                                focusColor: Colors.black,
                                icon: Icon(Icons.price_change),
                                label: Text("Ingrese la direccion"),
                                focusedBorder: OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ingrese una direccion";
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
                                      saveClient();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Registro exitoso')),
                                      );
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ClientList()));
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

  void saveClient() async {
    final name = _nameController.text;
    final lastName = _lastNameController.text;
    final email = _emailController.text;
    final phone = _phoneController.text;
    final address = _addressController.text;
    final status = _statusController.text;
    Client client = Client(
      name: name,
      lastName: lastName,
      email: email,
      phone: phone,
      address: address,
      status: int.parse(status),
    );
    await Client.insertClient(client);
  }
}
