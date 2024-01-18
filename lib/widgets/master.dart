import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/widgets/stocks/categories.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import '../../styles/styles.dart' as styles;
import '../utils/utils.dart' as utils;

class GridBlocks extends StatefulWidget {
  List<Map> cats = [];
  GridBlocks({super.key, required this.cats});

  @override
  State<GridBlocks> createState() => _GridBlocksState();
}

class _GridBlocksState extends State<GridBlocks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.yellow,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: GridView.count(
        padding: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          ...widget.cats.map((e) {
            return CategoryCard(
              asset: e['img'],
              label: e['label'],
              route: e['route'],
            );
          }).toList()
        ],
      ),
    );
  }
}

class IntroButton extends StatelessWidget {
  VoidCallback callback;
  String label;
  bool? isDisabled;
  bool isGradient;
  IntroButton(
      {super.key,
      required this.callback,
      required this.label,
      this.isDisabled,
      required this.isGradient});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          if (isDisabled == true) {
            return;
          }
          callback();
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          height: isGradient ? 60 : 45,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
            color: isGradient == false ? const Color(0xff3e7ed3) : null,
            gradient: isGradient == false
                ? null
                : const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xff002d6b),
                      Color(0xff3e7ed3),
                    ],
                  ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: isGradient == true ? 20 : 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedIcon extends StatelessWidget {
  String path;
  RoundedIcon({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 42,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xffECF2FB).withOpacity(1),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: SizedBox(
        height: 23,
        width: 23,
        child: SvgPicture.asset(
          path,
          colorFilter: const ColorFilter.mode(
            Color(0xff3C5BFA),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

class ShadowBox extends StatelessWidget {
  Widget child;
  Color? bgColor;
  bool? noMargin;
  bool? noPadding;
  ShadowBox(
      {super.key,
      required this.child,
      this.bgColor,
      this.noMargin,
      this.noPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      margin:
          noMargin == true ? null : const EdgeInsets.fromLTRB(20, 20, 20, 5),
      padding: noPadding == true
          ? const EdgeInsets.all(0)
          : const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: bgColor ?? Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(100, 100, 111, 0.1),
            blurRadius: 15,
            spreadRadius: 3,
          ),
        ],
      ),
      child: child,
    );
  }
}

class IllustrationCard extends StatelessWidget {
  String assetPath;
  String title;
  String desc;
  VoidCallback ctaAction;
  String ctaLabel;
  IllustrationCard({
    super.key,
    required this.assetPath,
    required this.title,
    required this.desc,
    required this.ctaAction,
    required this.ctaLabel,
  });

  @override
  Widget build(BuildContext context) {
    return ShadowBox(
      child: Column(
        children: [
          SvgPicture.asset(
            assetPath,
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: styles.miniTitleStyle(),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: styles.sectionTextStyle(textColor: const Color(0xff727682)),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200,
            child: IntroButton(
              callback: ctaAction,
              isGradient: false,
              label: ctaLabel,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class IntroButtonAlt extends StatelessWidget {
  final VoidCallback callback;
  String label;
  Color? backgroundColor;
  Color? textColor;
  bool? isDisabled;
  IntroButtonAlt({
    super.key,
    required this.callback,
    required this.label,
    this.isDisabled,
    this.textColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled == true ? 0.6 : 1,
      child: OutlinedButton(
        // clipBehavior: Clip.hardEdge,
        //focusNode: FocusNode(),
        statesController: MaterialStatesController(),
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor ?? const Color(0xff3F7ED3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: BorderSide(
            color: textColor ?? const Color(0xffffffff),
            width: 1,
          ),
        ),
        onPressed: () {
          if (isDisabled == true) {
            return;
          }

          callback();
        },
        child: Container(
          // clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          height: utils.vh(6, context),
          width: double.infinity,
          child: Text(
            label,
            style: TextStyle(
              fontSize: utils.vw(4, context),
              fontWeight: FontWeight.w800,
              color: textColor ?? const Color(0xffffffff),
            ),
          ),
        ),
      ),
    );
  }
}

class KYCPendingBadge extends StatefulWidget {
  const KYCPendingBadge({super.key});

  @override
  State<KYCPendingBadge> createState() => _KYCPendingBadgeState();
}

class _KYCPendingBadgeState extends State<KYCPendingBadge> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/kyc');
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xffE0F7FF),
              Color(0xffC0D4EF),
            ],
          ),
        ),
        width: double.infinity,
        height: utils.vh(8, context),
        child: Center(
          child: Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/kyc-gold.svg',
                      width: utils.vw(7, context),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Be investment ready',
                          style: TextStyle(
                            color: const Color(0xff3F7ED3),
                            fontWeight: FontWeight.w600,
                            fontSize: utils.vw(3.8, context),
                          ),
                        ),
                        Text(
                          'Complete your KYC to kickstart investments',
                          style: TextStyle(
                            color: const Color(0xff3F7ED3),
                            fontSize: utils.vw(2.9, context),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  'Start Now',
                  style: TextStyle(
                    color: const Color(0xff3F7ED3),
                    fontWeight: FontWeight.w600,
                    fontSize: utils.vw(3.5, context),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
