import 'package:flutter/material.dart';
import 'package:heytorus/widgets/titles.dart';

class Indices extends StatefulWidget {
  const Indices({super.key});

  @override
  State<Indices> createState() => _IndicesState();
}

class _IndicesState extends State<Indices> {
  List<Map> indices = [{}, {}, {}];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'Indices',
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          // color: Colors.yellow,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Index(
                  isHigh: true,
                ),
                Index(
                  isHigh: false,
                ),
                Index(
                  isHigh: true,
                ),
                Index(
                  isHigh: true,
                ),
                Index(
                  isHigh: false,
                ),
                Index(
                  isHigh: true,
                ),
                Index(
                  isHigh: true,
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Index extends StatefulWidget {
  bool isHigh;
  Index({super.key, required this.isHigh});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.fromLTRB(0, 20, 15, 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        // border: Border(
        //   bottom: BorderSide(
        //     width: 2,
        //     color: Colors.yellow,
        //   ),
        // ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(100, 100, 111, 0.1),
            blurRadius: 15,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 5,
              color: widget.isHigh == true
                  ? const Color(0xff29AD00)
                  : const Color(0xffc43a4b),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nifty'.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 19,
                color: Color(0xff767676),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              '₹17,057.30'.toUpperCase(),
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 17, fontFamily: 'RobotoCondensed'),
            ),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              // color: Colors.green,
              width: double.infinity,
              child: Text(
                '+1,059.20 (10.34%)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'RobotoCondensed',
                  color: widget.isHigh == true
                      ? const Color(0xff29AD00)
                      : const Color(0xffc43a4b),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
