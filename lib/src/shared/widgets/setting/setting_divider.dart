import 'package:flutter/material.dart';
import 'package:starter_app/src/shared/utils/flutter_extension.dart';

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({
    super.key,
    this.padding = 16,
  });

  final double padding;

  @override
  Widget build(BuildContext context) => const Divider().px(padding);
}
