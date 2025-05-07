// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get home => 'Дім';

  @override
  String get authors => 'Авторські';

  @override
  String get search => 'Пошук';

  @override
  String get favorite => 'Улюблені';

  @override
  String get songs => 'Пісні';

  @override
  String get songTitleOrLyrics => 'Назва або слова пісні';

  @override
  String get other => 'Інше';

  @override
  String get settings => 'Налаштування';

  @override
  String get theme => 'Тема';

  @override
  String themeMode(String mode) {
    String _temp0 = intl.Intl.selectLogic(
      mode,
      {
        'light': 'Світла',
        'dark': 'Темна',
        'system': 'Системна',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get author => 'Автор';

  @override
  String get source => 'Джерело';
}
