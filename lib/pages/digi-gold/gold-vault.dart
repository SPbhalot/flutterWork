import 'package:flutter/material.dart';
import 'package:heytorus/layouts/default.dart';
import 'package:heytorus/pages/mf/mf-portfolio.dart';
import 'package:heytorus/widgets/digi-gold/gs.dart';
import '../../styles/styles.dart' as styles;
import '../../utils/utils.dart' as utils;

class DigiGoldVaultPage extends StatefulWidget {
  const DigiGoldVaultPage({super.key});

  @override
  State<DigiGoldVaultPage> createState() => _DigiGoldVaultPageState();
}

class _DigiGoldVaultPageState extends State<DigiGoldVaultPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      navType: 'gold',
      pageTitle: 'Vault',
      widgetList: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: utils.vh(2, context),
              ),
              Text(
                'Investment Summary',
                style: styles.sectionTitleStyle(),
              ),
              SizedBox(
                height: utils.vh(1.5, context),
              ),
              const PortfolioBox(),
              SizedBox(
                height: utils.vh(3, context),
              ),
              Text(
                'Holdings',
                style: styles.sectionTitleStyle(),
              ),
              SizedBox(
                height: utils.vh(2, context),
              ),
              GoldSilverHoldingCard(
                title: 'Digital Gold',
                imgPath: 'assets/img/gold.png',
              ),
              GoldSilverHoldingCard(
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
