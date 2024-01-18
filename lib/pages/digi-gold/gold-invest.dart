import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:heytorus/layouts/default.dart';
import 'package:heytorus/widgets/digi-gold/gs.dart';
import '../../styles/styles.dart' as styles;
import '../../utils/utils.dart' as utils;

class GoldInvestPage extends StatefulWidget {
  const GoldInvestPage({super.key});

  @override
  State<GoldInvestPage> createState() => _GoldInvestPageState();
}

class _GoldInvestPageState extends State<GoldInvestPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      navType: 'gold',
      pageTitle: 'Invest',
      widgetList: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Explore Digital Commodities',
                style: styles.sectionTitleStyle(),
              ),
              const SizedBox(
                height: 15,
              ),
              GoldSilvderMiniCard(
                title: 'Digital Gold',
                imgPath: 'assets/img/gold.png',
              ),
              GoldSilvderMiniCard(
                title: 'Digital Silver',
                imgPath: 'assets/img/gold.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
