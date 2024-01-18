import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/pages/stocks/equity.dart';
import 'package:heytorus/pages/stocks/stocks-landing.dart';

List<GoRoute> stockRoutes = [
  GoRoute(
    name: 'stocks-landing',
    path: '/stocks',
    pageBuilder: (context, state) => const MaterialPage(
      child: StocksLanding(),
    ),
  ),
  GoRoute(
    name: 'equity',
    path: '/stocks/equity',
    pageBuilder: (context, state) => const MaterialPage(
      child: EquityPage(),
    ),
  )
];
