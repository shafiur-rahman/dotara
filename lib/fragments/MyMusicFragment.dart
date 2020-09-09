
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotara/view_models/MyMusicVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../ThemeController.dart';
import '../ViewModelController.dart';

class MyMusicFragment extends StatelessWidget {
  MyMusicVm myMusicVm;

  Future<void> _onRefresh() async {
    myMusicVm.loadSongList();
    await Future.delayed(Duration(seconds: 1));
    return 'success';
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildStep1() => Container(
      padding: EdgeInsets.fromLTRB(24, 20, 12, 16),
      child: Row(
        children: [
          // InkWell(
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: Colors.grey[600].withOpacity(0.3),
          //         shape: BoxShape.circle,
          //         border: Border.all(
          //           width: 1,
          //           color: Colors.grey[600].withOpacity(0.3),
          //         )
          //     ),
          //     padding: EdgeInsets.all(8),
          //     child: Visibility(
          //
          //       child: Icon(
          //         Icons.arrow_back,
          //         color: ThemeController.getTextColor(),
          //       ),
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 12, right: 12),
              child: Text(
                "My Music",
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
            child: Container(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.menu,
                color: ThemeController.getTextColor(),
              ),
            ),
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              //Navigator.pushNamed(context, MenuRoute);
            },
          ),
        ],
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: ViewModelController.getMyMusicFragmentVM(context))
      ],
      child: Scaffold(
        extendBody: true,
        body: Consumer<MyMusicVm>(builder: (context, snapshot, _) {
          if (snapshot.songLoaded) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildStep1(),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(bottom: 30),
                        // color: Colors.blue,
                        child: ListView.builder(
                            itemCount: snapshot.song.length,
                            itemBuilder: (BuildContext context, int i) {
                              return Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 30),
                                          height: 60,
                                          // color: Colors.green,
                                          child: Container(
                                            width: 60,
                                            child: CachedNetworkImage(
                                              imageUrl: snapshot.song[i]
                                              ['image_url']
                                                  .toString()
                                                  .toString(),
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
//                                          borderRadius: BorderRadius.only(
//                                            topLeft: Radius.zero,
//                                            topRight: Radius.zero,
//                                            bottomLeft: Radius.circular(5.0),
//                                            bottomRight: Radius.circular(5.0),
//                                          ),
                                                      image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                              placeholder: (context, url) =>
                                                  Shimmer.fromColors(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.rectangle,
                                                        color: Colors.grey[300],
//                                            borderRadius: BorderRadius.only(
//                                              topLeft: Radius.zero,
//                                              topRight: Radius.zero,
//                                              bottomLeft: Radius.circular(5.0),
//                                              bottomRight: Radius.circular(5.0),
//                                            ),
                                                      ),
                                                    ),
                                                    baseColor: Colors.grey[300],
                                                    highlightColor: Colors.white,
                                                  ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                  Icon(
                                                    Icons.error,
                                                    size: 32,
                                                    color: Colors.grey,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 22),
                                          child: Text(
                                            snapshot.song[i]["name"],
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(.8),
                                                fontFamily: "BalooDa2",
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.white.withOpacity(.2),
                                    )
                                  ],
                                ),
                              );
                            })),
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
        }),
      ),
    );
  }




}
