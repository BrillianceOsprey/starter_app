import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/shared/constants/app_size.dart';
import 'package:starter_app/src/shared/widgets/setting/setting_divider.dart';
import 'package:starter_app/src/shared/widgets/setting/setting_dynamic_color_tile.dart';
import 'package:starter_app/src/shared/widgets/setting/setting_language_switch_tile.dart';
import 'package:starter_app/src/shared/widgets/setting/setting_section_title.dart';
import 'package:starter_app/src/shared/widgets/setting/theme_mode_switch_title.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Setting'),
        centerTitle: false,
      ),
      body: ListView(
        children: const [
          gapH8,
          SettingsSectionTitle(label: 'Localization'),
          SettingsDivider(),
          SettingsLanguageSwitchTile(),
          SettingsDivider(),
          ThemeModeSwitchTile(),
          SettingsDivider(),
          SettingsDynamicColorTile(),
        ],
      ),
    );
  }
}
