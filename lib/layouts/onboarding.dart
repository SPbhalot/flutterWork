import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heytorus/bloc/master/master-bloc.dart';
import 'package:heytorus/bloc/master/master-state.dart';
import 'package:heytorus/widgets/kyc/aof.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../utils/utils.dart' as utils;

class OBLayout extends StatefulWidget {
  Widget widget;
  Color? bgColor;
  OBLayout({super.key, required this.widget, this.bgColor});

  @override
  State<OBLayout> createState() => _OBLayoutState();
}

class _OBLayoutState extends State<OBLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          color: widget.bgColor ?? Colors.white,
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [widget.widget, MainLoading()],
          ),
        ),
      ),
    );
  }
}

class KYCLayout extends StatefulWidget {
  Widget widget;
  KYCLayout({super.key, required this.widget});

  @override
  State<KYCLayout> createState() => _KYCLayoutState();
}

class _KYCLayoutState extends State<KYCLayout> {
  bool isFormVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              SingleChildScrollView(child: widget.widget),
              Positioned(
                left: 20,
                bottom: 20,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFormVisible = false;
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xfff1f1f1),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/edit.svg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isFormVisible,
                child: Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: const SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          PreviewAOFForm()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isFormVisible,
                child: Positioned(
                  right: 20,
                  top: 60,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFormVisible = false;
                      });
                    },
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: SvgPicture.string(
                          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64"><path data-name="layer1" fill="none" stroke="#202020" stroke-miterlimit="10" stroke-width="3" d="M41.999 20.002l-22 22m22 0L20 20" stroke-linejoin="round" stroke-linecap="round"></path></svg>'),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class MainLoading extends StatelessWidget {
  MainLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MasterBloc, MasterState>(
      builder: (context, state) {
        return Visibility(
          visible: mainMasterState.loading == true,
          child: Positioned(
            top: 0,
            left: 0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.8),
              ),
              child: Center(
                child: Container(
                  width: 50,
                  margin: EdgeInsets.fromLTRB(
                      0,
                      0,
                      utils.vw(
                        16,
                        context,
                      ),
                      0),
                  child: const LoadingIndicator(
                    indicatorType: Indicator.circleStrokeSpin,
                    colors: [
                      Color(0xff3F7ED3),
                    ],
                    strokeWidth: 4,
                    backgroundColor: Colors.transparent,
                    pathBackgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) => {},
    );
  }
}
