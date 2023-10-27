import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/app/presentation/views/app_widget.dart';
import 'package:starter_app/src/l10n/l10n.dart';

/// Helper class to initialize services and configure the error handlers
class AppInitialization {
  /// Create the root widget that should be passed to [runApp].
  Widget createRootWidget({required ProviderContainer container}) {
    // * Register error handlers. For more info, see:
    // * https://docs.flutter.dev/testing/errors
    // final errorLogger = container.read(errorLoggerProvider);
    // registerErrorHandlers(errorLogger);

    return EasyLocalization(
      supportedLocales: L10n.all,
      path: L10n.translationPath,
      fallbackLocale: L10n.en,
      child: UncontrolledProviderScope(
        container: container,
        child: const AppWidget(),
      ),
    );
  }
}

// void registerErrorHandlers(ErrorLogger errorLogger) {
//   // * Show some error UI if any uncaught exception happens
//   FlutterError.onError = (FlutterErrorDetails details) {
//     FlutterError.presentError(details);
//     errorLogger.logError(details.exception, details.stack);
//   };

//   // * Handle errors from the underlying platform/OS
//   PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
//     errorLogger.logError(error, stack);
//     return true;
//   };

//   // * Show some error UI when any widget in the app fails to build
//   ErrorWidget.builder = (FlutterErrorDetails details) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.redAccent,
//         title: const Text('An error occurred'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//         child: Center(
//           child: Text(details.toString()),
//         ),
//       ),
//     );
//   };
// }
