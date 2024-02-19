import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import '../../core/constants/constants.dart';
import '../model/shopping_cart_model.dart';
import 'db_helper.dart';

class ShoppingCartDb {

  final _database = DatabaseHelper.instance.database;


  ShoppingCartDb._privateConstructor();

  static final ShoppingCartDb instance = ShoppingCartDb._privateConstructor();

  final String _tableName = "cart";


  Future<void> insertShoppingCartData(ShoppingCartModel shoppingCart) async {
    final db = await _database;

    await db.insert(
      _tableName,
      shoppingCart.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    logger.i("done inserting");
  }


  Future<ShoppingCartModel?> getShoppingCartData(int id) async {
    final db = await _database;

    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return shoppingCartModelFromJson(jsonEncode(maps[0]));
    }
    return null;
  }


  Future<ShoppingCartModel?> getShoppingCartDataByProductId(int productId) async {
    final db = await _database;

    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'product_id = ?',
      whereArgs: [productId],
    );
    if (maps.isNotEmpty) {
      return shoppingCartModelFromJson(jsonEncode(maps[0]));
    }
    return null;
  }

  Future<List<ShoppingCartModel>> allShoppingCartData() async {
    final db = await _database;

    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return shoppingCartModelFromJson(jsonEncode(maps[i]));
    });
  }

  Future<void> updateShoppingCartData(ShoppingCartModel shoppingCartData) async {
    final db = await _database;
    await db.update(
      _tableName,
      shoppingCartData.toJson(),
      where: 'id = ?',
      whereArgs: [shoppingCartData.id],
    );
  }

  Future<void> deleteShoppingCartData(int id) async {
    final db = await _database;

    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllShoppingCartDataFromTable() async {
    final db = await _database;
    await db.rawDelete("DELETE FROM $_tableName");
  }
}
