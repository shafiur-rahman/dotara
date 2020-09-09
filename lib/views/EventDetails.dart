

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotara/values/ColorsLocal.dart';
import 'package:dotara/view_models/EventDetailsVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../ThemeController.dart';

class EventDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context).settings.arguments;
    var eventId = json.decode(arguments)['event_id'];

    return ChangeNotifierProvider(
      create: (_) {
        return EventDetailsVM(context, eventId);
      },
      child: Consumer<EventDetailsVM>(builder: (context, snapshot, _) {
        return Scaffold(
          appBar: PreferredSize(
              child: AppBar(
                elevation: 0.0,
              ),
              preferredSize: Size.fromHeight(0.0)),
          body: _getBody(context, snapshot),
          bottomNavigationBar: BottomAppBar(
            child: InkWell(
              onTap: () {
             //   Navigator.pushNamed(context, PaymentMethodRoute);
              },
              child: Container(
                height: snapshot.detailsLoaded ? 60 : 0,
                child: snapshot.detailsLoaded
                    ? Container(
                  decoration: BoxDecoration(
                    color: ColorsLocal.hexToColor("E04922"),
                  ),
                  child: Center(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.assignment,
                            size: 20,
                            color: ThemeController.getTextColor(),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Book Ticket Now",
                            style: TextStyle(
                                fontFamily:
                                ThemeController.getFontFamily(),
                                color: ThemeController.getTextColor(),
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                )
                    : Container(),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _getBody(BuildContext context, EventDetailsVM snapshot) {
    if (snapshot.detailsLoaded) {
      return Container(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        child: CachedNetworkImage(
                          imageUrl:
                          '${snapshot.eventDetails['banner_url'].toString()}',
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              //borderRadius: BorderRadius.circular(10),
//                              border: Border.all(
//                                width: 1,
//                                color: Colors.grey[600].withOpacity(.3),
//                              ),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Shimmer.fromColors(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                //borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[300],
                              ),
                            ),
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.white,
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(36, 24, 36, 24),
                        child: Text(
                          snapshot.eventDetails['description'].toString(),
                          style: TextStyle(
                              fontFamily: ThemeController.getFontFamily(),
                              fontSize: 12,
                              color: ThemeController.getTextColor()
                                  .withOpacity(0.8),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(36, 12, 36, 0),
                        child: Text(
                          "Schedule",
                          style: TextStyle(
                              fontFamily: ThemeController.getFontFamily(),
                              fontSize: 20,
                              color: ThemeController.getTextColor()
                                  .withOpacity(0.8),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(36, 4, 36, 24),
                        child: PhysicalModel(
                          color: Colors.transparent,
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                            decoration: BoxDecoration(
                              color: Colors.grey[50].withOpacity(0.1),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      snapshot.eventDetails['schedule']
                                          .toString(),
                                      style: TextStyle(
                                          fontFamily:
                                          ThemeController.getFontFamily(),
                                          fontSize: 16,
                                          color: ThemeController.getTextColor(),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100].withOpacity(0.1),
                                  ),
                                  child: Icon(
                                    Icons.calendar_today,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                //margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                padding: EdgeInsets.fromLTRB(24, 24, 24, 16),

                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[600].withOpacity(0.3),
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: Colors.grey[600].withOpacity(0.3),
                            )),
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.arrow_back,
                          color: ThemeController.getTextColor(),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[600].withOpacity(0.3),
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: Colors.grey[600].withOpacity(0.3),
                            )),
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.menu,
                          color: ThemeController.getTextColor(),
                        ),
                      ),
                      onTap: () {
                      //  Navigator.pushNamed(context, MenuRoute);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    } else {
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
}
