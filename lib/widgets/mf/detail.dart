import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heytorus/widgets/master.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../styles/styles.dart' as styles;

class TestChart extends StatefulWidget {
  const TestChart({super.key});

  @override
  State<TestChart> createState() => _TestChartState();
}

class _TestChartState extends State<TestChart> {
  List<Color> gradientColors = [
    const Color(0xff0BC1A2).withOpacity(0.2),
    Colors.white,
  ];
  List<String> timeSpan = [
    '1M',
    '3M',
    '6M',
    '1Y',
    '3Y',
    '5Y',
    'ALL',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(
                show: false,
              ),
              titlesData: const FlTitlesData(
                show: false,
              ),
              borderData: FlBorderData(
                show: false,
              ),
              minX: 0,
              maxX: 11,
              minY: 0,
              maxY: 6,
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(0, 3),
                    FlSpot(2.6, 2),
                    FlSpot(4.9, 5),
                    FlSpot(6.8, 3.1),
                    FlSpot(8, 4),
                    FlSpot(9.5, 3),
                    FlSpot(11, 4),
                  ],
                  isCurved: false,
                  // gradient: LinearGradient(
                  //   colors: Colors.pinkAccent,
                  // ),
                  barWidth: 2,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(
                    show: false,
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: gradientColors
                          .map((color) => color.withOpacity(0.3))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...timeSpan.map(
              (e) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Text(
                        e,
                        style: TextStyle(
                            color: e == '1Y'
                                ? const Color(0xff3F7ED3)
                                : const Color(0xffA8A8A8),
                            fontSize: 18,
                            fontFamily: 'RobotoCondensed',
                            fontWeight:
                                e == '1Y' ? FontWeight.w700 : FontWeight.w400),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                        height: 7,
                        width: 7,
                        decoration: BoxDecoration(
                          color: e == '1Y'
                              ? const Color(0xff5C59C3)
                              : Colors.transparent,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class BasicAccordion extends StatefulWidget {
  String title;
  Widget content;
  BasicAccordion({super.key, required this.title, required this.content});

  @override
  State<BasicAccordion> createState() => _BasicAccordionState();
}

class _BasicAccordionState extends State<BasicAccordion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(100, 100, 111, 0.05),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        color: Colors.white,
        shadowColor: Colors.black.withOpacity(0.4),
        semanticContainer: false,
        child: ExpansionTile(
          shape: const Border(),
          collapsedTextColor: Colors.black,
          textColor: Colors.black,
          collapsedBackgroundColor: Colors.transparent,
          collapsedIconColor: Colors.black,
          backgroundColor: Colors.transparent,
          iconColor: Colors.black,
          title: Container(
            // color: Colors.pink,
            child: Text(widget.title),
          ),
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: widget.content,
            )
          ],
        ),
      ),
    );
  }
}

class RiskOMeter extends StatefulWidget {
  const RiskOMeter({super.key});

  @override
  State<RiskOMeter> createState() => _RiskOMeterState();
}

class _RiskOMeterState extends State<RiskOMeter> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.4,
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              showAxisLine: false,
              showLabels: false,
              showTicks: false,
              startAngle: 180,
              endAngle: 360,
              maximum: 180,
              canScaleToFit: true,
              radiusFactor: 0.79,
              pointers: const <GaugePointer>[
                NeedlePointer(
                    needleEndWidth: 5,
                    needleLength: 0.7,
                    value: 82,
                    knobStyle: KnobStyle(knobRadius: 0)),
              ],
              ranges: <GaugeRange>[
                GaugeRange(
                    startValue: 0,
                    endValue: 45,
                    startWidth: 0.45,
                    endWidth: 0.45,
                    sizeUnit: GaugeSizeUnit.factor,
                    color: const Color(0xFF61DAA7)),
                GaugeRange(
                    startValue: 45.1,
                    endValue: 90,
                    startWidth: 0.45,
                    sizeUnit: GaugeSizeUnit.factor,
                    endWidth: 0.45,
                    color: const Color(0xFFFCD205)),
                GaugeRange(
                    startValue: 90.1,
                    endValue: 135.0,
                    startWidth: 0.45,
                    sizeUnit: GaugeSizeUnit.factor,
                    endWidth: 0.45,
                    color: const Color(0xFFFFA928)),
                GaugeRange(
                  startValue: 135.1,
                  endValue: 180,
                  startWidth: 0.45,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.45,
                  color: const Color(0xFFFF4564),
                ),
              ],
            ),
            RadialAxis(
              showAxisLine: false,
              showLabels: false,
              showTicks: false,
              startAngle: 180,
              endAngle: 360,
              maximum: 180,
              radiusFactor: 0.85,
              canScaleToFit: true,
              pointers: const <GaugePointer>[
                MarkerPointer(
                    markerType: MarkerType.text,
                    text: 'Low',
                    value: 25.0,
                    textStyle: GaugeTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    offsetUnit: GaugeSizeUnit.factor,
                    markerOffset: -0.12),
                MarkerPointer(
                    markerType: MarkerType.text,
                    text: 'Moderate',
                    value: 70.1,
                    textStyle: GaugeTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    offsetUnit: GaugeSizeUnit.factor,
                    markerOffset: -0.12),
                MarkerPointer(
                    markerType: MarkerType.text,
                    text: 'High',
                    value: 120.0,
                    textStyle: GaugeTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    offsetUnit: GaugeSizeUnit.factor,
                    markerOffset: -0.12),
                MarkerPointer(
                    markerType: MarkerType.text,
                    text: 'Very High',
                    value: 160.0,
                    textStyle: GaugeTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    offsetUnit: GaugeSizeUnit.factor,
                    markerOffset: -0.12)
              ],
            ),
          ],
        ));
  }
}

