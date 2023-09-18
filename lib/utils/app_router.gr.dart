// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CounterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CounterScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    ReorderableCustomGridViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReorderableCustomGridViewScreen(),
      );
    },
    ReorderableViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReorderableViewScreen(),
      );
    },
  };
}

/// generated route for
/// [CounterScreen]
class CounterRoute extends PageRouteInfo<void> {
  const CounterRoute({List<PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReorderableCustomGridViewScreen]
class ReorderableCustomGridViewRoute extends PageRouteInfo<void> {
  const ReorderableCustomGridViewRoute({List<PageRouteInfo>? children})
      : super(
          ReorderableCustomGridViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReorderableCustomGridViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReorderableViewScreen]
class ReorderableViewRoute extends PageRouteInfo<void> {
  const ReorderableViewRoute({List<PageRouteInfo>? children})
      : super(
          ReorderableViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReorderableViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
