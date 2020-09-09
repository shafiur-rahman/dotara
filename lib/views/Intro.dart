import 'package:dotara/constants/RoutingConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            elevation: 0.0,
          ),
          preferredSize: Size.fromHeight(0.0)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                  margin: EdgeInsets.fromLTRB(20, 100, 20, 0),
                  height: MediaQuery.of(context).size.height * .4,

                  width: MediaQuery.of(context).size.height * .4,
                 // color: Colors.green,
                  child: Image.asset("assets/images/listening_music.png")),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  "Listening and Watching",
                  style: TextStyle(
                      height: 1,
                      color: Colors.white,
                      fontFamily: "BalooDa2",
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
              ),
            ),
            Center(
              child: Text(
                "Anytime, Anywhere",
                style: TextStyle(
                    height: 1,
                    color: Colors.white,
                    fontFamily: "BalooDa2",
                    fontWeight: FontWeight.w600,
                    fontSize: 30),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  "The artist we are represent are one of the",
                  style: TextStyle(
                      height: 1,
                      color: Colors.white.withOpacity(.6),
                      fontFamily: "BalooDa2",
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ),
            ),
            Center(
              child: Text(
                "most successful in Bangladesh",
                style: TextStyle(
                    height: 1,
                    color: Colors.white.withOpacity(.6),
                    fontFamily: "BalooDa2",
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
            ),
            Center(
              child: Text(
                "and also were a huge breakthrough",
                style: TextStyle(
                    height: 1,
                    color: Colors.white.withOpacity(.6),
                    fontFamily: "BalooDa2",
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, MusicCategorySelectRoute);
              },
              child: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Center(child: Icon(Icons.navigate_next_outlined,color: Colors.white.withOpacity(1),size: 30,),)),
            )
          ],
        ),
      ),
    );
  }
}
