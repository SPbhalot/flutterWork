import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/widgets/account/account-landing.dart';

List<GoRoute> accountRoutes = [
  GoRoute(
    name: 'account',
    path: '/account',
    pageBuilder: (context, state) => const MaterialPage(
      child: AccountLandingPage(),
    ),
  ),
];
