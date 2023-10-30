import 'package:dynamic_color/dynamic_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/app/presentation/views/skeleton_page.dart';
import 'package:starter_app/src/shared/theme/app_theme.dart';

class AppWidget extends HookConsumerWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeModeProvider);

    final useDynamicColorState = ref.watch(useDynamicColorProvider);

    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        final (lightColorScheme, darkColorScheme) =
            AppTheme.getColorSchemes(lightDynamic, darkDynamic);
        return MaterialApp(
          title: 'Ecommerce',
          debugShowCheckedModeBanner: false,

          theme: useDynamicColorState.useDynamicColor
              ? ThemeData(
                  colorScheme: lightColorScheme,
                  useMaterial3: true,
                  extensions: [lightCustomColors],
                )
              : AppTheme.light,
          darkTheme: useDynamicColorState.useDynamicColor
              ? ThemeData(
                  colorScheme: darkColorScheme,
                  useMaterial3: true,
                  extensions: [darkCustomColors],
                )
              : AppTheme.dark,
          themeMode: currentTheme.themeMode,

          // Localization stuff
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: const SkeletonPage(),
          // routes
        );
      },
    );
  }
}
