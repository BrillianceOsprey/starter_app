import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/l10n/string_hardcoded.dart';
import 'package:starter_app/src/shared/theme/app_theme.dart';

class SettingsDynamicColorTile extends HookConsumerWidget {
  const SettingsDynamicColorTile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dynamicColorState = ref.watch(useDynamicColorProvider);

    return SwitchListTile.adaptive(
      secondary: const Icon(Icons.color_lens_outlined),
      title: Text('Use Dynamic Color'.hardcoded),
      subtitle: Text(
        'Material3 dynamic colors on/off'.hardcoded,
      ),
      activeColor: Theme.of(context).colorScheme.inversePrimary,
      value: dynamicColorState.useDynamicColor,
      onChanged: (value) =>
          ref.watch(useDynamicColorProvider.notifier).setUseDynamicColor(value),
    );
  }
}
