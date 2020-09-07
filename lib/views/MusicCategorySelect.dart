import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicCategorySelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildGenre() {
      List<Widget> items = new List();
      for (int i = 0; i < 10; i++) {
        Widget item = Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Google $i",
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
        items.add(item);
      }
      return items;
    }

    return Scaffold(
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
              Container(
                child: Wrap(children: _buildGenre()),
              )
            ],
          ),
        )));
  }
}
