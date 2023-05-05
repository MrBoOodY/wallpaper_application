// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wallpaper_application/common/core_data_source/exception.dart'
    as exc;

part 'sqlite_service.g.dart';

@Riverpod(keepAlive: true)
SQLiteService sqliteService(SqliteServiceRef ref) {
  return SQLiteServiceImpl();
}

abstract class SQLiteService {
  late Database database;
  Future openDatabaseConnection();
}

class SQLiteServiceKeys {
  SQLiteServiceKeys._();
  static final _singleton = SQLiteServiceKeys._();
  factory SQLiteServiceKeys() => _singleton;
  static const _dataBaseName = 'circles.db';
  static const photosTable = 'photos';
}

class SQLiteServiceImpl extends SQLiteService {
  @override
  late Database database;

  Future<void> closeDataBase() async => await database.close();

  //Databases Path
  late String databasesPath;

  // Delete the database
  Future deleteDatabaseByPath() async => await deleteDatabase(databasesPath);
  //End of Delete the database

// open the database
  @override
  Future openDatabaseConnection() async {
    databasesPath = await getDatabasesPath();
    database = await openDatabase(
        '$databasesPath/${SQLiteServiceKeys._dataBaseName}',
        version: 1,
        onUpgrade: onUpgrade,
        onCreate: onCreate);
  }

  FutureOr onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute('''
            CREATE TABLE ${SQLiteServiceKeys.photosTable} 
            (id INTEGER PRIMARY KEY,
             width INTEGER,
             height INTEGER,
             url TEXT,
             photographer TEXT,
             photographer_url TEXT,
             photographer_id INTEGER,
             avg_color TEXT,
             src TEXT,
             liked INTEGER,
             alt TEXT)''');
  }

  Future<FutureOr> onUpgrade(db, oldVersion, newVersion) async {
    print(oldVersion);
    print(newVersion);
    if (oldVersion != newVersion) {
      try {} catch (e) {
        print(e);
      }
    }
  }
}

mixin DataSourceSQFLiteOperation<T> {
  SQLiteService get sqliteService;
  String get tableName;
  T Function(Map<String, dynamic> json) get fromJson;
  Map<String, dynamic> Function(T) get toJson;
  Future<T> add({required T model}) async {
    try {
      final inserted = await sqliteService.database.insert(
        tableName,
        toJson(model),
      );
      if (inserted == 0) {
        throw exc.DatabaseException();
      } else {
        return model;
      }
    } catch (exception) {
      rethrow;
    }
  }

  Future<T> upsert({required int id, required T model}) async {
    try {
      final existingRecords = await sqliteService.database.query(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      if (existingRecords.isNotEmpty) {
        // If the record already exists, update it
        final updated = await sqliteService.database.update(
          tableName,
          toJson(model),
          where: 'id = ?',
          whereArgs: [id],
        );
        if (updated == 0) {
          throw exc.DatabaseException();
        } else {
          return model;
        }
      } else {
        // If the record does not exist, insert it
        final inserted = await sqliteService.database.insert(
          tableName,
          toJson(model),
        );
        if (inserted == 0) {
          throw exc.DatabaseException();
        } else {
          return model;
        }
      }
    } catch (exception) {
      rethrow;
    }
  }

  Future<T?> getById({required int id}) async {
    try {
      final result = await sqliteService.database.query(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      final List<T> list = result.map((json) => fromJson(json)).toList();
      if (list.isNotEmpty) {
        return list.first;
      }
      return null;
    } catch (exception) {
      rethrow;
    }
  }

  Future<List<T>> getAll({int? page, int? pageSize}) async {
    try {
      final result = await sqliteService.database.query(
        tableName,
        limit: pageSize,
        offset: page,
      );
      final List<T> list = result.map((json) => fromJson(json)).toList();

      return list;
    } catch (exception) {
      rethrow;
    }
  }

  Future<bool> delete({required int id}) async {
    try {
      final deleted = await sqliteService.database.delete(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      return deleted == 1;
    } catch (exception) {
      rethrow;
    }
  }

  Future<bool> deleteAll({required String id}) async {
    try {
      final deleted = await sqliteService.database.delete(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );

      return deleted == 1;
    } catch (exception) {
      rethrow;
    }
  }
}
