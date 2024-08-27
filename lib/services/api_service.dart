import 'package:mydevice/models/login_user_model.dart';
import 'package:mydevice/models/organization_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'webrtc.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        print("Creating tables...");
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)',
        );
        await db.execute(
          'CREATE TABLE IF NOT EXISTS organizations('
              'id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'name TEXT, '
              'admin_first_name TEXT, '
              'admin_last_name TEXT, '
              'type TEXT, '
              'category TEXT, '
              'size TEXT, '
              'gst_no TEXT, '
              'msme_no TEXT, '
              'contact_no TEXT, '
              'address TEXT'
              ')',
        );

        await db.execute(
          "CREATE TABLE assets("
              "id INTEGER PRIMARY KEY AUTOINCREMENT, "
              "assetType TEXT, "
              "modelName TEXT, "
              "modelNo TEXT, "
              "serialNo TEXT"
              ")",
        );
        print("Tables created.");
      },
    );
  }


  Future<void> insertUser(LoginUser loginUser) async {
    final db = await this.db;

    await db.insert(
      'users',
      loginUser.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getUserByEmail(String email) async {
    final db = await this.db;

    return await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
  }

  Future<List<Map<String, dynamic>>> getUserByEmailAndPassword(String email,
      String password) async {
    final db = await this.db;

    return await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
  }
  Future<void> insertOrganization(OrganizationModel organization) async {
    final dbClient = await db;
    await dbClient.insert(
      'organizations',
      organization.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<OrganizationModel?> getOrganizationById(int id) async {
    final dbClient = await db;
    final result = await dbClient.query(
      'organizations',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return OrganizationModel.fromMap(result.first);
    }
    return null;
  }
  Future<void> updateOrganization(OrganizationModel organization) async {
    final dbClient = await db;
    await dbClient.update(
      'organizations',
      organization.toMap(),
      where: 'id = ?',
      whereArgs: [organization.id],
    );
  }
  Future<void> deleteOrganization(int id) async {
    final dbClient = await db;
    await dbClient.delete(
      'organizations',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> checkTableExists(Database db, String tableName) async {
    final result = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
      [tableName],
    );
    if (result.isEmpty) {
      print('Table $tableName does not exist.');
    } else {
      print('Table $tableName exists.');
    }
  }

  Future<void> insertAsset(Map<String, dynamic> asset) async {
    final dbClient = await db;
    try {
      await checkTableExists(dbClient, 'assets');
      await dbClient.insert(
        'assets',
        asset,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('Error inserting asset: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getAssets() async {
    final dbClient = await db;
    try {
      await checkTableExists(dbClient, 'assets');
      return await dbClient.query('assets');
    } catch (e) {
      print('Error retrieving assets: $e');
      return [];
    }
  }

  Future<void> updateAsset(Map<String, dynamic> asset) async {
    final dbClient = await db;
    try {
      await checkTableExists(dbClient, 'assets');
      await dbClient.update(
        'assets',
        asset,
        where: "id = ?",
        whereArgs: [asset['id']],
      );
    } catch (e) {
      print('Error updating asset: $e');
    }
  }

  Future<void> deleteAsset(int id) async {
    final dbClient = await db;
    try {
      await checkTableExists(dbClient, 'assets');
      await dbClient.delete(
        'assets',
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (e) {
      print('Error deleting asset: $e');
    }
  }
}