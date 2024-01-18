import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/pages/mf/mf-detail.dart';
import 'package:heytorus/pages/mf/mf-landing.dart';
import 'package:heytorus/pages/mf/mf-dashboard.dart';
import 'package:heytorus/pages/mf/mf-listing.dart';
import 'package:heytorus/pages/mf/mf-order-detail.dart';
import 'package:heytorus/pages/mf/mf-portfolio.dart';
import 'package:heytorus/routes/routes.dart';

List<GoRoute> MFRoutes = [
  GoRoute(
    name: 'mf-landing',
    path: AppRoutes.MFLanding,
    pageBuilder: (context, state) => const MaterialPage(
      child: MFLandingPage(),
    ),
  ),
  GoRoute(
    name: 'mf-portfolio',
    path: AppRoutes.MFPortfolio,
    pageBuilder: (context, state) => const MaterialPage(
      child: MFPortfolioPage(),
    ),
  ),
  GoRoute(
    name: 'mf-detail',
    path: AppRoutes.MFDetail,
    pageBuilder: (context, state) => const MaterialPage(
      child: MFDetailPage(),
    ),
  ),
  GoRoute(
    name: 'mf-dashboard',
    path: AppRoutes.MFDashboard,
    pageBuilder: (context, state) => const MaterialPage(
      child: MFDashboardPage(),
    ),
  ),
  GoRoute(
    name: 'mf-order-detail',
    path: AppRoutes.MFOrderDetail,
    pageBuilder: (context, state) => const MaterialPage(
      child: MFOrderDetailPage(),
    ),
  ),
  GoRoute(
    name: 'mf-listing',
    path: AppRoutes.MFListing,
    pageBuilder: (context, state) => const MaterialPage(
      child: MFListingPage(),
    ),
  ),
];
