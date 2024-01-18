import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/routes/routes.dart';
import 'package:heytorus/widgets/digi-gold/gs.dart';
import 'package:heytorus/widgets/master.dart';
import 'package:heytorus/widgets/mf/detail.dart';
import 'package:heytorus/widgets/titles.dart';
import 'package:heytorus/layouts/default.dart';
import '../../utils/utils.dart' as utils;

class DigiGoldDetailPage extends StatefulWidget {
  const DigiGoldDetailPage({super.key});

  @override
  State<DigiGoldDetailPage> createState() => _DigiGoldDetailPageState();
}

class _DigiGoldDetailPageState extends State<DigiGoldDetailPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      navType: 'null',
      pageTitle: 'Digital Gold',
      widgetList: [
        Container(
          height: MediaQuery.of(context).size.height - utils.vh(12, context),
          color: const Color(0xfffafafa),
          child: Stack(children: [
            SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ShadowBox(
                      noPadding: true,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(utils.vw(4, context)),
                            child: DigiGoldHeaderChip(
                              isBig: true,
                              title: 'Digital Gold',
                              subTitle: '24K • 999 Purity',
                              imgPath: 'assets/img/gold.png',
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(utils.vw(4, context),
                                0, utils.vw(4, context), 0),
                            width: double.infinity,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PopupLabel(
                                  label: 'Current Price/gm',
                                ),
                                PopupText(
                                  text: '₹7,747.00',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: utils.vh(1, context),
                          ),
                          Container(
                            padding: EdgeInsets.all(utils.vw(4, context)),
                            child: Image.asset(
                              'assets/img/gold-chart.png',
                            ),
                          ),
                          SizedBox(
                            height: utils.vh(2, context),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: utils.vh(2, context),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(
                        utils.vw(5.5, context),
                        0,
                        utils.vw(5.5, context),
                        0,
                      ),
                      child: Text(
                        'Details',
                        style: TextStyle(
                          fontSize: utils.vw(4, context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: utils.vh(1, context),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(
                        utils.vw(3, context),
                        0,
                        utils.vw(3, context),
                        0,
                      ),
                      child: Column(
                        children: [
                          BasicAccordion(
                            title: 'Charges / Tax applicable',
                            content: Column(
                              children: [
                                Container(
                                  child: Text(
                                    'It is a long established fact that a read,er will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.',
                                    style: TextStyle(color: Color(0xff808080)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          BasicAccordion(
                            title: 'Minimum holding period & liquidation',
                            content: Column(
                              children: [
                                Container(
                                  child: Text(
                                    'It is a long established fact that a read,er will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.',
                                    style: TextStyle(color: Color(0xff808080)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          BasicAccordion(
                            title: 'About Seller',
                            content: Column(
                              children: [
                                Container(
                                  child: Text(
                                    'It is a long established fact that a read,er will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.',
                                    style: TextStyle(color: Color(0xff808080)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: utils.vh(15, context),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: utils.vw(100, context),
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(
                  utils.vw(5, context),
                  utils.vw(5, context),
                  utils.vw(5, context),
                  utils.vw(8, context),
                ),
                // height: utils.vh(12, context),
                child: Row(
                  children: [
                    Expanded(
                      child: IntroButtonAlt(
                        callback: () {
                          context.push(AppRoutes.digiGoldBuy);
                        },
                        label: 'Buy',
                        backgroundColor: const Color(0xff29AD00),
                      ),
                    ),
                    SizedBox(
                      width: utils.vw(3, context),
                    ),
                    Expanded(
                      child: IntroButtonAlt(
                        callback: () {
                          context.push(AppRoutes.digiGoldSell);
                        },
                        label: 'Sell',
                        backgroundColor: const Color(0xffD23D50),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        )
      ],
    );
  }
}
