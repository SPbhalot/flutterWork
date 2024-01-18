import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/widgets/master.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../utils/utils.dart' as utils;
import '../../styles/styles.dart' as styles;

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<Map> slides = [
    {
      "image": "assets/illustrations/powerhouse.svg",
      "title": "Keep your budget on track with smart analytics",
      "desc":
          "Get a clear view of your spendings, know exactly where your money is going",
    },
    {
      "image": "assets/illustrations/paperless.svg",
      "title": "Keep your budget on track with smart analytics",
      "desc":
          "Get a clear view of your spendings, know exactly where your money is going",
    },
    {
      "image": "assets/illustrations/path.svg",
      "title": "Keep your budget on track with smart analytics",
      "desc":
          "Get a clear view of your spendings, know exactly where your money is going",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Container(
        // color: Colors.pink,
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 35),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                //enlargeFactor: 0,
                aspectRatio: 0.7,
                viewportFraction: 1,
              ),
              items: [
                ...slides.map(
                  (e) {
                    // print(e['imager']);
                    return Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          //  color: Colors.green,
                          width: double.infinity,
                          height: utils.vh(30, context),
                          //color: Colors.pink,
                          child: SvgPicture.asset(
                            e['image'],
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          e['title'],
                          style: styles.megaTitleStyle(),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          e['desc'],
                          style: styles.sectionTextStyle(),
                        ),
                      ],
                    );
                  },
                ).toList()
              ],
            ),
            IntroButton(
              isGradient: false,
              label: "Let's Get Started!",
              callback: () {
                context.go('/auth');
                //print('object');
              },
            )
          ],
        ),
      ),
    );
  }
}
