import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../database_local/database_favourite.dart';

class DataBaseHelper {
  DataBaseHelper._privateConstructor();
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, 'cartProducts.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE cartProducts(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,website TEXT NOT NULL )",
    );
  }

  Future<List<FavouriteProduct>> getcartProducts() async {
    Database db = await instance.database;

    var cartProducts = await db.query('cartProducts', orderBy: 'name');

    List<FavouriteProduct> favouriteProductList = cartProducts.isNotEmpty
        ? cartProducts.map((c) => FavouriteProduct.fromMap(c)).toList()
        : [];
    return favouriteProductList;
  }

  Future<int> add(FavouriteProduct FavouriteProduct) async {
    Database db = await instance.database;
    return await db.insert('cartProducts', FavouriteProduct.toMap());
  }

  Future<int> remove(String name) async {
    Database db = await instance.database;
    return await db.delete('cartProducts', where: 'name=?', whereArgs: [name]);
  }
}
