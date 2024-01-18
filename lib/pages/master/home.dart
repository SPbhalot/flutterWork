import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/layouts/default.dart';
import 'package:heytorus/routes/routes.dart';
import 'package:heytorus/widgets/master.dart';
import 'package:heytorus/widgets/titles.dart';
import '../../utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = ['assets/img/super-1.jpg', 'assets/img/super-2.jpg'];

  int counter = 0;

  @override
  void initState() {
    counter = 0;
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    List<Map> cats = [
      {
        "img": "assets/icons/stocks.svg",
        "label": "Stocks",
        "route": AppRoutes.home
      },
      {
        "img": "assets/icons/mf.svg",
        "label": "Mutual\n Funds",
        "route": AppRoutes.home
      },
      {
        "img": "assets/icons/loan-stocks.svg",
        "label": "Loan Against Stocks",
        "route": AppRoutes.home
      },
      {
        "img": "assets/icons/baskets.svg",
        "label": "Baskets",
        "route": AppRoutes.home
      },
      {
        "img": "assets/icons/us-stocks.svg",
        "label": "US Stocks",
        "route": AppRoutes.home
      }
    ];

    List<Map> moneySaverCats = [
      {
        "img": "assets/icons/gold-silver.svg",
        "label": "Gold & Silver",
        "route": AppRoutes.digiGoldLanding
      },
      {
        "img": "assets/icons/bonds.svg",
        "label": "Bonds",
        "route": AppRoutes.home
      },
      {
        "img": "assets/icons/fd.svg",
        "label": "Fixed Deposits",
        "route": AppRoutes.home
      },
    ];
    return DefaultLayout(
      pageTitle: 'Torus',
      navType: 'home',
      widgetList: [
        KYCPendingBadge(),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...images.map((e) {
                setState(() {
                  counter++;
                });
                return Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 60,
                  margin: EdgeInsets.fromLTRB(counter == 1 ? 20 : 0, 0, 15, 0),
                  child: Image.asset(e),
                );
              }).toList()
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        MegaTitle(
          title: 'Wealth Wellness',
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 60,
          child: SectionText(
            text:
                'Offering products to help you make informed investment decisions',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SectionTitle(
          title: 'Money Makers',
        ),
        GridBlocks(cats: cats),
        SvgPicture.asset(
          'assets/img/robo.svg',
          width: MediaQuery.of(context).size.width,
        ),
        SectionTitle(
          title: 'Money Savers',
          noTopPadding: true,
        ),
        GridBlocks(cats: moneySaverCats)
      ],
    );
  }
}
