import 'package:finalproject/domain/user/number/number.dart';
import 'package:finalproject/infrastructure/services/api_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NumberService {
  final ApiService apiService;

  NumberService(this.apiService);

  Future<List<Number>> getNumbers() async {
    try {
      final List<dynamic> numberData = await apiService.fetchNumbers();
      final List<Number> numbers =
          numberData.map((json) => Number.fromJson(json)).toList();
      return numbers;
    } catch (error) {
      throw Exception('Failed to retrieve numbers: $error');
    }
  }

  Future<void> addToChecked(Number number) async {
    try {
      final database = await openDatabase(
        join(await getDatabasesPath(), 'numbers.db'),
        version: 1,
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE IF NOT EXISTS checked_numbers(id INTEGER PRIMARY KEY AUTOINCREMENT, number TEXT)',
          );
        },
      );

      await database.insert(
        'checked_numbers',
        {'number': number.number},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (error) {
      throw Exception('Failed to add item to checked: $error');
    }
  }
}
