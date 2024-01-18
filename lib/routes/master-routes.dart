import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/pages/master/intro.dart';
import 'package:heytorus/routes/routes.dart';
import '../pages/master/home.dart';

List<GoRoute> masterRoutes = [
  GoRoute(
    name: 'home',
    path: AppRoutes.home,
    pageBuilder: (context, state) => const MaterialPage(
      child: HomePage(),
    ),
  ),
  GoRoute(
    name: 'intro',
    path: AppRoutes.intro,
    pageBuilder: (context, state) => const MaterialPage(
      child: IntroPage(),
    ),
  )
];
