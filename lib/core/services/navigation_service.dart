import 'package:flutter/material.dart';

abstract class NavigationService {
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;
  void pop(returnValue);
  Future<dynamic> navigateTo(String routeName, {dynamic arguments});
  Future<dynamic> pushNamed(String routeName, {Object arguments});
  Future<dynamic> pushReplacementNamed(String routeName, {Object arguments});
  Future<dynamic> popAllAndPushNamed(
    String routeName, {
    Object arguments,
  });
  void popUntil(bool Function(Route<dynamic>) predicate);
}

class NavigationServiceImpl implements NavigationService {
  @override
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  @override
  void pop(returnValue) {
    return _navigationKey.currentState!.pop(returnValue);
  }
  // bool pop({returnValue}) {
  //   return navigatorKey.currentState.pop(returnValue);
  // }

  @override
  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    print('NavigationService navigateTo $routeName');
    return _navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return navigationKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> popAllAndPushNamed(String routeName, {Object? arguments}) {
    return navigationKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (_) => false,
      arguments: arguments,
    );
  }

  @override
  void popUntil(bool Function(Route<dynamic>) predicate) {
    navigationKey.currentState!.popUntil(predicate);
  }
}
