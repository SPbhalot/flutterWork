import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heytorus/bloc/auth/auth-bloc.dart';
import 'package:heytorus/bloc/kyc/kyc-bloc.dart';
import 'package:heytorus/bloc/master/master-bloc.dart';
import 'package:heytorus/bloc/user/user-bloc.dart';
import 'package:heytorus/routes/route-config.dart';
import 'package:heytorus/services/local-storage.dart';

void main() async {
  // Salutations
  print(
      '4KSu4KSo4KWLIOCkrOClgeCkpuCljeCkp+CljeCkr+CkueCkguCkleCkvuCksOCkmuCkv+CkpOCljeCkpOCkvuCkqOCkvyDgpKjgpL7gpLngpK7gpY0g4KSoIOCkmiDgpLbgpY3gpLDgpYvgpKTgpY3gpLAg4KSc4KS/4KS54KWN4KS14KWHIOCkqCDgpJog4KSY4KWN4KSw4KS+4KSjIOCkqOClh+CkpOCljeCksOClhwrgpKgg4KSaIOCkteCljeCkr+Cli+CkriDgpK3gpYLgpK7gpL/gpLDgpY0g4KSoIOCkpOClh+CknOCliiDgpKgg4KS14KS+4KSv4KWBOiDgpJrgpL/gpKbgpL7gpKjgpKjgpY3gpKYg4KSw4KWC4KSqOiDgpLbgpL/gpLXgpYvgpL3gpLngpK7gpY0g4KS24KS/4KS14KWK4KS94KS54KSu4KWNIOClpQ==');

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SuperApp());
}

class SuperApp extends StatefulWidget {
  const SuperApp({super.key});

  @override
  State<SuperApp> createState() => _SuperAppState();
}

class _SuperAppState extends State<SuperApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => MasterBloc(),
        ),
        BlocProvider(
          create: (context) => KYCBloc(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(fontFamily: 'Mulish'),
        debugShowCheckedModeBanner: false,
        routerConfig: SuperAppRouter().router,
      ),
    );
  }
}
