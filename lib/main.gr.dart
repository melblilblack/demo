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
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import 'models/contact.dart' as _i5;
import 'pages/contact_list.dart' as _i1;
import 'pages/edit_page.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    ContactListRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ContactListPage(),
      );
    },
    EditRoute.name: (routeData) {
      final args =
          routeData.argsAs<EditRouteArgs>(orElse: () => const EditRouteArgs());
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.EditPage(
          key: args.key,
          contact: args.contact,
          len: args.len,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          ContactListRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          EditRoute.name,
          path: '/edit-page',
        ),
      ];
}

/// generated route for
/// [_i1.ContactListPage]
class ContactListRoute extends _i3.PageRouteInfo<void> {
  const ContactListRoute()
      : super(
          ContactListRoute.name,
          path: '/',
        );

  static const String name = 'ContactListRoute';
}

/// generated route for
/// [_i2.EditPage]
class EditRoute extends _i3.PageRouteInfo<EditRouteArgs> {
  EditRoute({
    _i4.Key? key,
    _i5.Contact? contact,
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

  final _i4.Key? key;

  final _i5.Contact? contact;

  final dynamic len;

  @override
  String toString() {
    return 'EditRouteArgs{key: $key, contact: $contact, len: $len}';
  }
}
