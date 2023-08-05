import 'dart:async';

import 'package:flutter/material.dart';
import 'package:magic_yeti/app/bloc/app_bloc.dart';
import 'package:magic_yeti/app_router/routes.dart';

FutureOr<String?> redirects({
  required BuildContext context,
  required String? location,
  required AppStatus status,
}) async {
  switch (status) {
    case AppStatus.authenticated:
      if (location == LoginRoute.route.path) {
        return HomeRoute.route.path;
      }
    case AppStatus.unauthenticated:
      if (location != LoginRoute.route.path) {
        return LoginRoute.route.path;
      }
  }

  // Returning null prevents GoRouter from redirecting.
  return null;
}
