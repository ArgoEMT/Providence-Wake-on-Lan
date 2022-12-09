import 'package:flutter/material.dart';

import '../../ui/home_screen/home_screen.dart';
import '../../ui/new_connection_screen/new_connection_screen.dart';
import '../../ui/splash/splash_screen.dart';
import '../model/connection.dart';

/// Simple routing class to handle the navigation
class AppRouter {
  static MaterialPageRoute _routeBuilder({
    required Widget target,
    RouteSettings? settings,
    bool maintainState = true,
  }) {
    return CustomPageRoute(
      builder: (context) {
        return target;
      },
      settings: settings,
      maintainState: maintainState,
    );
  }

  /// Navigate to the given route when using the [Navigator]
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.newConnection:
        return _routeBuilder(
          target: NewConnectionScreen(
            initialConnection: settings.arguments as Connection?,
          ),
          settings: settings,
        );

      case RoutePaths.splash:
        return _routeBuilder(
          target: const SplashScreen(),
          settings: settings,
        );

      case RoutePaths.home:
        return _routeBuilder(
          target: const HomeScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('Pas de route définie pour ${settings.name}'),
            ),
          ),
        );
    }
  }
}

/// Custom route to disable the transition animation
class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({
    required Widget Function(BuildContext) builder,
    RouteSettings? settings,
    bool maintainState = true,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
        );

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}

/// Class that contains all the routes of the app
class RoutePaths {
  static const String home = '/';
  static const String newConnection = '/new-connection';
  static const String splash = '/splash';
}

/// Extension to simplify the navigation
extension ContextExtension on BuildContext {
  /// Navigate to the given route
  ///
  /// ```dart
  /// // Usage:
  /// context.go(route)
  /// ```
  Future<T?> go<T extends Object?>(
    String path, {
    Object? arguments,
  }) {
    return Navigator.pushNamed(this, path, arguments: arguments);
  }

  /// Pop the current route.
  ///
  /// ```dart
  /// // Usage :
  /// context.pop()
  /// ```
  void pop<T extends Object?>([T? result]) {
    return Navigator.pop(this, result);
  }
}
