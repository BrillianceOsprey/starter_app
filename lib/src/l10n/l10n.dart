import 'package:flutter/widgets.dart';
export 'locale_keys.g.dart';

class L10n {
  static String translationPath = 'assets/translations';

  static List<Locale> all = [en, my];

  // english
  static Locale en = const Locale('en');

  // myanmar
  static Locale my = const Locale('my');
}
