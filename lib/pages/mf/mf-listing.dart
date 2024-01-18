import 'package:flutter/material.dart';
import 'package:heytorus/layouts/default.dart';
import 'package:heytorus/widgets/mf/detail.dart';
import 'package:heytorus/widgets/titles.dart';

class MFListingPage extends StatefulWidget {
  const MFListingPage({super.key});

  @override
  State<MFListingPage> createState() => _MFListingPageState();
}

class _MFListingPageState extends State<MFListingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      navType: 'mf',
      pageTitle: 'All Mutual Funds',
      widgetList: [
        SectionTitle(
          noTopPadding: false,
          title: 'Invest',
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Pill(
                  label: 'Top Rated Fundsr',
                ),
                const SizedBox(
                  width: 10,
                ),
                Pill(
                  label: 'Tax Savers',
                ),
                const SizedBox(
                  width: 10,
                ),
                Pill(
                  label: 'Anunual Returns',
                ),
                const SizedBox(
                  width: 10,
                ),
                Pill(
                  label: 'New Fund Offers',
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
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
    );
  }
}
