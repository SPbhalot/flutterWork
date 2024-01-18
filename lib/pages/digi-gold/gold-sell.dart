import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heytorus/layouts/default.dart';
import 'package:heytorus/widgets/digi-gold/gs.dart';
import 'package:heytorus/widgets/master.dart';
import 'package:heytorus/widgets/titles.dart';
import '../../utils/utils.dart' as utils;

class SellDigiGoldPage extends StatefulWidget {
  const SellDigiGoldPage({super.key});

  @override
  State<SellDigiGoldPage> createState() => _BuyDigiGoldPageState();
}

class _BuyDigiGoldPageState extends State<SellDigiGoldPage> {
  void openModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.all(utils.vw(5, context)),
        // title: const Text('AlertDialog Title'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        content: Container(
          width: utils.vw(100, context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset('assets/icons/close.svg'),
                  ),
                ],
              ),
              SizedBox(
                height: utils.vh(2, context),
              ),
              SvgPicture.asset(
                'assets/illustrations/buy-gold.svg',
                width: utils.vw(20, context),
              ),
              SizedBox(
                height: utils.vh(2, context),
              ),
              Text(
                'Your order has been \nsuccessfully sold',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: utils.vw(4, context),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: utils.vh(2, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PopupLabel(
                        label: 'Product',
                      ),
                      PopupText(
                        text: 'Digi Gold',
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      PopupLabel(
                        label: 'Quantity',
                      ),
                      PopupText(
                        text: '1 gm',
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: utils.vh(1, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PopupLabel(
                        label: 'Total Amount',
                      ),
                      PopupText(
                        text: '₹7,477.00',
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      PopupLabel(
                        label: 'Order ID',
                      ),
                      PopupText(
                        text: '20231233142322',
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: utils.vh(1, context),
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PopupLabel(
                        label: 'Date and Time',
                      ),
                      PopupText(
                        text:
                            'Fri Dec 29 2023 11:59:23 GMT+0530 \n(India Standard Time)',
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      navType: 'null',
      pageTitle: 'Order Pad',
      widgetList: [
        Container(
          height: MediaQuery.of(context).size.height - utils.vh(14, context),
          color: Color(0xfffafafa),
          child: Stack(
            children: [
              ShadowBox(
                bgColor: Colors.white,
                noPadding: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(utils.vw(4, context)),
                      child: DigiGoldHeaderChip(
                        isBig: false,
                        title: 'Digital Gold',
                        subTitle: '24K • 999 Purity',
                        imgPath: 'assets/img/gold.png',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        utils.vw(0, context),
                        0,
                        utils.vw(0, context),
                        utils.vw(0, context),
                      ),
                      child: DigiGoldBuySellTab(
                        tabLabels: [
                          BuyDigiGoldTabLabel(
                            label: 'Rs. to Gms.',
                          ),
                          BuyDigiGoldTabLabel(
                            label: 'Gms. to Rs.',
                          ),
                        ],
                        tabContent: [
                          DigiGoldTabContent(
                            title: 'Selling Amount',
                            value: 747.77,
                            chipList: const ['₹ 1000', '₹ 2000', '₹ 3000'],
                          ),
                          DigiGoldTabContent(
                            title: 'Quantity (Gms)',
                            value: 7.47,
                            chipList: const ['2g', '4g', '6g'],
                          ),
                        ],
                        footerCalculations: const [
                          {
                            'Available to Sell': '7 gms',
                          },
                          {
                            'Quantity': '2 gms',
                          },
                          {
                            'Return Value': '₹7477.00',
                          },
                        ],
                      ),
                    ),
                  ],
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
                  child: IntroButtonAlt(
                    callback: () {
                      openModal();
                    },
                    label: 'Sell',
                    backgroundColor: const Color(0xffD23D50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
