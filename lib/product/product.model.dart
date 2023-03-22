import 'package:shop/helper.dart';
import 'package:sqflite/sqflite.dart';

class Product {
  final int? id;
  final String name;
  final int price;
  final int quantity;
  final int status;

  const Product({
    this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'status': status,
    };
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price, quantity: $quantity, status: $status}';
  }

  static Future<List<Product>> getProduct() async {
    final Database db = await DbHelper.initDb();
    final List<Map<String, dynamic>> maps = await db.query('products');
    return List.generate(maps.length, (i) {
      return Product(
        id: maps[i]['id'],
        name: maps[i]['name'],
        price: maps[i]['price'],
        quantity: maps[i]['quantity'],
        status: maps[i]['status'],
      );
    });
  }

  static Future<int> insertProduct(Product product) async {
    final Database db = await DbHelper.initDb();
    final int result = await db.insert('products', product.toMap());
    return result;
  }

  static Future<int> updateProduct(Product product) async {
    final Database db = await DbHelper.initDb();
    return await db.update(
      'products',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  static Future<int> deleteProduct(int id) async {
    final Database db = await DbHelper.initDb();
    return await db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
