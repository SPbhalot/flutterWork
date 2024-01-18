import 'package:flutter/material.dart';
import 'package:heytorus/layouts/default.dart';
import '../../styles/styles.dart' as styles;

class MFOrderDetailPage extends StatefulWidget {
  const MFOrderDetailPage({super.key});

  @override
  State<MFOrderDetailPage> createState() => _MFOrderDetailPageState();
}

class _MFOrderDetailPageState extends State<MFOrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      pageTitle: 'Order Details',
      bgColor: const Color(0xffE8F0FF),
      navType: 'mf',
      widgetList: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ICICI Prudential Focused Bluechip \nEquity Fund',
                style: styles.sectionTitleStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '8th Mar 2023',
                style: styles.sectionTextStyle(
                  textColor: const Color(0xffB2B2B2),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
