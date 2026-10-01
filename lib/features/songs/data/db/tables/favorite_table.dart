import 'package:drift/drift.dart';

class FavoriteTable extends Table {
  IntColumn get id => integer()();

  @override
  String? get tableName => 'favorite';
  @override
  Set<Column<Object>>? get primaryKey => {id};
}
