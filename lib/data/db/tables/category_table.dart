import 'package:drift/drift.dart';

class CategoryTable extends Table {
  TextColumn get id => text().withLength(min: 2, max: 64)();
  TextColumn get title => text().withLength(min: 2, max: 64)();
  IntColumn get type => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
