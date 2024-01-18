import 'package:flutter/material.dart';
import '../styles/styles.dart' as styles;
import '../utils/utils.dart' as utils;

class SectionTitle extends StatelessWidget {
  String title;
  bool? noTopPadding;
  SectionTitle({super.key, required this.title, this.noTopPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, noTopPadding == true ? 0 : 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: styles.sectionTitleStyle(),
          )
        ],
      ),
    );
  }
}

class MegaTitle extends StatelessWidget {
  String title;
  bool? noTopPadding;
  MegaTitle({super.key, required this.title, this.noTopPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, noTopPadding == true ? 0 : 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: styles.megaTitleStyle(),
          )
        ],
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  String text;
  SectionText({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              text,
              style: styles.sectionTextStyle(),
            ),
          )
        ],
      ),
    );
  }
}

class PopupText extends StatelessWidget {
  String text;
  PopupText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: utils.vw(3.8, context), fontFamily: 'RobotoCondensed'),
    );
  }
}

class PopupLabel extends StatelessWidget {
  String label;
  PopupLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: utils.vw(3.2, context),
        color: Color(0xffB2B2B2),
      ),
    );
  }
}
