import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/pages/digi-gold/gold-invest.dart';
import 'package:heytorus/pages/digi-gold/gold-landing.dart';
import 'package:heytorus/pages/digi-gold/gold-buy.dart';
import 'package:heytorus/pages/digi-gold/gold-sell.dart';
import 'package:heytorus/pages/digi-gold/gold-detail.dart';
import 'package:heytorus/pages/digi-gold/gold-vault.dart';
import 'package:heytorus/routes/routes.dart';

List<GoRoute> digiGoldRoutes = [
  GoRoute(
    name: 'digi-gold-landing',
    path: AppRoutes.digiGoldLanding,
    pageBuilder: (context, state) => const MaterialPage(
      child: GoldLandingPage(),
    ),
  ),
  GoRoute(
    name: 'digi-gold-vault',
    path: AppRoutes.digiGoldVault,
    pageBuilder: (context, state) => const MaterialPage(
      child: DigiGoldVaultPage(),
    ),
  ),
  GoRoute(
    name: 'digi-gold-invest',
    path: AppRoutes.digiGoldInvest,
    pageBuilder: (context, state) => const MaterialPage(
      child: GoldInvestPage(),
    ),
  ),
  GoRoute(
    name: 'digi-gold-buy',
    path: AppRoutes.digiGoldBuy,
    pageBuilder: (context, state) => const MaterialPage(
      child: BuyDigiGoldPage(),
    ),
  ),
  GoRoute(
    name: 'digi-gold-sell',
    path: AppRoutes.digiGoldSell,
    pageBuilder: (context, state) => const MaterialPage(
      child: SellDigiGoldPage(),
    ),
  ),
  GoRoute(
    name: 'digi-gold-detail',
    path: AppRoutes.digiGoldDetail,
    pageBuilder: (context, state) => const MaterialPage(
      child: DigiGoldDetailPage(),
    ),
  ),
];
