import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/pages/auth/auth.dart';
import 'package:heytorus/pages/auth/verify-email.dart';
import 'package:heytorus/routes/routes.dart';
import 'package:heytorus/services/local-storage.dart';

List<GoRoute> authRoutes = [
  GoRoute(
    name: 'auth',
    path: AppRoutes.auth,
    redirect: (context, state) async {
      String? accessToken =
          await securedStorageService.read(key: 'accessToken');
      print('accessToken');
      if (accessToken != null) {
        return '/';
      }
    },
    pageBuilder: (context, state) => const MaterialPage(
      child: AuthPage(),
    ),
  ),
  GoRoute(
    name: 'verify-email',
    path: AppRoutes.verifyEmail,
    pageBuilder: (context, state) => const MaterialPage(
      child: VerifyEmailPage(),
    ),
  )
];
