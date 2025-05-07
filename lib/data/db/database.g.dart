// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CategoryTableTable extends CategoryTable
    with TableInfo<$CategoryTableTable, CategoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_table';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
    );
  }

  @override
  $CategoryTableTable createAlias(String alias) {
    return $CategoryTableTable(attachedDatabase, alias);
  }
}

class CategoryTableData extends DataClass
    implements Insertable<CategoryTableData> {
  final String id;
  final String title;
  final int type;
  const CategoryTableData(
      {required this.id, required this.title, required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['type'] = Variable<int>(type);
    return map;
  }

  CategoryTableCompanion toCompanion(bool nullToAbsent) {
    return CategoryTableCompanion(
      id: Value(id),
      title: Value(title),
      type: Value(type),
    );
  }

  factory CategoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<int>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<int>(type),
    };
  }

  CategoryTableData copyWith({String? id, String? title, int? type}) =>
      CategoryTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        type: type ?? this.type,
      );
  CategoryTableData copyWithCompanion(CategoryTableCompanion data) {
    return CategoryTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.type == this.type);
}

class CategoryTableCompanion extends UpdateCompanion<CategoryTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> type;
  final Value<int> rowid;
  const CategoryTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoryTableCompanion.insert({
    required String id,
    required String title,
    required int type,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        type = Value(type);
  static Insertable<CategoryTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? type,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoryTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<int>? type,
      Value<int>? rowid}) {
    return CategoryTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SongTableTable extends SongTable
    with TableInfo<$SongTableTable, SongTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SongTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _songTextMeta =
      const VerificationMeta('songText');
  @override
  late final GeneratedColumn<String> songText = GeneratedColumn<String>(
      'text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _audioFileNameMeta =
      const VerificationMeta('audioFileName');
  @override
  late final GeneratedColumn<String> audioFileName = GeneratedColumn<String>(
      'audio_file_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, category, title, songText, author, audioFileName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'song_table';
  @override
  VerificationContext validateIntegrity(Insertable<SongTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('text')) {
      context.handle(_songTextMeta,
          songText.isAcceptableOrUnknown(data['text']!, _songTextMeta));
    } else if (isInserting) {
      context.missing(_songTextMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    }
    if (data.containsKey('audio_file_name')) {
      context.handle(
          _audioFileNameMeta,
          audioFileName.isAcceptableOrUnknown(
              data['audio_file_name']!, _audioFileNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SongTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SongTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      songText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}text'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author']),
      audioFileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}audio_file_name']),
    );
  }

  @override
  $SongTableTable createAlias(String alias) {
    return $SongTableTable(attachedDatabase, alias);
  }
}

class SongTableData extends DataClass implements Insertable<SongTableData> {
  final int id;
  final String category;
  final String title;
  final String songText;
  final String? author;
  final String? audioFileName;
  const SongTableData(
      {required this.id,
      required this.category,
      required this.title,
      required this.songText,
      this.author,
      this.audioFileName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category'] = Variable<String>(category);
    map['title'] = Variable<String>(title);
    map['text'] = Variable<String>(songText);
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || audioFileName != null) {
      map['audio_file_name'] = Variable<String>(audioFileName);
    }
    return map;
  }

  SongTableCompanion toCompanion(bool nullToAbsent) {
    return SongTableCompanion(
      id: Value(id),
      category: Value(category),
      title: Value(title),
      songText: Value(songText),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      audioFileName: audioFileName == null && nullToAbsent
          ? const Value.absent()
          : Value(audioFileName),
    );
  }

