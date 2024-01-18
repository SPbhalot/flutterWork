import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/routes/routes.dart';
import '../styles/styles.dart' as styles;
import '../utils/utils.dart' as utils;

class TorusBottomNaviagtionBar extends StatefulWidget {
  String type;
  TorusBottomNaviagtionBar({super.key, required this.type});

  @override
  State<TorusBottomNaviagtionBar> createState() =>
      _TorusBottomNaviagtionBarState();
}

class _TorusBottomNaviagtionBarState extends State<TorusBottomNaviagtionBar> {
  List<Widget> mainNav = [];
  List<Map<String, dynamic>> navList = [];

  @override
  void initState() {
    super.initState();

    navList = [];

    if (widget.type == 'stocks') {
      navList = [
        {
          "label": "Home",
          "icon": "home.svg",
          "route": AppRoutes.home,
        },
        {
          "label": "Dashboard",
          "icon": "dashboard.svg",
        },
        {
          "label": "Watchlist",
          "icon": "watchlist.svg",
        },
        {
          "label": "Trades",
          "icon": "trades.svg",
        },
        {
          "label": "Account",
          "icon": "account.svg",
        },
      ];
    }

    if (widget.type == 'home') {
      navList = [
        {
          "label": "Wealth",
          "icon": "wealth.svg",
          "route": AppRoutes.home,
        },
        {
          "label": "Health",
          "icon": "health.svg",
          "route": '',
        },
        {
          "label": "Education",
          "icon": "education.svg",
          "route": '',
        },
        {
          "label": "Lifestyle",
          "icon": "lifestyle.svg",
          "route": '',
        },
      ];
    }

    if (widget.type == 'gold') {
      navList = [
        {
          "label": "Home",
          "icon": "home.svg",
          "route": AppRoutes.home,
        },
        {
          "label": "Dashboard",
          "icon": "dashboard.svg",
          "route": AppRoutes.digiGoldLanding,
        },
        {
          "label": "Invest",
          "icon": "invest.svg",
          "route": AppRoutes.digiGoldInvest,
        },
        {
          "label": "Vault",
          "icon": "vault.svg",
          "route": AppRoutes.digiGoldVault,
        },
        {
          "label": "Profile",
          "icon": "profile.svg",
        },
      ];
    }

    if (widget.type == 'mf') {
      navList = [
        {
          "label": "Home",
          "icon": "home.svg",
        },
        {
          "label": "Dashboard",
          "icon": "dashboard.svg",
        },
        {
          "label": "Invest",
          "icon": "invest.svg",
        },
        {
          "label": "Portfolio",
          "icon": "portfolio.svg",
        },
        {
          "label": "Profile",
          "icon": "profile.svg",
        },
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 140.0, sigmaY: 140.0),
        child: Container(
          decoration: BoxDecoration(
            //color: Colors.pink,
            color: const Color(0xffffffff).withOpacity(0.8),

            //color: Colors.yellow,
          ),
          height: 90,
          clipBehavior: Clip.hardEdge,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...navList.map((e) {
                bool isActive = GoRouter.of(context)
                        .routeInformationProvider
                        .value
                        .uri
                        .toString() ==
                    e['route'].toString();

                return Container(
                  width: utils.vw(16, context),
                  // decoration: BoxDecoration(border: Border.all(width: 1)),
                  child: GestureDetector(
                    onTap: () {
                      if (e['route'] != null) {
                        context.push(
                          e['route'],
                        );
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/${e['icon']}',
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            isActive != true
                                ? const Color(0xffcdcdcd)
                                : const Color(0xff3F7ED3),
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          e['label']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: utils.vw(2.9, context),
                            color: isActive != true
                                ? const Color(0xffcdcdcd)
                                : const Color(0xff3F7ED3),
                          ),
                        ),
                        AnimatedScale(
                          scale: isActive == true ? 1 : 0,
                          duration: Duration(seconds: 1),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                            decoration: BoxDecoration(
                              color: Color(0xff3F7ED3),
                              borderRadius: BorderRadius.all(
                                Radius.circular(3),
                              ),
                            ),
                            height: 5,
                            width: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
