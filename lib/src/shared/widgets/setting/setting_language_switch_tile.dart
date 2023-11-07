// ignore_for_file: inference_failure_on_function_invocation

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:starter_app/src/shared/locale/local_chooser_dialog.dart';

class SettingsLanguageSwitchTile extends StatelessWidget {
  const SettingsLanguageSwitchTile({
    super.key,
    this.onChanged,
  });

  final VoidCallback? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showAdaptiveDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => const LocaleChooserDialog(),
        );
        onChanged?.call();
      },
      leading: const Icon(Icons.language_outlined),
      title: const Text('language').tr(),
      trailing: Text(
        'locale_${context.locale}',
        style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 14),
      ).tr(),
    );
  }
}
