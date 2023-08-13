abstract class Logger {
  void v(dynamic message, {bool upload = false});
  void d(dynamic message, {bool upload = false});
  void i(dynamic message, {bool upload = false});
  void w(dynamic message, {bool upload = false});
  void e(dynamic message, {bool upload = false});
}
