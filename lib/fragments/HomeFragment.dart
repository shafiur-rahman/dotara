import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotara/constants/RoutingConstants.dart';
import 'package:dotara/values/ColorsLocal.dart';
import 'package:dotara/view_models/HomeFragmentVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../ViewModelController.dart';

class HomeFragment extends StatelessWidget {



  @override
  Widget build(BuildContext context) {




    return ChangeNotifierProvider.value(
      value: ViewModelController.getHomeFragmentVM(context),
      child: Consumer<HomeFragmentVM>(builder: (context, snapshot, _) {
        return Scaffold(
          body: _buildHome(context, snapshot),
        );
      }),
    );
  }

  Widget _buildHome(context, HomeFragmentVM snapshot) {
    Widget banner() => Container(
        height: 200,
        // width: double.infinity,
        color: Colors.green,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .25,
              child: CachedNetworkImage(
                imageUrl:
                snapshot.banner[index]['banner_pic'].toString().toString(),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(0),
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
                      borderRadius: BorderRadius.circular(0),
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
            );
          },
          itemCount: snapshot.banner.length,
          //indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: true,

          pagination: new SwiperPagination(
              margin: new EdgeInsets.all(0.0),
              builder: new SwiperCustomPagination(
                  builder: (BuildContext context, SwiperPluginConfig config) {
                    return new ConstrainedBox(
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Align(
                              alignment: Alignment.center,
                              child: new DotSwiperPaginationBuilder(
                                  color: Colors.black,
                                  activeColor: Colors.white,
                                  size: 5.0,
                                  activeSize: 8.0)
                                  .build(context, config),
                            ),
                          )
                        ],
                      ),
                      constraints: new BoxConstraints.expand(height: 50.0),
                    );
                  })),
          // control: new SwiperControl(),
        ));
    Widget album() => Container(
      margin: EdgeInsets.fromLTRB(21, 13, 21, 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Albums",
            style: TextStyle(
                color: Colors.white.withOpacity(.8),
                fontFamily: "BalooDa2",
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          Text(
            "Sell All",
            style: TextStyle(
                color: Colors.white.withOpacity(.25),
                fontFamily: "BalooDa2",
                fontWeight: FontWeight.w600,
                fontSize: 12),
          ),
        ],
      ),
    );
    Widget albumList() => Container(
      margin: EdgeInsets.fromLTRB(11, 0, 10, 0),
      height: MediaQuery.of(context).size.height * .3,
      // color: Colors.green,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.album.length,
          itemBuilder: (BuildContext context, int i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  // onTap: () {
                  //   Navigator.pushNamed(context, AlbumDetailsRoute,
                  //       arguments: {
                  //         "album_id": snapshot.album[i]["album_id"]
                  //       });
                  // },
                  child: Hero(
                    tag: snapshot.album[i]["album_id"],
                    child: Container(
                      margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      width: MediaQuery.of(context).size.width - 250,
                      height: MediaQuery.of(context).size.height * .25,
                      child: CachedNetworkImage(
                        imageUrl: snapshot.album[i]['image_url']
                            .toString()
                            .toString(),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
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
                              borderRadius: BorderRadius.circular(0),
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
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    snapshot.album[i]["title"],
                    style: TextStyle(
                        color: ColorsLocal.hexToColor("CBCBCB")
                            .withOpacity(.8),
                        fontFamily: "BalooDa2",
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    "Loved by " + snapshot.album[i]["loved_by"] + "+",
                    style: TextStyle(
                        color: ColorsLocal.hexToColor("CBCBCB")
                            .withOpacity(.8),
                        fontFamily: "BalooDa2",
                        fontWeight: FontWeight.w600,
                        fontSize: 8),
                  ),
                ),
              ],
            );
          }),
    );
    Widget newRelease() => Container(
      margin: EdgeInsets.fromLTRB(21, 0, 21, 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "New Release",
            style: TextStyle(
                color: Colors.white.withOpacity(.8),
                fontFamily: "BalooDa2",
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          Text(
            "Sell All",
            style: TextStyle(
                color: Colors.white.withOpacity(.25),
                fontFamily: "BalooDa2",
                fontWeight: FontWeight.w600,
                fontSize: 12),
          ),
        ],
      ),
    );
    Widget newReleaseList() => Container(
      margin: EdgeInsets.fromLTRB(11, 0, 10, 120),
      height: MediaQuery.of(context).size.height * .23,
      //color: Colors.green,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.release.length,
          itemBuilder: (BuildContext context, int i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                   // Navigator.pushNamed(context, SubscriptionRoute);
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        width: MediaQuery.of(context).size.width - 250,
                        height: (((MediaQuery.of(context).size.width) *
                            (9 / 16)) *
                            (5 / 9)),
                        child: CachedNetworkImage(
                          imageUrl: snapshot.release[i]['image_url']
                              .toString()
                              .toString(),
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5),
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
                                borderRadius: BorderRadius.circular(0),
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
                      snapshot.release[i]["premeium"]== true?
                      Positioned(
                        right: 0,
                        child: Container(
                          child: Center(
                            child: Text(
                              snapshot.release[i]["premeium"]== true?"Premeium":"",
                              style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(.8),
                                  fontFamily: "BalooDa2",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 8),
                            ),
                          ),
                          // clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [ColorsLocal.hexToColor("E0330D"), ColorsLocal.hexToColor("FFA756").withOpacity(1)],
                                stops: [0.0, 1.0],
                              ) ,
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topRight: Radius.circular(5),
                              )),
                          height: 16,
                          width:
                          (MediaQuery.of(context).size.width - 250) / 2,
                        ),
                      ):Container()
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    snapshot.release[i]["title"],
                    style: TextStyle(
                        color: ColorsLocal.hexToColor("CBCBCB")
                            .withOpacity(.8),
                        fontFamily: "BalooDa2",
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                ),
//                    Container(
//                      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
//                      child: Text(
//                        "Loved by " + snapshot.release[i]["loved_by"] + "+",
//                        style: TextStyle(
//                            color: ColorsLocal.hexToColor("CBCBCB")
//                                .withOpacity(.8),
//                            fontFamily: "BalooDa2",
//                            fontWeight: FontWeight.w600,
//                            fontSize: 8),
//                      ),
//                    ),
              ],
            );
          }),
    );

    if (snapshot.loaded && snapshot.albumLoaded && snapshot.releaseLoaded) {

      return Stack(
          children: [
            SingleChildScrollView(
              controller: snapshot.controller,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  banner(),
                  album(),
                  albumList(),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Divider(
                      color: Colors.white.withOpacity(.2),
                    ),
                  ),
                  newRelease(),
                  newReleaseList()
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: snapshot.upDirection? Container(
                height: 50,
                color: Colors.green,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(

                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Search your song"),
                        Icon(Icons.search)
                      ],
                    ),
                  ),
                    // height: 30,
                    // width: MediaQuery.of(context).size.width-100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                  ),
                ),
              ):Text("NT",style: TextStyle(
                  color: Colors.white
              ),),
            ),
          ],

      );
    } else
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
