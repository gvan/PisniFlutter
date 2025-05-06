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

  @override
  String get other => 'Other';

  @override
  String get settings => 'Settings';

  @override
  String get theme => 'Theme';

  @override
  String themeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'Light',
        'dark': 'Dark',
        'system': 'System',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get author => 'Author';
}
