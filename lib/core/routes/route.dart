import 'package:test_flutter/core/general_export.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    CustomRoute(
        path: "/",
        page: HomeRoute.page,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        path: "/",
        page: HousesPageRoute.page,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        path: "/",
        page: AddHousePageRoute.page,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        path: "/",
        page: LogInPageRoute.page,
        transitionsBuilder: TransitionsBuilders.fadeIn),
  ];
}
