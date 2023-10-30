import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:starter_app/src/l10n/string_hardcoded.dart';
import 'package:starter_app/src/shared/theme/app_theme.dart';

class ThemeModeSwitchTile extends HookConsumerWidget {
  const ThemeModeSwitchTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeModeProvider);

    return SwitchListTile.adaptive(
      secondary: const Icon(Icons.dark_mode_outlined),
      activeColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text('Dark Mode'.hardcoded),
      value: themeState.themeMode == ThemeMode.dark,
      onChanged: (value) => ref
          .watch(themeModeProvider.notifier)
          .setThemeMode(!value ? ThemeMode.light : ThemeMode.dark),
    );
  }
}
