import 'package:flutter/material.dart';
import 'package:heytorus/layouts/default.dart';
import 'package:heytorus/widgets/mf/detail.dart';

class MFDetailPage extends StatefulWidget {
  const MFDetailPage({super.key});

  @override
  State<MFDetailPage> createState() => _MFDetailPageState();
}

class _MFDetailPageState extends State<MFDetailPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      navType: 'null',
      widgetList: const [
        MFDetailTop(),
        MFRCRBlocks(),
        MFDetailBottom(),
        SizedBox(
          height: 100,
        ),
      ],
      pageTitle: 'Mutual Funds Detail',
    );
  }
}