  factory SongTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SongTableData(
      id: serializer.fromJson<int>(json['id']),
      category: serializer.fromJson<String>(json['category']),
      title: serializer.fromJson<String>(json['title']),
      songText: serializer.fromJson<String>(json['songText']),
      author: serializer.fromJson<String?>(json['author']),
      audioFileName: serializer.fromJson<String?>(json['audioFileName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'category': serializer.toJson<String>(category),
      'title': serializer.toJson<String>(title),
      'songText': serializer.toJson<String>(songText),
      'author': serializer.toJson<String?>(author),
      'audioFileName': serializer.toJson<String?>(audioFileName),
    };
  }

  SongTableData copyWith(
          {int? id,
          String? category,
          String? title,
          String? songText,
          Value<String?> author = const Value.absent(),
          Value<String?> audioFileName = const Value.absent()}) =>
      SongTableData(
        id: id ?? this.id,
        category: category ?? this.category,
        title: title ?? this.title,
        songText: songText ?? this.songText,
        author: author.present ? author.value : this.author,
        audioFileName:
            audioFileName.present ? audioFileName.value : this.audioFileName,
      );
  SongTableData copyWithCompanion(SongTableCompanion data) {
    return SongTableData(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
      title: data.title.present ? data.title.value : this.title,
      songText: data.songText.present ? data.songText.value : this.songText,
      author: data.author.present ? data.author.value : this.author,
      audioFileName: data.audioFileName.present
          ? data.audioFileName.value
          : this.audioFileName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SongTableData(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('title: $title, ')
          ..write('songText: $songText, ')
          ..write('author: $author, ')
          ..write('audioFileName: $audioFileName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, category, title, songText, author, audioFileName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SongTableData &&
          other.id == this.id &&
          other.category == this.category &&
          other.title == this.title &&
          other.songText == this.songText &&
          other.author == this.author &&
          other.audioFileName == this.audioFileName);
}

class SongTableCompanion extends UpdateCompanion<SongTableData> {
  final Value<int> id;
  final Value<String> category;
  final Value<String> title;
  final Value<String> songText;
  final Value<String?> author;
  final Value<String?> audioFileName;
  final Value<int> rowid;
  const SongTableCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.title = const Value.absent(),
    this.songText = const Value.absent(),
    this.author = const Value.absent(),
    this.audioFileName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SongTableCompanion.insert({
    required int id,
    required String category,
    required String title,
    required String songText,
    this.author = const Value.absent(),
    this.audioFileName = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        category = Value(category),
        title = Value(title),
        songText = Value(songText);
  static Insertable<SongTableData> custom({
    Expression<int>? id,
    Expression<String>? category,
    Expression<String>? title,
    Expression<String>? songText,
    Expression<String>? author,
    Expression<String>? audioFileName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (title != null) 'title': title,
      if (songText != null) 'text': songText,
      if (author != null) 'author': author,
      if (audioFileName != null) 'audio_file_name': audioFileName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SongTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? category,
      Value<String>? title,
      Value<String>? songText,
      Value<String?>? author,
      Value<String?>? audioFileName,
      Value<int>? rowid}) {
    return SongTableCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      title: title ?? this.title,
      songText: songText ?? this.songText,
      author: author ?? this.author,
      audioFileName: audioFileName ?? this.audioFileName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (songText.present) {
      map['text'] = Variable<String>(songText.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (audioFileName.present) {
      map['audio_file_name'] = Variable<String>(audioFileName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongTableCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('title: $title, ')
          ..write('songText: $songText, ')
          ..write('author: $author, ')
          ..write('audioFileName: $audioFileName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoryTableTable categoryTable = $CategoryTableTable(this);
  late final $SongTableTable songTable = $SongTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categoryTable, songTable];
}

typedef $$CategoryTableTableCreateCompanionBuilder = CategoryTableCompanion
    Function({
  required String id,
  required String title,
  required int type,
  Value<int> rowid,
});
typedef $$CategoryTableTableUpdateCompanionBuilder = CategoryTableCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<int> type,
  Value<int> rowid,
});

class $$CategoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));
}

class $$CategoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));
}

class $$CategoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);
}

class $$CategoryTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoryTableTable,
    CategoryTableData,
    $$CategoryTableTableFilterComposer,
    $$CategoryTableTableOrderingComposer,
    $$CategoryTableTableAnnotationComposer,
    $$CategoryTableTableCreateCompanionBuilder,
    $$CategoryTableTableUpdateCompanionBuilder,
    (
      CategoryTableData,
      BaseReferences<_$AppDatabase, $CategoryTableTable, CategoryTableData>
    ),
    CategoryTableData,
    PrefetchHooks Function()> {
  $$CategoryTableTableTableManager(_$AppDatabase db, $CategoryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> type = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoryTableCompanion(
            id: id,
            title: title,
            type: type,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required int type,
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoryTableCompanion.insert(
            id: id,
            title: title,
            type: type,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoryTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoryTableTable,
    CategoryTableData,
    $$CategoryTableTableFilterComposer,
    $$CategoryTableTableOrderingComposer,
    $$CategoryTableTableAnnotationComposer,
    $$CategoryTableTableCreateCompanionBuilder,
    $$CategoryTableTableUpdateCompanionBuilder,
    (
      CategoryTableData,
      BaseReferences<_$AppDatabase, $CategoryTableTable, CategoryTableData>
    ),
    CategoryTableData,
    PrefetchHooks Function()>;
typedef $$SongTableTableCreateCompanionBuilder = SongTableCompanion Function({
  required int id,
  required String category,
  required String title,
  required String songText,
  Value<String?> author,
  Value<String?> audioFileName,
  Value<int> rowid,
});
typedef $$SongTableTableUpdateCompanionBuilder = SongTableCompanion Function({
  Value<int> id,
  Value<String> category,
  Value<String> title,
  Value<String> songText,
  Value<String?> author,
  Value<String?> audioFileName,
  Value<int> rowid,
});

class $$SongTableTableFilterComposer
    extends Composer<_$AppDatabase, $SongTableTable> {
  $$SongTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get songText => $composableBuilder(
      column: $table.songText, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get author => $composableBuilder(
      column: $table.author, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get audioFileName => $composableBuilder(
      column: $table.audioFileName, builder: (column) => ColumnFilters(column));
}

class $$SongTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SongTableTable> {
  $$SongTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get songText => $composableBuilder(
      column: $table.songText, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get author => $composableBuilder(
      column: $table.author, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get audioFileName => $composableBuilder(
      column: $table.audioFileName,
      builder: (column) => ColumnOrderings(column));
}

class $$SongTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SongTableTable> {
  $$SongTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get songText =>
      $composableBuilder(column: $table.songText, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get audioFileName => $composableBuilder(
      column: $table.audioFileName, builder: (column) => column);
}

class $$SongTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SongTableTable,
    SongTableData,
    $$SongTableTableFilterComposer,
    $$SongTableTableOrderingComposer,
    $$SongTableTableAnnotationComposer,
    $$SongTableTableCreateCompanionBuilder,
    $$SongTableTableUpdateCompanionBuilder,
    (
      SongTableData,
      BaseReferences<_$AppDatabase, $SongTableTable, SongTableData>
    ),
    SongTableData,
    PrefetchHooks Function()> {
  $$SongTableTableTableManager(_$AppDatabase db, $SongTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SongTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SongTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SongTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> songText = const Value.absent(),
            Value<String?> author = const Value.absent(),
            Value<String?> audioFileName = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SongTableCompanion(
            id: id,
            category: category,
            title: title,
            songText: songText,
            author: author,
            audioFileName: audioFileName,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String category,
            required String title,
            required String songText,
            Value<String?> author = const Value.absent(),
            Value<String?> audioFileName = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SongTableCompanion.insert(
            id: id,
            category: category,
            title: title,
            songText: songText,
            author: author,
            audioFileName: audioFileName,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SongTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SongTableTable,
    SongTableData,
    $$SongTableTableFilterComposer,
    $$SongTableTableOrderingComposer,
    $$SongTableTableAnnotationComposer,
    $$SongTableTableCreateCompanionBuilder,
    $$SongTableTableUpdateCompanionBuilder,
    (
      SongTableData,
      BaseReferences<_$AppDatabase, $SongTableTable, SongTableData>
    ),
    SongTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoryTableTableTableManager get categoryTable =>
      $$CategoryTableTableTableManager(_db, _db.categoryTable);
  $$SongTableTableTableManager get songTable =>
      $$SongTableTableTableManager(_db, _db.songTable);
}
