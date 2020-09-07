import 'dart:convert';

import 'package:dotara/mock_response/MockResponse.dart';
import 'package:flutter/cupertino.dart';

class HomeFragmentVM with ChangeNotifier{
  BuildContext context;
  bool loaded = false;
  bool albumLoaded = false;
  bool releaseLoaded =false;
  List banner = [];
  List album = [];
  var release=[];
  HomeFragmentVM(this.context){

    loadAlbumList();
    loadAnoucement();
    loadNewRelease();

  }

  loadAnoucement() {
    loaded = false;
    var response = json.decode(MockResponse.getAnouncement());
    print("gg" + response.toString());
    loaded = true;
    banner = response["banners"];
    notifyListeners();
  }
  loadAlbumList() {
    albumLoaded = false;
    var response = json.decode(MockResponse.getAlbumList());
    print("gg" + response.toString());
    albumLoaded = true;
    album = response["album_list"];
    notifyListeners();
  }
  loadNewRelease() {
    releaseLoaded = false;
    var response = json.decode(MockResponse.getNewRelease());
    // print("gg" + response.toString());
    releaseLoaded = true;
    release = response["album_list"];
    notifyListeners();
  }
}