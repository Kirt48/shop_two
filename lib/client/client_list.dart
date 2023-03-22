
import 'package:flutter/material.dart';
import 'package:shop/client/client.model.dart';
import 'package:shop/client/client_form.dart';
import 'package:shop/product/product.model.dart';
import 'package:shop/product/product_form.dart';

class ClientList extends StatefulWidget {
  const ClientList({super.key});

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  List<Client> clients = [];
  String mensaje = "";
  @override
  void initState() {
    loadClients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Clientes registrados",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
        child: ListView.separated(
          itemCount: clients.isNotEmpty ? clients.length : 1,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(
              ),
          itemBuilder: (BuildContext context, int index) {
            if (clients.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  child: Text(
                    'No hay clientes registrados',
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nombre: ${clients[index].name}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Apellido: ${clients[index].lastName}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Correo: ${clients[index].email}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Telefono: ${clients[index].phone}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Direccion: ${clients[index].address}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  clients[index].status == 1
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
                              Client.deleteClient(clients[index].id!);
                              loadClients();
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
            MaterialPageRoute(builder: (context) => const ClientForm())),
        child: const Icon(Icons.add),
      ),
    );
  }

  void loadClients() async {
    final clientList = await Client.getClient();
    setState(() {
      clients = clientList;
    });
  }
}
