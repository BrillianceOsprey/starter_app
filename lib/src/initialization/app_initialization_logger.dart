// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter_logs/flutter_logs.dart';
import 'package:starter_app/src/initialization/app_initialization.dart';

extension AppInitializationLogger on AppInitialization {
  Future<void> setupFlutterLogs() async {
    await FlutterLogs.initLogs(
      logLevelsEnabled: [
        LogLevel.INFO,
        LogLevel.WARNING,
        LogLevel.ERROR,
        LogLevel.SEVERE,
      ],
      directoryStructure: DirectoryStructure.FOR_DATE,
      timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
      logFileExtension: LogFileExtension.TXT,
      logsExportDirectoryName: 'Exported',
      logsWriteDirectoryName: 'MyLogs',
      debugFileOperations: true,
      isDebuggable: true,
    );
  }

  // void listenLogsContent(ProviderContainer container) {
  //   container.read(sysLogsServiceProvider);
  // }
}
