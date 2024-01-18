import 'package:flutter/material.dart';
import 'package:heytorus/widgets/app-bar.dart';
import 'package:heytorus/widgets/bottom-navigation-bar.dart';
import '../utils/utils.dart' as utils;

class DefaultLayout extends StatefulWidget {
  List<Widget> widgetList;
  String pageTitle;
  String navType;
  Color? bgColor;
  DefaultLayout({
    super.key,
    this.bgColor,
    required this.widgetList,
    required this.pageTitle,
    required this.navType,
  });

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(utils.vh(6, context)),
        child: MainAppBar(title: widget.pageTitle),
      ),
      backgroundColor: widget.bgColor ?? const Color.fromRGBO(255, 255, 255, 1),
      bottomNavigationBar: widget.navType != 'null'
          ? TorusBottomNaviagtionBar(
              type: widget.navType,
            )
          : null,
      body: Row(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, utils.vh(12, context), 0, 20),
              width: MediaQuery.of(context).size.width,
              // height: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...widget.widgetList,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
