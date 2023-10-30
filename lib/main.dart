import 'package:flutter/material.dart';
import 'package:starter_app/src/initialization/app_initialization.dart';
import 'package:starter_app/src/initialization/app_initialization_hive.dart';
import 'package:starter_app/src/initialization/app_initialization_localization.dart';
import 'package:starter_app/src/initialization/initialization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // create an app initialization instance
  final initialization = AppInitialization();

  // easy localizations
  await initialization.setupEasyLocalization();
  // init Hive flutter
  await initialization.setupHive();
  // create a container configured with all the required repositories
  final container = await initialization.createMainProviderContainer(
    overrides: [],
  );
  final root = initialization.createRootWidget(container: container);

  // start the app
  runApp(root);
}
