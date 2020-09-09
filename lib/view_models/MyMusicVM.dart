import 'dart:convert';

import 'package:dotara/mock_response/Mockresponse.dart';
import 'package:flutter/material.dart';

class MyMusicVm with ChangeNotifier{
  BuildContext context;
  bool songLoaded = false;
  List song = [];

  MyMusicVm(this.context){
    loadSongList();
  }

  loadSongList()  {
    songLoaded = false;
    var response = json.decode(MockResponse.getMyMusicList());
    // print("Song List :"+response.toString());
    song = response["items"];
    songLoaded = true;
    notifyListeners();
  }
}