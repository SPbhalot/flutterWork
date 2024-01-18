import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heytorus/layouts/default.dart';
import 'package:heytorus/widgets/digi-gold/gs.dart';
import 'package:heytorus/widgets/master.dart';
import '../../styles/styles.dart' as styles;
import '../../utils/utils.dart' as utils;

class GoldLandingPage extends StatefulWidget {
  const GoldLandingPage({super.key});

  @override
  State<GoldLandingPage> createState() => _GoldLandingPageState();
}

class _GoldLandingPageState extends State<GoldLandingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      navType: 'gold',
      pageTitle: 'Digital Gold and Silver',
      widgetList: [
        const KYCPendingBadge(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Benefits Of Digital Commodities',
                style: styles.sectionTitleStyle(),
              ),
              const SizedBox(
                height: 40,
              ),
              Wrap(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GoldUSPCard(
                          title: '100% Secure',
                          imgPath: 'assets/icons/secure-tick.svg',
                          desc: 'Stored in insured & guarded vaults.',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GoldUSPCard(
                          title: 'Diversify Portfolio',
                          imgPath: 'assets/icons/diversify-p.svg',
                          desc: 'Balance your portfolio. \nReduce risk.',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: GoldUSPCard(
                      title: 'Simple Investment',
                      imgPath: 'assets/icons/s-i.svg',
                      desc:
                          'No need of huge amount of money to start investing.\n Investment starts from ₹1.',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Digital Commodities',
                style: styles.sectionTitleStyle(),
              ),
              const SizedBox(
                height: 25,
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
