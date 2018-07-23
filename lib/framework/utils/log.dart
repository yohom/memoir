import 'package:flutter/material.dart';

///
/// If you're in release mode, const bool.fromEnvironment("dart.vm.product") will be true.
/// If you're in debug mode, assert(() { ...; return true; }); will execute ....
/// If you're in profile mode, neither of the above will happen.
///
class L {
  ///
  /// debug模式打印
  ///
  static void d(String content) async {
    assert(() {
      debugPrint(content);
      return true;
    }());
  }

  ///
  /// release模式打印
  ///
  static void w(String content) async {
    debugPrint(content);
  }

  ///
  /// profile模式打印
  ///
  static void i(String content) async {
    if (!bool.fromEnvironment('dart.vm.product')) {
      debugPrint(content);
    }
  }
}
