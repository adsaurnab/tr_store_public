import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import '../../core/constants/constants.dart';
import '../model/product_model.dart';
import 'db_helper.dart';

class ProductDb {

  final _database = DatabaseHelper.instance.database;


  ProductDb._privateConstructor();

  static final ProductDb instance = ProductDb._privateConstructor();

  final String _tableName = "product";


  Future<void> insertProductData(ProductModel product) async {
    final db = await _database;

    await db.insert(
      _tableName,
      product.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    logger.i("done inserting");
  }


  Future<ProductModel?> getProductData(int id) async {
    final db = await _database;

    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return productModelFromJson(jsonEncode(maps[0]));
    }
    return null;
  }

  Future<List<ProductModel>> allProductData() async {
    final db = await _database;

    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return productModelFromJson(jsonEncode(maps[i]));
    });
  }

  Future<void> updateProductData(ProductModel productData) async {
    final db = await _database;
    await db.update(
      _tableName,
      productData.toJson(),
      where: 'id = ?',
      whereArgs: [productData.id],
    );
  }

  Future<void> deleteProductData(int id) async {
    final db = await _database;

    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllProductDataFromTable() async {
    final db = await _database;
    await db.rawDelete("DELETE FROM $_tableName");
  }
}
