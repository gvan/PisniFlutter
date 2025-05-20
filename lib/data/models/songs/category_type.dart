enum CategoryType {
  category(type: 0),
  author(type: 1);

  final int type;

  const CategoryType({required this.type});

  static CategoryType fromValue(int value) {
    return CategoryType.values.firstWhere((e) => e.type == value);
  }
}
