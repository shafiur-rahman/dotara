

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotara/constants/RoutingConstants.dart';
import 'package:dotara/view_models/EventFragmentVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../ThemeController.dart';
import '../ViewModelController.dart';

class EventFragment extends StatelessWidget {

  double minBannerWidth = 100;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ViewModelController.getEventFragmentVM(context),
      child: Consumer<EventFragmentVM>(
          builder: (context, snapshot, _) {
            return Scaffold(
              appBar: PreferredSize(child: AppBar(
                elevation: 0.0,
              ), preferredSize: Size.fromHeight(0.0)
              ),
              body: _getBody(context, snapshot),
            );
          }
      ),
    );
  }

  Widget _getBody(BuildContext context, EventFragmentVM snapshot) {
    if(snapshot.eventLoaded) {
      return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                //margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                padding: EdgeInsets.fromLTRB(24, 24, 12, 16),

                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[600].withOpacity(0.3),
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: Colors.grey[600].withOpacity(0.3),
                          )
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.music_note,
                        color: ThemeController.getTextColor(),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 12, right: 12),
                        child: Text(
                          "Broadcast",
                          style: TextStyle(
                              fontFamily: ThemeController.getFontFamily(),
                              color: ThemeController.getTextColor(),
                              fontWeight: FontWeight.w600,
                              fontSize: 28
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.menu,
                          color: ThemeController.getTextColor(),
                        ),
                      ),
                      onTap: () {
                       // Navigator.pushNamed(context, MenuRoute);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                        child: Text(
                          "Enjoy The Live Music",
                          style: TextStyle(
                            fontFamily: ThemeController.getFontFamily(),
                            color: ThemeController.getTextColor(),
                            fontWeight: FontWeight.w400,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                        margin: EdgeInsets.fromLTRB(0, 16, 0, 120),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: List.generate(snapshot.events.length, (index) {
                            return Container(
                              child:InkWell(
                                child: Container(
                                  width: _getBannerWidth(context),
                                  height: _getBannerWidth(context)*(4/3),
                                  child: CachedNetworkImage(
                                    imageUrl:'${snapshot.events[index]['banner_url'].toString()}',
                                    imageBuilder: (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.grey[600].withOpacity(.3),
                                        ),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill
                                          ,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Shimmer.fromColors(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      baseColor: Colors.grey[300],
                                      highlightColor: Colors.white,
                                    ),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, EventDetailsRoute, arguments: json.encode({"event_id": snapshot.events[index]['event_id']}));
                                },
                              ),

                            );
                          }),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
      );
    }
    else {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      );
    }
  }

  int _getRowCount(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double availableWidth = totalWidth - 48;

    int rowCount = availableWidth ~/ (minBannerWidth + 10);

    return rowCount;
  }

  double _getBannerWidth(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double availableWidth = totalWidth - 48;

    int rowCount = _getRowCount(context);
    double totalVerticalSpacing = (rowCount - 1) * 10.toDouble();
    double availableWidthWithoutSpacing = availableWidth - totalVerticalSpacing;

    return availableWidthWithoutSpacing / rowCount;
  }

}
