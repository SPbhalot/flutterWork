import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/routes/routes.dart';
import 'package:heytorus/widgets/master.dart';
import 'package:heytorus/widgets/titles.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../utils/utils.dart' as utils;
import '../../styles/styles.dart' as styles;

class GoldSilvderMiniCard extends StatelessWidget {
  String title, imgPath;
  GoldSilvderMiniCard({super.key, required this.title, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: GestureDetector(
        onTap: () {
          context.push(AppRoutes.digiGoldDetail);
        },
        child: ShadowBox(
          noMargin: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        width: 1,
                        color: Color(0xffcccccc),
                      ),
                    ),
                    child: Image.asset(imgPath),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: utils.vw(4, context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        '24K • 999 Purity',
                        style: TextStyle(
                          fontSize: utils.vh(1.25, context),
                          color: Color(0xff707070),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Buying Price/gm',
                        style: styles.InfoLabelHeader(),
                      ),
                      Text(
                        '₹5251.16',
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          fontSize: utils.vh(1.6, context),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Selling Price/gm',
                        style: styles.InfoLabelHeader(),
                      ),
                      Text(
                        '₹5400.64',
                        style: TextStyle(
                          fontSize: utils.vh(1.6, context),
                          fontFamily: 'RobotoCondensed',
                        ),
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
}

class GoldSilverHoldingCard extends StatelessWidget {
  String title, imgPath;
  GoldSilverHoldingCard({
    super.key,
    required this.title,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: GestureDetector(
        onTap: () {
          context.push(AppRoutes.digiGoldDetail);
        },
        child: ShadowBox(
          noMargin: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            width: 1,
                            color: Color(0xffcccccc),
                          ),
                        ),
                        child: Image.asset(imgPath),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: utils.vw(4, context),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            '24K • 999 Purity',
                            style: TextStyle(
                              fontSize: utils.vh(1.25, context),
                              color: Color(0xff707070),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Qty',
                        style: styles.InfoLabelHeader(),
                      ),
                      Text(
                        '5gms',
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          fontSize: utils.vh(1.6, context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Investment(gm)',
                        style: styles.InfoLabelHeader(),
                      ),
                      Text(
                        '₹32,500',
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          fontSize: utils.vh(1.6, context),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Value',
                        style: styles.InfoLabelHeader(),
                      ),
                      Text(
                        '₹35,000',
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          fontSize: utils.vh(1.6, context),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Gain & Loss',
                        style: styles.InfoLabelHeader(),
                      ),
                      Text(
                        '▲ 7.692%',
                        style: TextStyle(
                          fontSize: utils.vh(1.6, context),
                          color: Color(0xff29AD00),
                          fontFamily: 'RobotoCondensed',
                        ),
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
}

class GoldUSPCard extends StatelessWidget {
  String title, desc, imgPath;
  GoldUSPCard({
    super.key,
    required this.desc,
    required this.imgPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      width: double.maxFinite,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 40, 15, 15),
            clipBehavior: Clip.none,
            //height: 140,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Color(0xffEEF1FB),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: utils.vw(3.9, context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: utils.vw(2.9, context),
                    color: Color(0xff5A5A5A),
                    height: 1.5,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: -20,
            left: 20,
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(244, 247, 255, 1),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.09),
                    blurRadius: 20,
                    spreadRadius: 0,
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  imgPath,
                  width: 25,
                  height: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DigiGoldHeaderChip extends StatelessWidget {
  String imgPath;
  String title;
  String subTitle;
  bool isBig;
  DigiGoldHeaderChip({
    super.key,
    required this.imgPath,
    required this.title,
    required this.subTitle,
    required this.isBig,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: isBig ? 70 : 50,
          width: isBig ? 70 : 50,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(
              width: 1,
              color: Color(0xffcccccc),
            ),
          ),
          child: Image.asset(
            imgPath,
          ),
        ),
        SizedBox(
          width: utils.vw(4, context),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: utils.vw(isBig ? 4.8 : 4.2, context),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: utils.vh(0.4, context),
            ),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: utils.vw(isBig ? 3.4 : 3.1, context),
                color: Color(0xff707070),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class DigiGoldBuySellTab extends StatefulWidget {
  List<BuyDigiGoldTabLabel> tabLabels;
  List<DigiGoldTabContent> tabContent;
  List<Map<String, String>> footerCalculations;

  DigiGoldBuySellTab({
    super.key,
    required this.tabLabels,
    required this.tabContent,
    required this.footerCalculations,
  });

  @override
  State<DigiGoldBuySellTab> createState() => _DigiGoldBuySellTabState();
}

class _DigiGoldBuySellTabState extends State<DigiGoldBuySellTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      //direction: Axis.vertical,
      children: [
        SizedBox(
          child: TabBar(
            indicatorColor: const Color(0xff3F7ED3),
            indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            indicatorWeight: 3,
            labelColor: Colors.black,
            unselectedLabelColor: const Color(0xff848080),
            tabs: [
              ...widget.tabLabels,
            ],
          ),
        ),
        Container(
          height: utils.vh(25, context),
          padding: EdgeInsets.fromLTRB(
              utils.vw(4, context), 0, utils.vw(4, context), 0),
          child: TabBarView(
            clipBehavior: Clip.none,
            controller: _tabController,
            children: [
              ...widget.tabContent,
            ],
          ),
        ),
        Container(
          color: const Color(0xffeaeaea),
          padding: EdgeInsets.all(utils.vw(4, context)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ...widget.footerCalculations.map((e) {
                return Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        e.keys
                            .toString()
                            .replaceAll('(', '')
                            .replaceAll(')', ''),
                        style: TextStyle(
                          fontSize: utils.vw(3.2, context),
                        ),
                      ),
                      Text(
                        e.values
                            .toString()
                            .replaceAll('(', '')
                            .replaceAll(')', ''),
                        style: TextStyle(
                          fontSize: utils.vw(4, context),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'RobotoCondensed',
                        ),
                      ),
                    ],
                  ),
                );
              }).toList()
            ],
          ),
        )
      ],
    );
  }
}

class BuyDigiGoldTabLabel extends StatelessWidget {
  String label;
  BuyDigiGoldTabLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: SizedBox(
        width: double.infinity,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: utils.vh(1.7, context)),
        ),
      ),
    );
  }
}

