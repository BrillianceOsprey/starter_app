import 'package:flutter_logs/flutter_logs.dart';
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
      methodCount: 2, // Number of method calls to be displayed
      errorMethodCount: 8, // Number of method calls if stacktrace is provided
      lineLength: 120, // Width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
      ),
);

/// Trace log.
///
/// Log a message at level [Level.trace].
final tLog = logger.t;

/// Debug log.
///
/// Log a message at level [Level.debug].
final dLog = logger.t;

/// Info log.
///
/// Log a message at level [Level.info].
final iLog = logger.t;

/// Warning log.
///
/// Log a message at level [Level.warning].
final wLog = logger.t;

/// Error log.
///
/// Log a message at level [Level.error].
final eLog = logger.t;

/// Fatal log.
///
/// Log a message at level [Level.fatal].
final fLog = logger.t;

const flogI = FlutterLogs.logInfo;
const flogW = FlutterLogs.logWarn;
const flogE = FlutterLogs.logError;
const flogEtrace = FlutterLogs.logErrorTrace;
const flogThis = FlutterLogs.logThis;
const flogToFile = FlutterLogs.logToFile;
