import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/services/auth-service.dart';
import 'package:heytorus/widgets/master.dart';
import '../utils/utils.dart' as utils;

class MainAppBar extends StatefulWidget {
  String title;
  MainAppBar({super.key, required this.title});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: utils.vw(
          GoRouter.of(context).routeInformationProvider.value.uri.toString() ==
                  '/'
              ? 0
              : 10,
          context),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: utils.vw(10, context),
          height: utils.vw(10, context),
          // color: Colors.pink,
          margin: EdgeInsets.fromLTRB(utils.vw(3, context), 0, 0, 0),
          child: SvgPicture.asset(
            'assets/icons/back.svg',
            fit: BoxFit.contain,
          ),
        ),
      ),
      centerTitle: false,
      automaticallyImplyLeading: false,
      titleSpacing: utils.vw(3, context),
      title: Text(
        widget.title,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.black,
          fontSize: utils.vw(5, context),
          fontWeight: FontWeight.w700,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        height: 120,
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0x00000000).withOpacity(0.11),
              offset: const Offset(0, 5),
              blurRadius: 8,
              spreadRadius: -3,
            )
          ],
        ),
        child: SizedBox(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                right: 20,
                bottom: utils.vh(1, context),
                child: GestureDetector(
                  onTap: () async {
                    try {
                      Map aP = await auth.logout();
                      if (aP['success'] == true) {
                        const SnackBar(
                          content: Text('Logged out successfully!'),
                        );
                        context.go('/auth');
                      } else {
                        const SnackBar(
                          content: Text('Unable to Logout'),
                        );
                      }
                    } catch (e) {
                      print(e);
                    }
                    // print('Do the Logout Here');
                  },
                  child: RoundedIcon(path: 'assets/icons/account.svg'),
                ),
              ),
              Positioned(
                right: 75,
                bottom: utils.vh(1, context),
                child: GestureDetector(
                  onTap: () async {
                    // print('B');
                  },
                  child: RoundedIcon(path: 'assets/icons/bell.svg'),
                ),
              ),
              // Positioned(
              //   right: 130,
              //   bottom: 15,
              //   child: RoundedIcon(path: 'assets/icons/search.svg'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
