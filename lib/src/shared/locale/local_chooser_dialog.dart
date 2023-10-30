import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:starter_app/src/l10n/l10n.dart';

class LocaleChooserDialog extends StatelessWidget {
  const LocaleChooserDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('chooseLanguage').tr(),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          L10n.all.length,
          (index) {
            final locale = L10n.all[index];

            return ListTile(
              onTap: () {
                context.setLocale(locale);
                Navigator.of(context).pop();
              },
              trailing: locale == context.locale
                  ? Icon(
                      Icons.check_circle,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )
                  : null,
              title: Text('locale_${locale.languageCode}').tr(),
            );
          },
        ),
      ),
    );
  }
}