class MFDetailTop extends StatefulWidget {
  const MFDetailTop({super.key});

  @override
  State<MFDetailTop> createState() => _MFDetailTopState();
}

class _MFDetailTopState extends State<MFDetailTop> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        //height: 100,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(100, 100, 111, 0.1),
              blurRadius: 12,
              spreadRadius: 3,
            ),
          ],
        ),
        child: const Column(
          children: [
            MFDetailHeader(),
            TestChart(),
            MFDetailCompareStrip(),
            MFDetailUSP()
          ],
        ),
      ),
    );
  }
}

class MFDetailUSP extends StatefulWidget {
  const MFDetailUSP({super.key});

  @override
  State<MFDetailUSP> createState() => _MFDetailUSPState();
}

class _MFDetailUSPState extends State<MFDetailUSP> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NAV'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff767676),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  '₹557.30'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 19, fontFamily: 'RobotoCondensed'),
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 1,
                  color: Color(0xffD6D6D6),
                ),
                right: BorderSide(
                  width: 1,
                  color: Color(0xffD6D6D6),
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Rating',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff767676),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  width: 50,
                  padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Color(0xffF2F2F2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '5',
                        style: TextStyle(
                            fontSize: 17, fontFamily: 'RobotoCondensed'),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      SvgPicture.asset(
                        'assets/icons/star.svg',
                        height: 12,
                        width: 12,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Fund Size',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff767676),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  '₹74,557.30'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 19, fontFamily: 'RobotoCondensed'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MFDetailHeader extends StatefulWidget {
  const MFDetailHeader({super.key});

  @override
  State<MFDetailHeader> createState() => _MFDetailHeaderState();
}

class _MFDetailHeaderState extends State<MFDetailHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MFHeaderCardTop(
            title: 'ICICI Prudential Focused \nBluechip Equity Fund',
            imgUrl: 'https://i.imgur.com/tIuAHTd.jpeg',
            showMeta: true,
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              Text(
                '22.50%',
                style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 20),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                '▼ 1.50%',
                style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 15,
                  color: Color(0xffF16577),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '1-Day Return',
                style: TextStyle(color: Color(0xff383838)),
              )
            ],
          )
        ],
      ),
    );
  }
}

class MFHeaderCardTop extends StatelessWidget {
  bool showMeta;
  String title;
  String imgUrl;
  MFHeaderCardTop({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.showMeta,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          width: showMeta == true ? 70 : 55,
          margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffEFEFEF), width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Image.network(
            imgUrl,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            showMeta == true
                ? const Text(
                    'Equity | Large Cap',
                    style: TextStyle(
                      color: Color(0xff6F6F6F),
                    ),
                  )
                : const SizedBox()
          ],
        )
      ],
    );
  }
}

class MFDetailBottom extends StatefulWidget {
  const MFDetailBottom({super.key});

  @override
  State<MFDetailBottom> createState() => _MFDetailBottomState();
}

