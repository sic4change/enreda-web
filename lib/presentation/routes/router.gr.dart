// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pages/access/access_page.dart' as _i2;
import '../pages/home/home_page.dart' as _i1;
import '../pages/resources/resources_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.HomePage());
    },
    AccessRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.AccessPage());
    },
    ResourcesRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.ResourcesPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(HomeRoute.name, path: '/'),
        _i4.RouteConfig(AccessRoute.name, path: '/access-page'),
        _i4.RouteConfig(ResourcesRoute.name, path: '/resources-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.AccessPage]
class AccessRoute extends _i4.PageRouteInfo<void> {
  const AccessRoute() : super(AccessRoute.name, path: '/access-page');

  static const String name = 'AccessRoute';
}

/// generated route for
/// [_i3.ResourcesPage]
class ResourcesRoute extends _i4.PageRouteInfo<void> {
  const ResourcesRoute() : super(ResourcesRoute.name, path: '/resources-page');

  static const String name = 'ResourcesRoute';
}
