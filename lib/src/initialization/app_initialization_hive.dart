// ignore_for_file: inference_failure_on_function_invocation

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:starter_app/src/initialization/app_initialization.dart';
import 'package:starter_app/src/shared/constants/keys.dart';

extension AppInitializationHive on AppInitialization {
  /// Setup Hive flutter
  Future<void> setupHive() async {
    final tmpDir = await getTemporaryDirectory();
    await Hive.initFlutter(tmpDir.toString());

    /// Open `prefs` box
    await Hive.openBox(Keys.keyPrefs);
  }
}
