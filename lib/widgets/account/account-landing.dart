import 'package:flutter/material.dart';
import 'package:heytorus/layouts/default.dart';
import '../../styles/styles.dart' as styles;

class AccountLandingPage extends StatefulWidget {
  const AccountLandingPage({super.key});

  @override
  State<AccountLandingPage> createState() => _AccountLandingPageState();
}

class _AccountLandingPageState extends State<AccountLandingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      navType: 'null',
      pageTitle: 'Account',
      widgetList: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      width: 75,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: styles.miniTitleStyle(),
                      ),
                      Text(
                        'KYC - Investment Ready',
                        style: styles.sectionTextStyle(),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