class _MFDetailBottomState extends State<MFDetailBottom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: [
          BasicAccordion(
            title: 'Investment Details',
            content: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: DotRow(
                          topText: 'Min One Time Amt.',
                          bottomText: '₹5,000',
                          dotColor: const Color(0xff5C59C3),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: DotRow(
                          topText: 'Min Withdrawal Amt.',
                          bottomText: '₹1,000',
                          dotColor: const Color(0xff2DCDFF),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: DotRow(
                          topText: 'Min SIP Amt.',
                          bottomText: '₹5,000',
                          dotColor: const Color(0xffFE859A),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: DotRow(
                          topText: 'Min Addl Amt.',
                          bottomText: '₹1,000',
                          dotColor: const Color(0xffFFE876),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BasicAccordion(
            title: 'Basic Details',
            content: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: DotRow(
                          topText: 'Age.',
                          bottomText: '8 yrs 3 m',
                          dotColor: const Color(0xff5C59C3),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: DotRow(
                          topText: 'Return sicne launch',
                          bottomText: '13.88%',
                          dotColor: const Color(0xff2DCDFF),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: DotRow(
                          topText: 'Expense Ratio.',
                          bottomText: '0.7%',
                          dotColor: const Color(0xffFE859A),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: DotRow(
                          topText: 'Type',
                          bottomText: 'Open-ended',
                          dotColor: const Color(0xffFFE876),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: DotRow(
                          topText: 'AUM (Fund Size)',
                          bottomText: '₹24,235 Cr',
                          dotColor: const Color(0xff61DAA7),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: DotRow(
                          topText: 'Turnover',
                          bottomText: '129.00%',
                          dotColor: const Color(0xffFE859A),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: DotRow(
                          topText: 'Risk Grade.',
                          bottomText: 'High',
                          dotColor: const Color(0xffFFE876),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: DotRow(
                          topText: 'Return Grade',
                          bottomText: 'Medium',
                          dotColor: const Color(0xff61DAA7),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: DotRow(
                          topText: 'Benchmark',
                          bottomText: 'Nifty Large, Midcap 250 TRI',
                          dotColor: const Color(0xff2DCDFF),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          BasicAccordion(
            title: 'Asset Allocation',
            content: const Column(children: []),
          ),
          BasicAccordion(
            title: 'Riskometer',
            content: Column(
              children: [
                const RiskOMeter(),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Investors understand the their principal \n will be ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Very High',
                        style: TextStyle(
                          color: Color(0xffFF4564),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          BasicAccordion(
            title: 'Scheme Holding Summary',
            content: const Column(children: []),
          ),
        ],
      ),
    );
  }
}

class MFDetailCompareStrip extends StatefulWidget {
  const MFDetailCompareStrip({super.key});

  @override
  State<MFDetailCompareStrip> createState() => _MFDetailCompareStripState();
}

class _MFDetailCompareStripState extends State<MFDetailCompareStrip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      color: const Color(0xffBFD7F8),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/compare.svg',
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 10),
              const Text('Compare'),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/tick.svg',
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 10),
              const Text('Start SIP'),
            ],
          )
        ],
      ),
    );
  }
}

class DotRow extends StatelessWidget {
  String topText;
  String bottomText;
  Color dotColor;
  DotRow({
    super.key,
    required this.topText,
    required this.bottomText,
    required this.dotColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          height: 14,
          width: 14,
          decoration: BoxDecoration(
            color: dotColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(7),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              topText,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xffB2B2B2),
              ),
            ),
            Text(
              bottomText,
              style:
                  const TextStyle(fontFamily: 'RobotoCondensed', fontSize: 17),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

class MFRCRBlocks extends StatefulWidget {
  const MFRCRBlocks({super.key});

  @override
  State<MFRCRBlocks> createState() => _MFRCRBlocksState();
}

class _MFRCRBlocksState extends State<MFRCRBlocks> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
      child: Container(
        // height: 100,
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(100, 100, 111, 0.1),
              blurRadius: 12,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    width: 75,
                    height: 75,
                    child: SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                            showLabels: false,
                            showTicks: false,
                            startAngle: 270,
                            endAngle: 270,
                            radiusFactor: 0.8,
                            axisLineStyle: const AxisLineStyle(
                                thicknessUnit: GaugeSizeUnit.factor,
                                thickness: 0.15),
                            annotations: const <GaugeAnnotation>[
                              GaugeAnnotation(
                                angle: 180,
                                widget: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      '50',
                                      style: TextStyle(
                                        fontFamily: 'RobotoCondensed',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            pointers: const <GaugePointer>[
                              RangePointer(
                                  value: 50,
                                  cornerStyle: CornerStyle.bothCurve,
                                  enableAnimation: true,
                                  animationDuration: 1200,
                                  sizeUnit: GaugeSizeUnit.factor,
                                  gradient: SweepGradient(colors: <Color>[
                                    Color(0xFF6A6EF6),
                                    Color(0xFFDB82F5)
                                  ], stops: <double>[
                                    0.25,
                                    0.75
                                  ]),
                                  color: Color(0xFF00A8B5),
                                  width: 0.15),
                            ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    width: 75,
                    height: 75,
                    child: SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                            showLabels: false,
                            showTicks: false,
                            startAngle: 270,
                            endAngle: 270,
                            radiusFactor: 0.8,
                            axisLineStyle: const AxisLineStyle(
                                thicknessUnit: GaugeSizeUnit.factor,
                                thickness: 0.15),
                            annotations: const <GaugeAnnotation>[
                              GaugeAnnotation(
                                angle: 180,
                                widget: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      '50',
                                      style: TextStyle(
                                        fontFamily: 'RobotoCondensed',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            pointers: const <GaugePointer>[
                              RangePointer(
                                  value: 50,
                                  cornerStyle: CornerStyle.bothCurve,
                                  enableAnimation: true,
                                  animationDuration: 1200,
                                  sizeUnit: GaugeSizeUnit.factor,
                                  gradient: SweepGradient(colors: <Color>[
                                    Color(0xFF6A6EF6),
                                    Color(0xFFDB82F5)
                                  ], stops: <double>[
                                    0.25,
                                    0.75
                                  ]),
                                  color: Color(0xFF00A8B5),
                                  width: 0.15),
                            ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        top: MediaQuery.of(context).size.width * 0.04,
                        left: MediaQuery.of(context).size.width * 0.10,
                        child: const Text(
                          '4',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'RobotoCondensed',
                          ),
                        ),
                      ),
                      Container(
                        child: SvgPicture.asset(
                          'assets/icons/rank.svg',
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MFHeaderBottomAlt extends StatelessWidget {
  const MFHeaderBottomAlt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InfoLabel(
          topText: 'Min. Invest',
          bottomText: '₹ 747',
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Category Return',
              style: styles.InfoLabelHeader(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '15.20%',
                  style: styles.InfoLabelTitle(),
                ),
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  width: 45,
                  margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                  // color: Colors.pink,
                  // height: 4,
                  child: const LinearProgressIndicator(
                    backgroundColor: Color(0xffdedede),
                    color: Color(0xff3F7ED3),
                    value: 0.4,
                  ),
                ),
                Text(
                  '20.01%',
                  style: styles.InfoLabelTitle(),
                ),
              ],
            )
          ],
        ),
        const InfoLabel(
          topText: 'Returns',
          bottomText: '▲ 22.62%',
          bottomColor: Color(0xff29AD00),
        ),
      ],
    );
  }
}

class InfoLabel extends StatelessWidget {
  final String topText;
  final String bottomText;
  final Color? bottomColor;
  const InfoLabel(
      {super.key,
      required this.topText,
      required this.bottomText,
      this.bottomColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topText,
          style: styles.InfoLabelHeader(),
        ),
        Text(
          bottomText,
          style: styles.InfoLabelTitle(
            color: bottomColor ?? Colors.black,
          ),
        )
      ],
    );
  }
}

class MFMiniCard extends StatelessWidget {
  final String imgUrl;
  final String title;
  const MFMiniCard({super.key, required this.imgUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print('Yelp');
      },
      child: ShadowBox(
        child: Column(
          children: [
            MFHeaderCardTop(
              imgUrl: imgUrl,
              title: title,
              showMeta: false,
            ),
            const SizedBox(
              height: 8,
            ),
            const MFHeaderBottomAlt()
          ],
        ),
      ),
    );
  }
}

class Pill extends StatelessWidget {
  String label;
  Pill({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xff3F7ED3),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

class MFTransactionCard extends StatefulWidget {
  const MFTransactionCard({super.key});

  @override
  State<MFTransactionCard> createState() => _MFTransactionCardState();
}

class _MFTransactionCardState extends State<MFTransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 180,
      width: 150,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(100, 100, 111, 0.1),
            blurRadius: 15,
            spreadRadius: 3,
          ),
        ],
      ),
      margin: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: 55,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffEFEFEF), width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Image.asset(
              'assets/img/mf.jpeg',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'ICICI',
            style: styles.sectionTitleStyle(),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Prudential Focused \n (Equity Fund)',
            style: TextStyle(fontSize: 13),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'In Progress',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xffFF9F10),
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
