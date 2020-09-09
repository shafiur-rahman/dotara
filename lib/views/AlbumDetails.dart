


import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotara/constants/RoutingConstants.dart';
import 'package:dotara/values/ColorsLocal.dart';
import 'package:dotara/view_components/MyLinearProgressBar.dart';
import 'package:dotara/view_models/AlbumDetailsVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../ThemeController.dart';
import '../ViewModelController.dart';
import 'MusicPlayerVM.dart';

class AlbumDetails extends StatelessWidget {
  var arguments;
  int albumId;
  AlbumDetailsVM albumDetailsVM;

  AlbumDetails(this.arguments) {
    albumId = arguments["album_id"];
    albumDetailsVM = new AlbumDetailsVM(albumId);
  }

  @override
  Widget build(BuildContext context) {

    Widget _musicPlayer(BuildContext context, MusicPlayerVM musicPlayerVM) {
      if(musicPlayerVM.playerInitialized) {
        return Container(
          height: 75,
//          color: ThemeController.getBottomAppBarColor(),
          color: Colors.white,
          child: Container(
            child: Column(
              children: [
                MyLinearProgressBar.progressBar(
                    MediaQuery
                        .of(context)
                        .size
                        .width,
                    musicPlayerVM.getProgress(),
                    gradient: false,
                    backgroundColor: Colors.white,
                    height: 2),
                Expanded(
                  child: Container(
                    color: ThemeController.getBottomAppBarColor(),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 25, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                child: CachedNetworkImage(
                                  imageUrl: musicPlayerVM.song['song_thumb'].toString()
                                      .toString()
                                      .toString(),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(
                                              10),
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
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        baseColor: Colors.grey[300],
                                        highlightColor: Colors.white,
                                      ),
                                  errorWidget: (context, url, error) =>
                                      Icon(
                                        Icons.error,
                                        size: 32,
                                        color: Colors.grey,
                                      ),
                                ),
                                height: 56,
                                width: 56,
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      musicPlayerVM.song['song_name'].toString(),
                                      style: TextStyle(
                                          color: ColorsLocal.hexToColor(
                                              "FFA756")
                                              .withOpacity(.8),
                                          fontFamily: "BalooDa2",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      musicPlayerVM.song['album_name'].toString(),
                                      style: TextStyle(
                                          color: ColorsLocal.hexToColor(
                                              "CBCBCB")
                                              .withOpacity(.8),
                                          fontFamily: "BalooDa2",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 8),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          InkWell(
                            child: Container(

                              //padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                              child: Container(
                                height: 30,
                                width: 30,
                                child: Center(
                                  child: Icon(

                                    musicPlayerVM.isPlaying ? Icons.pause : Icons.play_arrow,
                                    color: Colors.white,
                                    size: 15,

                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              if(musicPlayerVM.isPlaying) {
                                musicPlayerVM.pause();
                              }
                              else {
                                musicPlayerVM.play();
                              }
                            },
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      else {
        return Container(
          height: 0,
        );
      }
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: albumDetailsVM,
        ),
        ChangeNotifierProvider.value(
          value: ViewModelController.getMusicPlayerVM(),
        )
      ],
      child: Scaffold(
        appBar: PreferredSize(child: AppBar(
          elevation: 0.0,
        ), preferredSize: Size.fromHeight(0.0)
        ),
        bottomNavigationBar: Consumer<MusicPlayerVM>(
            builder: (context, musicPlayerVM, _) {
              return _musicPlayer(context, musicPlayerVM);
            }
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Consumer<AlbumDetailsVM>(builder: (context, snapshot, _) {
                if (snapshot.detailsLoaded) {
                  return Column(
                    children: [
                      Hero(
                        tag: albumId,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .45,
                          child: CachedNetworkImage(
                            imageUrl: snapshot.albumInfo['album_banner']
                                .toString()
                                .toString(),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.zero,
                                  topRight: Radius.zero,
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                ),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Shimmer.fromColors(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.zero,
                                    topRight: Radius.zero,
                                    bottomLeft: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0),
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
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            snapshot.albumInfo['album_name'],
                            style: TextStyle(
                                color: Colors.white.withOpacity(.8),
                                fontFamily: "BalooDa2",
                                fontWeight: FontWeight.w600,
                                fontSize: 32),
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            snapshot.albumInfo['song_count'] + " Songs",
                            style: TextStyle(
                                color: Colors.white.withOpacity(.8),
                                fontFamily: "BalooDa2",
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                        ),
                      ),
                      Container(
                        child: ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            //physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.songList.length,
                            itemBuilder: (BuildContext context, int i) {
                              return Column(
                                children: [
                                  Divider(
                                    color: ColorsLocal.hexToColor("FFFFFF")
                                        .withOpacity(.5),
                                  ),
                                  InkWell(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                snapshot.songList[i]["song_id"]
                                                    .toString() +
                                                    ".",
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(.8),
                                                    fontFamily: "BalooDa2",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                snapshot.songList[i]["song_name"]
                                                    .toString() +
                                                    ".",
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(.8),
                                                    fontFamily: "BalooDa2",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            Icons.play_circle_filled,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: (){
                                      Navigator.pushNamed(context, MusicPlayerRoute,arguments: snapshot.songList[i]);
                                    },
                                  ),
                                ],
                              );
                            }),
                      )
                    ],
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
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                margin:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
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
                          size: 20,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      child: Container(),
                    ),
//                    Container(
//                      decoration: BoxDecoration(
//                          color: Colors.grey[600].withOpacity(0.3),
//                          shape: BoxShape.circle,
//                          border: Border.all(
//                            width: 1,
//                            color: Colors.grey[600].withOpacity(0.3),
//                          )
//                      ),
//                      padding: EdgeInsets.all(8),
//                      child: Icon(
//                        Icons.menu,
//                        color: ThemeController.getTextColor(),
//                      ),
//                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
