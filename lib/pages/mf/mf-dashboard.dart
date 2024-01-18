import 'package:flutter/material.dart';
import 'package:heytorus/layouts/default.dart';
import 'package:heytorus/widgets/mf/detail.dart';
import 'package:heytorus/widgets/titles.dart';
import 'package:timelines/timelines.dart';

import '../../widgets/master.dart';

class MFDashboardPage extends StatefulWidget {
  const MFDashboardPage({super.key});

  @override
  State<MFDashboardPage> createState() => _MFDashboardPageState();
}

class _MFDashboardPageState extends State<MFDashboardPage> {
  List<Map> MFCats = [
    {"img": "assets/icons/top-rated-funds.svg", "label": "Top rated\n funds"},
    {"img": "assets/icons/tax-saver-funds.svg", "label": "Tax\n Savers"},
    {
      "img": "assets/icons/annual-returns-funds.svg",
      "label": "Anuual \n Retunrs"
    },
    {
      "img": "assets/icons/new-fund-offers-funds.svg",
      "label": "New Fund Offers"
    },
    {
      "img": "assets/icons/wealth-builder-funds.svg",
      "label": "Wealth\n Builder"
    },
    {"img": "assets/icons/steady-income-funds.svg", "label": "Steady\n Income"},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      navType: 'mf',
      widgetList: [
        // InvestingSteps(),
        IllustrationCard(
          assetPath: 'assets/illustrations/not-invested-mf.svg',
          title: 'You haven\'t invested in any funds',
          desc: 'Today is a good day to start investing',
          ctaLabel: 'Start Investing',
          ctaAction: () => {},
        ),
        const SizedBox(
          height: 20,
        ),
        SectionTitle(
          noTopPadding: true,
          title: 'Discover mutual funds for investments',
        ),
        const SizedBox(
          height: 5,
        ),
        GridBlocks(cats: MFCats),
        const SizedBox(
          height: 10,
        ),

        const SizedBox(
          height: 15,
        ),
        SectionTitle(
          noTopPadding: true,
          title: 'How to start Investing?',
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),
          child: Image.asset(
            'assets/img/i-b.jpg',
          ),
        ),
        SectionTitle(
          noTopPadding: false,
          title: 'Explore Funds',
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Pill(
                label: 'Equity',
              ),
              Pill(
                label: 'Debt',
              ),
              Pill(
                label: 'Hybrid',
              )
            ],
          ),
        ),
        const MFMiniCard(
          title: 'ICICI Prudential Focused \nBluechip Equity Fund',
          imgUrl: 'https://i.imgur.com/tIuAHTd.jpeg',
        ),
        const MFMiniCard(
          title: 'Franklin India Multi Asset \nSolution Fund Direct Growth',
          imgUrl: 'https://i.imgur.com/riYtuE3.jpeg',
        ),
        const MFMiniCard(
          title: 'Axis Long Term Equity Fund',
          imgUrl: 'https://i.imgur.com/TIEWUYE.jpg',
        ),
      ],
      pageTitle: 'Mutual Funds',
    );
  }
}

class InvestingSteps extends StatelessWidget {
  const InvestingSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      shrinkWrap: true,
      builder: TimelineTileBuilder.fromStyle(
        contentsAlign: ContentsAlign.basic,
        contentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: TimelineTile(
              //mainAxisExtent: 1,
              nodeAlign: TimelineNodeAlign.start,
              node: Container(
                height: 40,
                width: 40,
                color: Colors.pink,
              ),
              contents: Container(
                height: 200,
                width: double.infinity,
                color: Colors.yellow,
              ),
            )),
        itemCount: 10,
      ),
    );
  }
}
