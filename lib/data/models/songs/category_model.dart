import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pisni/data/models/songs/category_type.dart';
import 'package:pisni/data/models/songs/song_model.dart';

part 'category_model.g.dart';
part 'category_model.freezed.dart';

@freezed
@JsonSerializable()
class CategoryModel with _$CategoryModel {
  @override
  final String id;
  @override
  final String title;
  @override
  final List<SongModel> songs;
  @override
  final CategoryType? type;

  CategoryModel(
      {required this.id,
      required this.title,
      this.songs = const [],
      this.type});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
