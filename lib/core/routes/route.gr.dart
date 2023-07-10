// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:test_flutter/featuers/auth/presentation/log_in_page.dart'
    as _i1;
import 'package:test_flutter/featuers/home/presentation/home_page.dart' as _i2;
import 'package:test_flutter/featuers/house/presentation/pages/add_house_page.dart'
    as _i3;
import 'package:test_flutter/featuers/house/presentation/pages/houses_page.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LogInPageRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LogInPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    AddHousePageRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AddHousePage(),
      );
    },
    HousesPageRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HousesPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LogInPage]
class LogInPageRoute extends _i5.PageRouteInfo<void> {
  const LogInPageRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LogInPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogInPageRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddHousePage]
class AddHousePageRoute extends _i5.PageRouteInfo<void> {
  const AddHousePageRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AddHousePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddHousePageRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HousesPage]
class HousesPageRoute extends _i5.PageRouteInfo<void> {
  const HousesPageRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HousesPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HousesPageRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
