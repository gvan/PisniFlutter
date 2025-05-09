// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class Category extends Table with TableInfo<Category, CategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Category(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
    );
  }

  @override
  Category createAlias(String alias) {
    return Category(attachedDatabase, alias);
  }
}

class CategoryData extends DataClass implements Insertable<CategoryData> {
  final String id;
  final String title;
  final int type;
  const CategoryData(
      {required this.id, required this.title, required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['type'] = Variable<int>(type);
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(
      id: Value(id),
      title: Value(title),
      type: Value(type),
    );
  }

  factory CategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryData(
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

  CategoryData copyWith({String? id, String? title, int? type}) => CategoryData(
        id: id ?? this.id,
        title: title ?? this.title,
        type: type ?? this.type,
      );
  CategoryData copyWithCompanion(CategoryCompanion data) {
    return CategoryData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryData(')
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
      (other is CategoryData &&
          other.id == this.id &&
          other.title == this.title &&
          other.type == this.type);
}

class CategoryCompanion extends UpdateCompanion<CategoryData> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> type;
  final Value<int> rowid;
  const CategoryCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoryCompanion.insert({
    required String id,
    required String title,
    required int type,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        type = Value(type);
  static Insertable<CategoryData> custom({
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

  CategoryCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<int>? type,
      Value<int>? rowid}) {
    return CategoryCompanion(
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
    return (StringBuffer('CategoryCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Song extends Table with TableInfo<Song, SongData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Song(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES category (id)'));
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> titleLower = GeneratedColumn<String>(
      'title_lower', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> songText = GeneratedColumn<String>(
      'text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> songTextLower = GeneratedColumn<String>(
      'text_lower', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> audioFileName = GeneratedColumn<String>(
      'audio_file_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        category,
        title,
        titleLower,
        songText,
        songTextLower,
        author,
        audioFileName
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'song';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SongData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SongData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      titleLower: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title_lower'])!,
      songText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}text'])!,
      songTextLower: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}text_lower'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author']),
      audioFileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}audio_file_name']),
    );
  }

  @override
  Song createAlias(String alias) {
    return Song(attachedDatabase, alias);
  }
}

class SongData extends DataClass implements Insertable<SongData> {
  final int id;
  final String category;
  final String title;
  final String titleLower;
  final String songText;
  final String songTextLower;
  final String? author;
  final String? audioFileName;
  const SongData(
      {required this.id,
      required this.category,
      required this.title,
      required this.titleLower,
      required this.songText,
      required this.songTextLower,
      this.author,
      this.audioFileName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category'] = Variable<String>(category);
    map['title'] = Variable<String>(title);
    map['title_lower'] = Variable<String>(titleLower);
    map['text'] = Variable<String>(songText);
    map['text_lower'] = Variable<String>(songTextLower);
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || audioFileName != null) {
      map['audio_file_name'] = Variable<String>(audioFileName);
    }
    return map;
  }

  SongCompanion toCompanion(bool nullToAbsent) {
    return SongCompanion(
      id: Value(id),
      category: Value(category),
      title: Value(title),
      titleLower: Value(titleLower),
      songText: Value(songText),
      songTextLower: Value(songTextLower),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      audioFileName: audioFileName == null && nullToAbsent
          ? const Value.absent()
          : Value(audioFileName),
    );
  }

  factory SongData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SongData(
      id: serializer.fromJson<int>(json['id']),
      category: serializer.fromJson<String>(json['category']),
      title: serializer.fromJson<String>(json['title']),
      titleLower: serializer.fromJson<String>(json['titleLower']),
      songText: serializer.fromJson<String>(json['songText']),
      songTextLower: serializer.fromJson<String>(json['songTextLower']),
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
      'titleLower': serializer.toJson<String>(titleLower),
      'songText': serializer.toJson<String>(songText),
      'songTextLower': serializer.toJson<String>(songTextLower),
      'author': serializer.toJson<String?>(author),
      'audioFileName': serializer.toJson<String?>(audioFileName),
    };
  }

  SongData copyWith(
          {int? id,
          String? category,
          String? title,
          String? titleLower,
          String? songText,
          String? songTextLower,
          Value<String?> author = const Value.absent(),
          Value<String?> audioFileName = const Value.absent()}) =>
      SongData(
        id: id ?? this.id,
        category: category ?? this.category,
        title: title ?? this.title,
        titleLower: titleLower ?? this.titleLower,
        songText: songText ?? this.songText,
        songTextLower: songTextLower ?? this.songTextLower,
        author: author.present ? author.value : this.author,
        audioFileName:
            audioFileName.present ? audioFileName.value : this.audioFileName,
      );
  SongData copyWithCompanion(SongCompanion data) {
    return SongData(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
      title: data.title.present ? data.title.value : this.title,
      titleLower:
          data.titleLower.present ? data.titleLower.value : this.titleLower,
      songText: data.songText.present ? data.songText.value : this.songText,
      songTextLower: data.songTextLower.present
          ? data.songTextLower.value
          : this.songTextLower,
      author: data.author.present ? data.author.value : this.author,
      audioFileName: data.audioFileName.present
          ? data.audioFileName.value
          : this.audioFileName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SongData(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('title: $title, ')
          ..write('titleLower: $titleLower, ')
          ..write('songText: $songText, ')
          ..write('songTextLower: $songTextLower, ')
          ..write('author: $author, ')
          ..write('audioFileName: $audioFileName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, category, title, titleLower, songText,
      songTextLower, author, audioFileName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SongData &&
          other.id == this.id &&
          other.category == this.category &&
          other.title == this.title &&
          other.titleLower == this.titleLower &&
          other.songText == this.songText &&
          other.songTextLower == this.songTextLower &&
          other.author == this.author &&
          other.audioFileName == this.audioFileName);
}

class SongCompanion extends UpdateCompanion<SongData> {
  final Value<int> id;
  final Value<String> category;
  final Value<String> title;
  final Value<String> titleLower;
  final Value<String> songText;
  final Value<String> songTextLower;
  final Value<String?> author;
  final Value<String?> audioFileName;
  const SongCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.title = const Value.absent(),
    this.titleLower = const Value.absent(),
    this.songText = const Value.absent(),
    this.songTextLower = const Value.absent(),
    this.author = const Value.absent(),
    this.audioFileName = const Value.absent(),
  });
  SongCompanion.insert({
    this.id = const Value.absent(),
    required String category,
    required String title,
    required String titleLower,
    required String songText,
    required String songTextLower,
    this.author = const Value.absent(),
    this.audioFileName = const Value.absent(),
  })  : category = Value(category),
        title = Value(title),
        titleLower = Value(titleLower),
        songText = Value(songText),
        songTextLower = Value(songTextLower);
  static Insertable<SongData> custom({
    Expression<int>? id,
    Expression<String>? category,
    Expression<String>? title,
    Expression<String>? titleLower,
    Expression<String>? songText,
    Expression<String>? songTextLower,
    Expression<String>? author,
    Expression<String>? audioFileName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (title != null) 'title': title,
      if (titleLower != null) 'title_lower': titleLower,
      if (songText != null) 'text': songText,
      if (songTextLower != null) 'text_lower': songTextLower,
      if (author != null) 'author': author,
      if (audioFileName != null) 'audio_file_name': audioFileName,
    });
  }

  SongCompanion copyWith(
      {Value<int>? id,
      Value<String>? category,
      Value<String>? title,
      Value<String>? titleLower,
      Value<String>? songText,
      Value<String>? songTextLower,
      Value<String?>? author,
      Value<String?>? audioFileName}) {
    return SongCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      title: title ?? this.title,
      titleLower: titleLower ?? this.titleLower,
      songText: songText ?? this.songText,
      songTextLower: songTextLower ?? this.songTextLower,
      author: author ?? this.author,
      audioFileName: audioFileName ?? this.audioFileName,
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
    if (titleLower.present) {
      map['title_lower'] = Variable<String>(titleLower.value);
    }
    if (songText.present) {
      map['text'] = Variable<String>(songText.value);
    }
    if (songTextLower.present) {
      map['text_lower'] = Variable<String>(songTextLower.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (audioFileName.present) {
      map['audio_file_name'] = Variable<String>(audioFileName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('title: $title, ')
          ..write('titleLower: $titleLower, ')
          ..write('songText: $songText, ')
          ..write('songTextLower: $songTextLower, ')
          ..write('author: $author, ')
          ..write('audioFileName: $audioFileName')
          ..write(')'))
        .toString();
  }
}

class Favorite extends Table with TableInfo<Favorite, FavoriteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Favorite(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  Favorite createAlias(String alias) {
    return Favorite(attachedDatabase, alias);
  }
}

class FavoriteData extends DataClass implements Insertable<FavoriteData> {
  final int id;
  const FavoriteData({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  FavoriteCompanion toCompanion(bool nullToAbsent) {
    return FavoriteCompanion(
      id: Value(id),
    );
  }

  factory FavoriteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteData(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  FavoriteData copyWith({int? id}) => FavoriteData(
        id: id ?? this.id,
      );
  FavoriteData copyWithCompanion(FavoriteCompanion data) {
    return FavoriteData(
      id: data.id.present ? data.id.value : this.id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteData(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is FavoriteData && other.id == this.id);
}

class FavoriteCompanion extends UpdateCompanion<FavoriteData> {
  final Value<int> id;
  const FavoriteCompanion({
    this.id = const Value.absent(),
  });
  FavoriteCompanion.insert({
    this.id = const Value.absent(),
  });
  static Insertable<FavoriteData> custom({
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  FavoriteCompanion copyWith({Value<int>? id}) {
    return FavoriteCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final Category category = Category(this);
  late final Song song = Song(this);
  late final Favorite favorite = Favorite(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [category, song, favorite];
  @override
  int get schemaVersion => 2;
}
