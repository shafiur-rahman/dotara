import 'dart:convert';

import 'package:dotara/mock_response/Mockresponse.dart';
import 'package:flutter/material.dart';

class AlbumDetailsVM with ChangeNotifier{
  BuildContext context;
  bool detailsLoaded = false;
  var albumInfo;
  List songList = [];

  var albumId;

  AlbumDetailsVM(this.albumId){
    loadAlbumDetails();
  }

  loadAlbumDetails() {

    detailsLoaded = false;
    var body = json.encode({
      'album_id': albumId
    });

    var response = json.decode(MockResponse.getAlbumDetails(body));
    // print("gg" + response.toString());
    detailsLoaded = true;
    albumInfo = response["album_info"];
    songList = response["song_list"];
    notifyListeners();
  }
}