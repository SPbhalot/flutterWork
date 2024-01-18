//import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heytorus/layouts/default.dart';
import 'package:heytorus/widgets/mf/detail.dart';
import 'package:heytorus/widgets/titles.dart';
import '../../styles/styles.dart' as styles;
import '../../utils/utils.dart' as utils;

class MFPortfolioPage extends StatefulWidget {
  const MFPortfolioPage({super.key});

  @override
  State<MFPortfolioPage> createState() => _MFPortfolioPageState();
}

class _MFPortfolioPageState extends State<MFPortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      pageTitle: 'Mutual Funds',
      navType: 'mf',
      widgetList: [
        // SmartFaceCamera(
        //   autoCapture: true,
        //   defaultCameraLens: CameraLens.front,
        //   message: 'Center your face in the square',
        //   onCapture: (File? image) {
        //     print(image);
        //   },
        // ),
        const SizedBox(
          height: 10,
        ),
        SectionTitle(title: 'My Portfolio'),
        const PortfolioBox(),
        const SizedBox(
          height: 10,
        ),
        const ExportFundBox(),
        SectionTitle(
          title: 'Mutual funds for portfolio',
          noTopPadding: true,
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
        const SizedBox(
          height: 10,
        ),
        SectionTitle(title: 'Transaction History'),
        const SizedBox(
          height: 5,
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              MFTransactionCard(),
              MFTransactionCard(),
              MFTransactionCard(),
              MFTransactionCard(),
              SizedBox(
                width: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PortfolioBox extends StatelessWidget {
  const PortfolioBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: double.infinity,
      //r height: 100,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffDAE9FF), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xffF1F7FF),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Portfolio',
                style: TextStyle(
                  fontSize: utils.vw(4, context),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Value',
                    style: styles.InfoLabelHeader(),
                  ),
                  Text(
                    '₹7,06,703.71',
                    style: styles.InfoLabelTitle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Invested Amount',
                    style: styles.InfoLabelHeader(),
                  ),
                  Text(
                    '₹7,06,703.71',
                    style: styles.InfoLabelTitle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Gain & Loss',
                    style: styles.InfoLabelHeader(),
                  ),
                  Text(
                    '▲ ₹7,47,520.00 (7.664%)',
                    style: styles.InfoLabelTitle(
                      color: Color(0xff269F00),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExportFundBox extends StatefulWidget {
  const ExportFundBox({super.key});

  @override
  State<ExportFundBox> createState() => _ExportFundBoxState();
}

class _ExportFundBoxState extends State<ExportFundBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Container(
        //height: 100,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color(0xffE3E3F3),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(100, 100, 111, 0.1),
              blurRadius: 15,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/import-mf.svg',
                  width: 80,
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Import Your External',
                        style: styles.miniTitleStyle(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                          'Manage all your mutual funds \nin one application')
                    ],
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              'assets/icons/arrow-right.svg',
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
