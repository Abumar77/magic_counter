import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:magic_counter/presentation/pages/home_screen.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import '../presentation/pages/reorderable_grid_view/reorderable_grid_view.dart';
import '../presentation/pages/reorderable_list_view/reorderabe_list_view.dart';
import '../presentation/pages/weather_counter_screen/counter_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: CounterRoute.page),
        AutoRoute(page: ReorderableViewRoute.page),
        AutoRoute(page: ReorderableCustomGridViewRoute.page),
      ];
}
