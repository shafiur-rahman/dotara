import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotara/constants/RoutingConstants.dart';
import 'package:dotara/values/ColorsLocal.dart';
import 'package:dotara/view_models/SplashVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return SplashVM(context);
          },
        )
      ],
      child: Consumer<SplashVM>(builder: (context, snapshot, _) {
        return Scaffold(
          appBar: PreferredSize(
              child: AppBar(
                elevation: 0.0,
              ),
              preferredSize: Size.fromHeight(0.0)),
          body: buildCover(context, snapshot),
        );
      }),
    );
  }

  Widget buildCover(BuildContext context, SplashVM snapshot) {
    Widget _singIn() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
              width: double.infinity,
              child: MaterialButton(
                color: ColorsLocal.hexToColor("3C5A95"),
                clipBehavior: Clip.antiAlias,
                onPressed: () async {
                  // snapshot.signInFacebook().then((value) => Navigator.pushReplacementNamed(context, HomeRoute));
                  Navigator.pushReplacementNamed(context, HomeRoute);
                },
                child: Text(
                  "Sign up with facebook",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "BalooDa2",
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.0),
//                      side: BorderSide(color: Colors.white, width: 2)
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 18, 25, 42),
              width: double.infinity,
              child: MaterialButton(
                color: Colors.white,
                clipBehavior: Clip.antiAlias,
                onPressed: () {
                  Navigator.pushNamed(context, HomeRoute);
                },
                child: Text(
                  "Sign up with google",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "BalooDa2",
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.0),
//                      side: BorderSide(color: Colors.white, width: 2)
                ),
              ),
            ),
          ],
        );
    return Stack(
      children: [
//          Text(snapshot.bandInfo["band_name"].toString()),
//        CachedNetworkImage(
//          height: MediaQuery.of(context).size.height,
//          width: MediaQuery.of(context).size.width,
//          fit: BoxFit.fill,
//          imageUrl: snapshot.bandInfo["cover_pic"],
//        ),
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/splash.png",
              fit: BoxFit.cover,
            )),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xff22252A).withOpacity(0),
                  Color(0xff22252A).withOpacity(1)
                ],
//                  begin: const FractionalOffset(3, 0.0),
//                  end: const FractionalOffset(.2, 0.0),
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 120),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/dotara_splash.png",
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * .15,
                width: MediaQuery.of(context).size.width - 100,
              ),
              Text(
                "The artist we present are one of the",
                style: TextStyle(
                    color: Colors.white.withOpacity(.8),
                    fontFamily: "BalooDa2",
                    fontWeight: FontWeight.w100,
                    fontSize: 18),
              ),
              Text(
                "most successful in Bangladesh",
                style: TextStyle(
                    color: Colors.white.withOpacity(.8),
                    fontFamily: "BalooDa2",
                    fontWeight: FontWeight.w100,
                    fontSize: 18),
              ),
            ],
          )),
        ),
        // Center(
        //   child: CachedNetworkImage(
        //     height: MediaQuery.of(context).size.height * .2,
        //     width: MediaQuery.of(context).size.width * .4,
        //     fit: BoxFit.fill,
        //     imageUrl: snapshot.bandInfo["title"],
        //   ),
        // ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: snapshot.listenMusic,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    gradient: LinearGradient(
                        colors: [
                          Color(0xffE0330D).withOpacity(1),
                          Color(0xffFFA756).withOpacity(1)
                        ],
//                  begin: const FractionalOffset(3, 0.0),
//                  end: const FractionalOffset(.2, 0.0),
                        begin: FractionalOffset.centerLeft,
                        end: FractionalOffset.centerRight,
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  width: double.infinity,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      //side: BorderSide(color: Colors.white, width: 0)
                    ),
                    clipBehavior: Clip.antiAlias,
                    onPressed: () {
                      // Toast.show("GG", context);
                      Navigator.pushNamed(context, HomeRoute);
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "BalooDa2",
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    //color: Colors.transparent,
                    height: 50,
                  ),
                ),
              ),
              Visibility(
                visible: snapshot.signIn,
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 18, 25, 40),
                  width: double.infinity,
                  child: MaterialButton(
                    color: ColorsLocal.hexToColor("31353A"),
                    clipBehavior: Clip.antiAlias,
                    onPressed: () {
                      snapshot.pressed();
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "BalooDa2",
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      //side: BorderSide(color: Colors.white, width: 0)
                    ),
                  ),
                ),
              ),
              Visibility(visible: snapshot.signUp, child: _singIn()),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "By login or signup you accepts all terms and",
                      style: TextStyle(
                          color: Colors.white.withOpacity(.4),
                          fontFamily: "BalooDa2",
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                    Text(
                      "condition of DOTARA",
                      style: TextStyle(
                          color: Colors.white.withOpacity(.4),
                          fontFamily: "BalooDa2",
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
