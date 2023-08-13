import 'package:logger/logger.dart' as logger_package;

import 'logger.dart';

class LoggerImpl implements Logger {
  static const _level = logger_package.Level.info;
  final _loggerPackage = logger_package.Logger(level: _level);

  @override
  void v(message, {bool upload = false}) {
    _loggerPackage.v(message);
  }

  @override
  void d(message, {bool upload = false}) {
    _loggerPackage.d(message);
  }

  @override
  void i(message, {bool upload = false}) {
    _loggerPackage.i(message);
  }

  @override
  void w(message, {bool upload = false}) {
    _loggerPackage.w(message);
  }

  @override
  void e(message, {bool upload = false}) {
    _loggerPackage.e(message);
  }
}
