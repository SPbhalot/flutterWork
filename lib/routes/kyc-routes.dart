import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/pages/kyc/landing.dart';
import 'package:heytorus/pages/kyc/pan-verification.dart';
import 'package:heytorus/pages/kyc/test-esign.dart';
import 'package:heytorus/routes/routes.dart';
import 'package:heytorus/services/local-storage.dart';

List<GoRoute> KYCRoutes = [
  GoRoute(
    name: 'kyc-pan-verification',
    path: '/kyc/pan-verification',
    pageBuilder: (context, state) => const MaterialPage(
      child: PanVerificationPage(),
    ),
  ),
  GoRoute(
    name: 'kyc-landing',
    path: AppRoutes.kyc,
    redirect: (context, state) async {
      String? accessToken =
          await securedStorageService.read(key: 'accessToken');

      if (accessToken == null) {
        return '/auth';
      }
    },
    pageBuilder: (context, state) => const MaterialPage(
      child: KYCLandingPage(),
    ),
  ),
];
