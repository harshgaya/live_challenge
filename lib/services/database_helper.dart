import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:untitled2/models/music_model.dart';

class DatabaseHelper{
  static const int _version=1;
  static const String _dbName='Musics.db';
  static Future<Database> _getDb()async{
    return openDatabase(join(await getDatabasesPath(),_dbName),onCreate: (db,_version)async=>await db.execute(
      "CREATE TABLE Musics(id INTEGER PRIMARY KEY, title TEXT NOT NULL, type TEXT NOT NULL, isFavorite INTEGER NOT NULL);"
    ),version: _version);
  }
  static Future<int> addMusicToDb(Music music) async{
    final db=await _getDb();
    return db.insert('Musics', music.toJson());
  }
  static Future<List<Music>> getAllMusics()async{
    final db=await _getDb();
    final List<Map<String,dynamic>> maps=await db.query('Musics');
    if(maps.isEmpty){
      return [];
    }
    return List.generate(maps.length, (index) => Music.fromJson(maps[index]));
  }
}