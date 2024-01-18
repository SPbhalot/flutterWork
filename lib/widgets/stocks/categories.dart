import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/routes/routes.dart';

import '../titles.dart';

class StockCategories extends StatefulWidget {
  const StockCategories({super.key});

  @override
  State<StockCategories> createState() => _StockCategoriesState();
}

class _StockCategoriesState extends State<StockCategories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: 'Categories',
        ),
        Container(
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
              CategoryCard(
                asset: 'assets/icons/equity.svg',
                label: 'Equity',
                route: AppRoutes.home,
              ),
              CategoryCard(
                asset: 'assets/icons/equity.svg',
                label: 'Equity',
                route: AppRoutes.home,
              ),
              CategoryCard(
                asset: 'assets/icons/equity.svg',
                label: 'Equity',
                route: AppRoutes.home,
              ),
              CategoryCard(
                asset: 'assets/icons/equity.svg',
                label: 'Equity',
                route: AppRoutes.home,
              ),
              CategoryCard(
                asset: 'assets/icons/equity.svg',
                label: 'Equity',
                route: AppRoutes.home,
              ),
              CategoryCard(
                asset: 'assets/icons/equity.svg',
                label: 'Equity',
                route: AppRoutes.home,
              ),
              CategoryCard(
                asset: 'assets/icons/equity.svg',
                label: 'Equity',
                route: AppRoutes.home,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  String asset;
  String label;
  String route;
  CategoryCard({
    super.key,
    required this.asset,
    required this.label,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (route != null) {
          context.push(route);
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(100, 100, 111, 0.1),
              blurRadius: 15,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 15,
            // ),
            SvgPicture.asset(
              asset,
              width: 40,
              height: 40,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Color(0xff000000)),
            ),
          ],
        ),
      ),
    );
  }
}
