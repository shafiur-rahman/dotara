import 'package:dotara/constants/RoutingConstants.dart';
import 'package:dotara/values/ColorsLocal.dart';
import 'package:dotara/view_models/MusicCategorySelectVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class MusicCategorySelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildGenre(
        BuildContext context, MusicCatergorySelectVM snapshot) {
      List<Widget> items = new List();
      if (snapshot.musicListLoaded) {
        for (int i = 0; i < snapshot.genreSelect.length; i++) {
          Widget item = Container(
              margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.white.withOpacity(.2), width: 1),
                  borderRadius: BorderRadius.circular(30),
                  color: snapshot.isSelected(snapshot.genreSelect[i]["id"])
                      ? ColorsLocal.hexToColor("C4C4C4").withOpacity(.2)
                      : null,
                  boxShadow: [
                    snapshot.isSelected(snapshot.genreSelect[i]["id"])
                        ? BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 1), // changes position of shadow
                          )
                        : BoxShadow(
                            color: Colors.grey.withOpacity(0),
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: Offset(0, 0), // changes position of shadow
                          )
                  ]),
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: GestureDetector(
                  onTap: () {
                    snapshot.toggleSelection(snapshot.genreSelect[i]["id"]);
                  },
                  child: GradientText(
                    snapshot.genreSelect[i]["name"],
                    gradient: snapshot.isSelected(snapshot.genreSelect[i]["id"])
                        ? ColorsLocal.gradient1
                        : ColorsLocal.gradient2,
                    style: TextStyle(
                      fontSize: 18,
                      shadows: [
                        Shadow(
                            color: Colors.black26,
                            offset: Offset(0, 3),
                            blurRadius: 3)
                      ],
                      fontFamily: "BalooDa2",
                      fontWeight: FontWeight.w600,
                    ),

                    // Text(
                    //   snapshot.genreSelect[i]["name"],
                    //   style: TextStyle(
                    //     //  height: 1,
                    //       //color: ColorsLocal.hexToColor("757575"),
                    //       fontFamily: "BalooDa2",
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: 32,
                    //   foreground: Paint()..shader = ColorsLocal.linearGradient),
                    // ),
                  ),
                ),
              ));
          items.add(item);
        }
      } else {
        for (int i = 0; i < 10; i++) {
          Widget item = Container(
            child: Shimmer.fromColors(
                child: Container(
                  height: 32,
                  width: 72 + ((i % 2) * 20).toDouble(),
                  margin: EdgeInsets.fromLTRB(0, 0, 12, 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                baseColor: Colors.grey[300],
                highlightColor: Colors.white),
          );
          items.add(item);
        }
      }

      return items;
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return MusicCatergorySelectVM(context);
          },
        )
      ],
      child: Scaffold(
          bottomNavigationBar: Consumer<MusicCatergorySelectVM>(

            builder: (context, snapshot,_) {
              return BottomAppBar(
                color: ColorsLocal.hexToColor("1C1E22"),
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
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 25),
                  width: double.infinity,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      //side: BorderSide(color: Colors.white, width: 0)
                    ),
                    clipBehavior: Clip.antiAlias,
                    onPressed: () {
                      snapshot.saveFavoriteGenre();
                      // Toast.show("GG", context);
                       Navigator.pushNamed(context, HomeRoute);
                    },
                    child: Text(
                      "Lets Play Dotara",
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
              );
            }
          ),
          appBar: PreferredSize(
              child: AppBar(
                elevation: 0.0,
              ),
              preferredSize: Size.fromHeight(0.0)),
          body: SingleChildScrollView(
              child: Container(
            margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Choose The",
                  style: TextStyle(
                      height: 1,
                      color: Colors.white,
                      fontFamily: "BalooDa2",
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
                Text(
                  "Music You Like",
                  style: TextStyle(
                      height: 1,
                      color: Colors.white,
                      fontFamily: "BalooDa2",
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "we will set Dotara based on your music preference",
                    style: TextStyle(
                        height: 1,
                        color: Colors.white.withOpacity(.6),
                        fontFamily: "BalooDa2",
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                Consumer<MusicCatergorySelectVM>(
                    builder: (context, snapshot, _) {
                  return Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Wrap(children: _buildGenre(context, snapshot)),
                  );
                })
              ],
            ),
          ))),
    );
  }
}
