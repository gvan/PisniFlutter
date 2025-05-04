// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get authors => 'Authors';

  @override
  String get search => 'Search';

  @override
  String get favorite => 'Favorite';

  @override
  String get songs => 'Songs';

  @override
  String get songTitleOrLyrics => 'Song title or lyrics';
}
