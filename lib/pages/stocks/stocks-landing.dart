import 'package:flutter/material.dart';
import 'package:heytorus/layouts/default.dart';
import 'package:heytorus/widgets/stocks/indices.dart';
import '../../widgets/stocks/categories.dart';

class StocksLanding extends StatefulWidget {
  const StocksLanding({super.key});
  @override
  State<StocksLanding> createState() => _StocksLandingState();
}

class _StocksLandingState extends State<StocksLanding> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      navType: 'stocks',
      widgetList: const [
        Indices(),
        StockCategories(),
      ],
      pageTitle: 'Stocks',
    );
  }
}
