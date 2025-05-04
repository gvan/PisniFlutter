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
}