class DigiGoldTabInput extends StatefulWidget {
  double value;
  DigiGoldTabInput({super.key, required this.value});

  @override
  State<DigiGoldTabInput> createState() => _DigiGoldTabInputState();
}

class _DigiGoldTabInputState extends State<DigiGoldTabInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: utils.vw(10, context),
      width: utils.vw(43, context),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xffcccccc),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: utils.vw(7, context),
            decoration: const BoxDecoration(
              color: Color(0xffE7EAEE),
              //color: Color(0xff3F7ED3),
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            //height: utils.vw(11, context),
            child: Center(
              child: Text(
                '-',
                style: TextStyle(
                  color: Color(0xff3F7ED3),
                  //color: Color(0xffE7EAEE),
                  fontWeight: FontWeight.w800,
                  fontSize: utils.vw(5, context),
                ),
              ),
            ),
          ),
          Form(
            child: Container(
              width: utils.vw(23, context),
              child: TextFormField(
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontSize: utils.vw(4.5, context),
                  fontWeight: FontWeight.w600,
                ),
                initialValue: '₹ ${widget.value.toString()}',
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(0),
                  filled: false,
                ),
              ),
            ),
          ),
          Container(
            width: utils.vw(7, context),
            decoration: const BoxDecoration(
              color: Color(0xffE7EAEE),
              //color: Color(0xff3F7ED3),
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            // height: utils.vw(11, context),
            child: Center(
              child: Text(
                '+',
                style: TextStyle(
                  color: Color(0xff3F7ED3),
                  //color: Color(0xffE7EAEE),
                  fontWeight: FontWeight.w800,
                  fontSize: utils.vw(5, context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DigiGoldTabContent extends StatefulWidget {
  String title;
  double value;
  List<String> chipList;
  DigiGoldTabContent({
    super.key,
    required this.title,
    required this.value,
    required this.chipList,
  });

  @override
  State<DigiGoldTabContent> createState() => _DigiGoldTabContentState();
}

class _DigiGoldTabContentState extends State<DigiGoldTabContent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: utils.vh(2, context),
          ),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: utils.vw(4.7, context),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: utils.vh(2, context),
          ),
          DigiGoldTabInput(
            value: widget.value,
          ),
          SizedBox(
            height: utils.vh(2, context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...widget.chipList
                  .map(
                    (e) => Container(
                      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      decoration: const BoxDecoration(
                        color: Color(0xffE7EAEE),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Text(
                        e,
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          fontSize: utils.vh(1.4, context),
                          color: const Color(0xff646464),
                        ),
                      ),
                    ),
                  )
                  .toList()
            ],
          ),
          SizedBox(
            height: utils.vh(4, context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Valid for ',
              ),
              Countdown(
                seconds: 300,
                build: (BuildContext context, double time) => Text(
                  utils.formatTime(time.toInt()),
                  textAlign: TextAlign.left,
                  style: styles.sectionTextStyle(isBold: true),
                ),
                interval: Duration(seconds: 1),
                onFinished: () {},
              ),
              const Text(
                ' mins',
              )
            ],
          )
        ],
      ),
    );
  }
}
