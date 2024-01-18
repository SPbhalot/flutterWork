import 'package:flutter/material.dart';
import 'package:heytorus/layouts/default.dart';

class MFLandingPage extends StatefulWidget {
  const MFLandingPage({super.key});

  @override
  State<MFLandingPage> createState() => _MFLandingPageState();
}

class _MFLandingPageState extends State<MFLandingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      navType: 'mf',
      widgetList: const [],
      pageTitle: 'Mutual Funds',
    );
  }
}
