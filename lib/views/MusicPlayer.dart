

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotara/values/ColorsLocal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seekbar/seekbar.dart';
import 'package:shimmer/shimmer.dart';

import '../ThemeController.dart';
import '../ViewModelController.dart';
import 'MusicPlayerVM.dart';

class MusicPlayer extends StatelessWidget {
  var arguments;
  int songId;
  String song_thumb;
  MusicPlayerVM musicPlayerVM;

  MusicPlayer(this.arguments) {
    songId = arguments["song_id"];
    song_thumb = arguments["song_thumb"];

    musicPlayerVM = ViewModelController.getMusicPlayerVM();
    musicPlayerVM.initController(arguments);
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildBar() => Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
        child: Row(
          children: [
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[600].withOpacity(0.2),
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: Colors.grey[600].withOpacity(0.3),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: ThemeController.getTextColor()
                              .withOpacity(0.1),
                          spreadRadius: .1,
                          blurRadius: 16)
                    ]),
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.arrow_back,
                  color: ThemeController.getTextColor(),
                  size: 18,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
    Widget _musicPlayer(BuildContext context, MusicPlayerVM snapshot) =>
        Container(
          height: 120,
          color: ThemeController.getBottomAppBarColor(),
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        snapshot.durationToHms(
                            Duration(seconds: snapshot.mediaPosition)),
                        style: TextStyle(
                            fontFamily: ThemeController.getFontFamily(),
                            color: ThemeController.getTextColor(),
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        snapshot.durationToHms(
                            Duration(seconds: snapshot.mediaDuration)),
                        style: TextStyle(
                            fontFamily: ThemeController.getFontFamily(),
                            color: ThemeController.getTextColor(),
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Center(
                    child: SeekBar(
                      value: snapshot.getProgress() / 100,
                      secondValue: 0,
                      progressWidth: 2,
                      thumbRadius: 4,
                      barColor: Colors.grey[200],
                      progressColor: Colors.orange,
                      secondProgressColor: Colors.orange.withOpacity(0.3),
                      onProgressChanged: (value) {
                        snapshot.seekTo(value);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: ThemeController.getBottomAppBarColor(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Icon(
                            Icons.shuffle,
                            color: Colors.white.withOpacity(.7),
                          ),
                        ),
                        Container(
                          child: Icon(
                            Icons.fast_rewind,
                            color: Colors.white.withOpacity(.7),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
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
                              color: ColorsLocal.hexToColor("D9DEE7"),
                            ),
                            child: Icon(
                              snapshot.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          onTap: () {
                            if (snapshot.isPlaying) {
                              snapshot.pause();
                            } else {
                              snapshot.play();
                            }
                          },
                        ),
                        Container(
                          child: Icon(
                            Icons.fast_forward,
                            color: Colors.white.withOpacity(.7),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.repeat_one,
                              color: Colors.white.withOpacity(.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: musicPlayerVM,
        )
      ],
      child: Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              elevation: 0.0,
            ),
            preferredSize: Size.fromHeight(0.0)),
        bottomNavigationBar:
        Consumer<MusicPlayerVM>(builder: (context, snapshot, _) {
          return BottomAppBar(
            child: _musicPlayer(context, snapshot),
          );
        }),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                      height: MediaQuery.of(context).size.height * .55,
                      width: MediaQuery.of(context).size.width - 85,
                      child: Column(
                        children: [
                          Expanded(child: Consumer<MusicPlayerVM>(
                              builder: (context, musicPlayerVM, _) {
                                return Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(18)),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                        arguments["song_thumb"].toString(),
                                        imageBuilder: (context, imageProvider) =>
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(18),
                                                  topRight: Radius.circular(18),
                                                  bottomLeft: Radius.circular(0.0),
                                                  bottomRight: Radius.circular(0.0),
                                                ),
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color: Colors.grey[300],
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(18),
                                                    topRight: Radius.circular(18),
                                                    bottomLeft: Radius.circular(0.0),
                                                    bottomRight: Radius.circular(0.0),
                                                  ),
                                                ),
                                              ),
                                              baseColor: Colors.grey[300],
                                              highlightColor: Colors.white,
                                            ),
                                        errorWidget: (context, url, error) => Icon(
                                          Icons.error,
                                          size: 32,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
//                                musicPlayerVM.buffering ||
//                                        !musicPlayerVM.playerInitialized
//                                    ? Positioned(
//                                        left: 0,
//                                        right: 0,
//                                        bottom: 0,
//                                        top: 0,
//                                        child: Stack(
//                                          children: [
//                                            Container(
//                                              decoration: BoxDecoration(
//                                                borderRadius: BorderRadius.only(
//                                                  topLeft: Radius.circular(10),
//                                                  topRight: Radius.circular(10),
//                                                ),
//                                                color: Colors.white
//                                                    .withOpacity(0.9),
//                                              ),
//                                            ),
//                                            Container(
//                                              child: Center(
//                                                  child:
//                                                      CupertinoActivityIndicator()),
//                                            )
//                                          ],
//                                        ),
//                                      )
//                                    : Container()
                                  ],
                                );
                              })),
                          Container(
                            height: MediaQuery.of(context).size.height * .5 -
                                MediaQuery.of(context).size.height * .42,
                            decoration: BoxDecoration(
                              //color: ColorsLocal.hexToColor("1A1C20"),
                                color: ThemeController.getBottomAppBarColor(),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.zero,
                                    topLeft: Radius.zero,
                                    bottomLeft: Radius.circular(18),
                                    bottomRight: Radius.circular(18))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.favorite_border,
                                        color: Colors.white.withOpacity(.8),
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Loved by 3.6M+",
                                        style: TextStyle(
                                            color: Colors.white.withOpacity(.8),
                                            fontFamily: "BalooDa2",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 8),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.white.withOpacity(.8),
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(
                    arguments["song_name"].toString(),
                    style: TextStyle(
                        color: Colors.white.withOpacity(.8),
                        fontFamily: "BalooDa2",
                        fontWeight: FontWeight.w600,
                        fontSize: 32),
                  ),
                  Text(
                    arguments["album_name"].toString(),
                    style: TextStyle(
                        color: Colors.white.withOpacity(.5),
                        fontFamily: "BalooDa2",
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            _buildBar(),
          ],
        ),
      ),
    );
  }
}
