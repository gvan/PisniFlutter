import 'package:drift/drift.dart';

class SongTable extends Table {
  IntColumn get id => integer()();
  TextColumn get category => text().withLength(min: 2, max: 64)();
  TextColumn get title => text()();
  TextColumn get titleLower => text()();
  TextColumn get songText => text().named('text')();
  TextColumn get songTextLower => text().named('text_lower')();
  TextColumn get author => text().nullable()();
  TextColumn get audioFileName => text().nullable()();
}
