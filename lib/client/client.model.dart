import 'package:shop/helper.dart';
import 'package:sqflite/sqflite.dart';

class Client {
  final int? id;
  final String name;
  final String lastName;
  final String email;
  final String phone;
  final String address;
  final int status;

  const Client({
    this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.address,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'address': address,
      'status': status,
    };
  }

  @override
  String toString() {
    return 'Client{id: $id, name: $name, last_name: $lastName, email: $email, phone: $phone, address: $address, status: $status}';
  }

  static Future<List<Client>> getClient() async {
    final Database db = await DbHelper.initDb();
    final List<Map<String, dynamic>> maps = await db.query('clients');
    return List.generate(maps.length, (i) {
      return Client(
        id: maps[i]['id'],
        name: maps[i]['name'],
        lastName: maps[i]['last_name'],
        email: maps[i]['email'],
        phone: maps[i]['phone'],
        address: maps[i]['address'],
        status: maps[i]['status'],
      );
    });
  }

  static Future<int> insertClient(Client client) async {
    final Database db = await DbHelper.initDb();
    final int result = await db.insert('clients', client.toMap());
    return result;
  }

  static Future<int> updateClient(Client client) async {
    final Database db = await DbHelper.initDb();
    return await db.update(
      'clients',
      client.toMap(),
      where: 'id = ?',
      whereArgs: [client.id],
    );
  }

  static Future<int> deleteClient(int id) async {
    final Database db = await DbHelper.initDb();
    return await db.delete(
      'clients',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
