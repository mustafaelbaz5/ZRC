import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  /// Push a new route by widget
  void push(final Widget page) {
    Navigator.push(this, MaterialPageRoute(builder: (_) => page));
  }

  /// Replace current screen with a new one
  void pushReplacement(final Widget page) {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (_) => page));
  }

  /// Push and remove all previous routes
  void pushAndRemoveUntil(final Widget page) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (_) => page),
      (final Route<dynamic> route) => false,
    );
  }

  /// Pop current route
  void pop<T extends Object?>([final T? result]) {
    Navigator.pop(this, result);
  }

  /// Push a named route
  void pushNamed(final String routeName, {final Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  /// Push replacement with a named route
  void pushReplacementNamed(final String routeName, {final Object? arguments}) {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  /// Push named and remove all
  void pushNamedAndRemoveUntil(
    final String routeName, {
    final Object? arguments,
  }) {
    Navigator.pushNamedAndRemoveUntil(
      this,
      routeName,
      (final Route<dynamic> route) => false,
      arguments: arguments,
    );
  }
}
