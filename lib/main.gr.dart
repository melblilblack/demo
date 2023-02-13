// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import 'models/contact.dart' as _i7;
import 'pages/contact_list.dart' as _i3;
import 'pages/dashboard_page.dart' as _i1;
import 'pages/edit_page.dart' as _i2;
import 'pages/setting.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardPage(),
      );
    },
    EditRoute.name: (routeData) {
      final args =
          routeData.argsAs<EditRouteArgs>(orElse: () => const EditRouteArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.EditPage(
          key: args.key,
          contact: args.contact,
          len: args.len,
        ),
      );
    },
    ContactListRoute.name: (routeData) {
      final args = routeData.argsAs<ContactListRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ContactListPage(
          args.size,
          key: args.key,
        ),
      );
    },
    SettingRoute.name: (routeData) {
      final args = routeData.argsAs<SettingRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.SettingPage(
          args.size,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          DashboardRoute.name,
          path: '/',
          children: [
            _i5.RouteConfig(
              ContactListRoute.name,
              path: 'Contacts',
              parent: DashboardRoute.name,
            ),
            _i5.RouteConfig(
              SettingRoute.name,
              path: 'Settings',
              parent: DashboardRoute.name,
            ),
          ],
        ),
        _i5.RouteConfig(
          EditRoute.name,
          path: '/edit-page',
        ),
      ];
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute({List<_i5.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i2.EditPage]
class EditRoute extends _i5.PageRouteInfo<EditRouteArgs> {
  EditRoute({
    _i6.Key? key,
    _i7.Contact? contact,
    dynamic len,
  }) : super(
          EditRoute.name,
          path: '/edit-page',
          args: EditRouteArgs(
            key: key,
            contact: contact,
            len: len,
          ),
        );

  static const String name = 'EditRoute';
}

class EditRouteArgs {
  const EditRouteArgs({
    this.key,
    this.contact,
    this.len,
  });

  final _i6.Key? key;

  final _i7.Contact? contact;

  final dynamic len;

  @override
  String toString() {
    return 'EditRouteArgs{key: $key, contact: $contact, len: $len}';
  }
}

/// generated route for
/// [_i3.ContactListPage]
class ContactListRoute extends _i5.PageRouteInfo<ContactListRouteArgs> {
  ContactListRoute({
    required double size,
    _i6.Key? key,
  }) : super(
          ContactListRoute.name,
          path: 'Contacts',
          args: ContactListRouteArgs(
            size: size,
            key: key,
          ),
        );

  static const String name = 'ContactListRoute';
}

class ContactListRouteArgs {
  const ContactListRouteArgs({
    required this.size,
    this.key,
  });

  final double size;

  final _i6.Key? key;

  @override
  String toString() {
    return 'ContactListRouteArgs{size: $size, key: $key}';
  }
}

/// generated route for
/// [_i4.SettingPage]
class SettingRoute extends _i5.PageRouteInfo<SettingRouteArgs> {
  SettingRoute({
    required double size,
    _i6.Key? key,
  }) : super(
          SettingRoute.name,
          path: 'Settings',
          args: SettingRouteArgs(
            size: size,
            key: key,
          ),
        );

  static const String name = 'SettingRoute';
}

class SettingRouteArgs {
  const SettingRouteArgs({
    required this.size,
    this.key,
  });

  final double size;

  final _i6.Key? key;

  @override
  String toString() {
    return 'SettingRouteArgs{size: $size, key: $key}';
  }
}
