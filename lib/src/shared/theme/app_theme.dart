// ignore_for_file: unnecessary_breaks, inference_failure_on_function_invocation, lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:starter_app/src/shared/constants/keys.dart';
import 'package:starter_app/src/shared/constants/palette.dart';
import 'package:starter_app/src/shared/providers/shared_providers.dart';
import 'package:starter_app/src/shared/theme/custom_colors.dart';

part 'app_theme.g.dart';

CustomColors lightCustomColors = const CustomColors(danger: Color(0xFFE53935));
CustomColors darkCustomColors = const CustomColors(danger: Color(0xFFEF9A9A));

class AppTheme {
  static (ColorScheme, ColorScheme) getColorSchemes(
    ColorScheme? lightDynamic,
    ColorScheme? darkDynamic,
  ) {
    ColorScheme lightColorScheme;
    ColorScheme darkColorScheme;

    if (lightDynamic != null && darkDynamic != null) {
      // On Android S+ devices, use the provided dynamic color scheme.
      // (Recommended) Harmonize the dynamic color scheme' built-in semantic colors.
      lightColorScheme = lightDynamic.harmonized();
      // (Optional) Customize the scheme as desired. For example, one might
      // want to use a brand color to override the dynamic [ColorScheme.secondary].
      lightColorScheme = lightColorScheme.copyWith(
        secondary: Palette.primary,
      );
      // (Optional) If applicable, harmonize custom colors.
      lightCustomColors = lightCustomColors.harmonized(lightColorScheme);

      // Repeat for the dark color scheme.
      darkColorScheme = darkDynamic.harmonized();
      darkColorScheme = darkColorScheme.copyWith(
        secondary: Palette.primary,
      );
      darkCustomColors = darkCustomColors.harmonized(darkColorScheme);
    } else {
      // Otherwise, use fallback schemes.
      lightColorScheme = ColorScheme.fromSeed(
        seedColor: Palette.primary,
      );
      darkColorScheme = ColorScheme.fromSeed(
        seedColor: Palette.primary,
        brightness: Brightness.dark,
      );
    }
    return (lightColorScheme, darkColorScheme);
  }

  /// Light [ThemeData]
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Palette.primary),
      useMaterial3: true,
    ).copyWith(
      // Remove shadow from nested routers
      // https://pub.dev/packages/auto_route#remove-shadow-from-nested-routers
      // https://stackoverflow.com/questions/53457772/why-there-is-a-shadow-between-nested-navigator
      // https://stackoverflow.com/questions/68986632/rid-of-elevation-of-nested-flutter-navigator-2-0
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }

  /// Dark [ThemeData]
  static ThemeData get dark {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Palette.primary,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    ).copyWith(
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}

@riverpod
ThemeData lighTheme(LighThemeRef ref) {
  return AppTheme.light;
}

@riverpod
ThemeData darkTheme(DarkThemeRef ref) {
  return AppTheme.dark;
}

@riverpod
class AppThemeMode extends _$AppThemeMode {
  Future<ThemeMode> _getThemeMode() async {
    final prefs = ref.watch(sharedPrefsProvider);
    final themeMode = prefs.getString(Keys.keyThemeMode) ?? '';

    if (themeMode == ThemeMode.light.name) {
      return ThemeMode.light;
    } else if (themeMode == ThemeMode.dark.name) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  @override
  FutureOr<ThemeMode> build() {
    return _getThemeMode();
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    state = await AsyncValue.guard(() async {
      final prefs = ref.watch(sharedPrefsProvider);
      await prefs.setString(Keys.keyThemeMode, themeMode.name);

      return Future.value(themeMode);
    });
  }
}

final themeModeProvider =
    ChangeNotifierProvider.autoDispose<ThemeModeState>((ref) {
  return ThemeModeState();
});

class ThemeModeState extends ChangeNotifier {
  ThemeModeState() {
    final mode = Hive.box(Keys.keyPrefs).get(
      Keys.keyThemeMode,
      defaultValue: ThemeMode.system.toString(),
    ) as String;
    switch (mode) {
      case 'ThemeMode.dark':
        themeMode = ThemeMode.dark;
        break;
      case 'ThemeMode.light':
        themeMode = ThemeMode.light;
        break;
      case 'ThemeMode.system':
        themeMode = ThemeMode.system;
        break;
    }
  }

  ThemeMode? themeMode;

  Future<void> setThemeMode(ThemeMode mode) async {
    themeMode = mode;
    await Hive.box(Keys.keyPrefs).put(Keys.keyThemeMode, themeMode.toString());
    notifyListeners();
  }
}

final useDynamicColorProvider =
    ChangeNotifierProvider.autoDispose<DynamicColorUsedState>((ref) {
  return DynamicColorUsedState();
});

class DynamicColorUsedState extends ChangeNotifier {
  DynamicColorUsedState() {
    final useDynamicColorCached = Hive.box(Keys.keyPrefs).get(
      Keys.keyUseDynamicColor,
      defaultValue: true,
    ) as bool;
    useDynamicColor = useDynamicColorCached;
  }

  bool useDynamicColor = true;

  // ignore: avoid_positional_boolean_parameters
  Future<void> setUseDynamicColor([bool value = true]) async {
    useDynamicColor = value;
    await Hive.box(Keys.keyPrefs).put(Keys.keyUseDynamicColor, value);
    notifyListeners();
  }
}
