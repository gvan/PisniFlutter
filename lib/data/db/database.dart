import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pisni/data/db/tables/category_table.dart';
import 'package:pisni/data/db/tables/song_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [CategoryTable, SongTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
        name: 'database',
        native: const DriftNativeOptions(
            databaseDirectory: getApplicationSupportDirectory));
  }
}
