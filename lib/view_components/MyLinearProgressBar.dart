import 'package:dotara/values/ColorsLocal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLinearProgressBar {

  static Widget progressBar(double width, double progress, {double height = 6,
    bool gradient = true,
    double radius = 8,
    Color backgroundColor = const Color(0xFFEEEEEE),
    BoxBorder border
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor,
          border: border
      ),
      child: Row(
        children: [
          Container(
            height: height,
            width: (width*(progress/100)),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(radius),
              //color: ColorsLocal.getProgressColor(progress),
              gradient: gradient ? LinearGradient(
                colors: [Colors.orange, Colors.orange.withOpacity(0.1)],
                stops: [0.2, 1.0],
              ) :
              LinearGradient(
                colors: [Colors.orange, Colors.orange.withOpacity(0.1)],
                stops: [1.0, 1.0],
              ) ,
              //color: gradient ? Colors.transparent : ColorsLocal.getProgressColor(progress),
            ),
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }

}