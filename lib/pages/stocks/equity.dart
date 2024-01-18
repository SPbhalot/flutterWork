import 'package:flutter/material.dart';
import 'package:heytorus/layouts/default.dart';

class EquityPage extends StatefulWidget {
  const EquityPage({super.key});
  @override
  State<EquityPage> createState() => _EquityPageState();
}

class _EquityPageState extends State<EquityPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      pageTitle: 'Equity',
      navType: 'stocks',
      widgetList: const [
        StockListing(),
      ],
    );
  }
}

class StockListing extends StatefulWidget {
  const StockListing({super.key});

  @override
  State<StockListing> createState() => _StockListingState();
}

class _StockListingState extends State<StockListing> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0xfff2f2f2),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Stocks',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff0E4083),
                  ),
                ),
                Text(
                  'Change',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff0E4083),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(100, 100, 111, 0.1),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 30,
              padding: const EdgeInsets.all(0),
              clipBehavior: Clip.hardEdge,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: const Color(0xffcccccc),
                          width: (index == 29) ? 0 : 0.5),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tata Motors'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('BSE'.toUpperCase()),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '₹3251.00',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'RobotoCondensed',
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '22.62 (0.23%)',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'RobotoCondensed',
                              color: Color(0xff29AD00),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
