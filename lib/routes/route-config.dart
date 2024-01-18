import 'package:go_router/go_router.dart';
import 'package:heytorus/routes/auth-routes.dart';
import 'package:heytorus/routes/digi-gold-routes.dart';
import 'package:heytorus/routes/routes.dart';
import 'package:heytorus/routes/stock-routes.dart';
import 'package:heytorus/routes/master-routes.dart';
import 'package:heytorus/routes/mf-routes.dart';
import 'package:heytorus/routes/kyc-routes.dart';
import 'package:heytorus/routes/account-routes.dart';

class SuperAppRouter {
  GoRouter router = GoRouter(
    redirect: (context, state) async {},
    initialLocation: AppRoutes.home,
    routes: [
      ...authRoutes,
      ...digiGoldRoutes,
      ...KYCRoutes,
      ...masterRoutes,
      ...stockRoutes,
      ...MFRoutes,
      ...accountRoutes,
    ],
  );
}
