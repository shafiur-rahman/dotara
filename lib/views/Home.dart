

import 'package:dotara/values/ColorsLocal.dart';
import 'package:dotara/view_models/HomeVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return HomeVM(context);
          },
        )
      ],
      child: Scaffold(
        appBar: PreferredSize(child: AppBar(
          elevation: 0.0,
        ), preferredSize: Size.fromHeight(0.0)
        ),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Consumer<HomeVM>(builder: (context, snapshot, _) {
          return InkWell(
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
              decoration: BoxDecoration(
                  gradient:
                  LinearGradient(
                      colors: [
                        Color(0xffE0330D).withOpacity(1),
                        Color(0xffFFA756).withOpacity(1)
                      ],
//                  begin: const FractionalOffset(3, 0.0),
//                  end: const FractionalOffset(.2, 0.0),
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),

                  shape: BoxShape.circle,
                  color: snapshot.navbarIndex == 2
                      ? ColorsLocal.button_color_pink
                      : ColorsLocal.hexToColor("D9DEE7"),
                  boxShadow: [
                    BoxShadow(
                      color: snapshot.navbarIndex == 2
                          ? ColorsLocal.hexToColor("FFBCD3").withOpacity(0.5)
                          : ColorsLocal.hexToColor("DCDCDC"),
                      blurRadius: 0,
                      spreadRadius: 0,
                    )
                  ]),
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
            onTap: () {
              snapshot.homeClicked();
            },
          );
        }),
        bottomNavigationBar: Consumer<HomeVM>(
          builder: (context, snapshot, _) {
            return BottomAppBar(
              clipBehavior: Clip.antiAlias,
              notchMargin: 5.0,
            color: ColorsLocal.hexToColor("1E2025"),
              elevation: 8,
              child: Container(
                height: 80,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: snapshot.getNavbarItems(),
                ),
              ),
              shape: CircularNotchedRectangle(),
            );
          },
        ),
        body: Consumer<HomeVM>(
          builder: (context, snapshot, _) {
            return snapshot.getHomeContent();
          },
        ),
      ),
    );
  }
}
