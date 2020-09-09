import 'dart:convert';

import 'package:dotara/mock_response/MockResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class HomeFragmentVM with ChangeNotifier{

  bool upDirection = true, flag = true;
  bool reachBottom = false;
  bool reachUp = true;
  ScrollController controller;
  AnimationController animationController;

  callController(){
    controller = ScrollController()
      ..addListener(() {
        upDirection = controller.position.userScrollDirection == ScrollDirection.forward;
        // if (controller.offset >= controller.position.maxScrollExtent &&
        //     !controller.position.outOfRange) {
        //   reachBottom = true;
        //  // notifyListeners();
        //  //print("Reach bottom"+reachBottom.toString());
        // }
        // if (controller.offset <= controller.position.minScrollExtent &&
        //     !controller.position.outOfRange) {
        //  reachUp = true;
        //  //notifyListeners();
        // // print("Reach up"+reachBottom.toString());
        // }
        //notifyListeners();
        // makes sure we don't call setState too much, but only when it is needed
        if (upDirection != flag)
          //setState(() {});
        flag = upDirection;
        notifyListeners();
      });
  }
  callAnimationController(){
    animationController =
        AnimationController(duration: Duration(seconds: 4));
    animationController = Tween<double>(
      begin: 20,
      end: 35,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.ease,
      ),
    );
    animationController.forward();
  }

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
    callController();
    loadGenreType();
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

  bool saveGenre = false;
  bool musicListLoaded = false;
  List genreSelect = [];
  List<int> selectedSuggIds = new List();

  int selectedType = 1;

  getFavoriteGenre() {
    List genreIds = new List();
    for(int i = 0; i < selectedSuggIds.length; i++) {
      genreIds.add({
        "id": selectedSuggIds[i],
      });
    }
    return genreIds;
  }
  saveFavoriteGenre(){
    saveGenre = true;
    notifyListeners();
  }
  bool isSelected(int id) {
    if(selectedType == id){
      return true;
    }
    return false;
  }
  toggleSelection(int id) {
    selectedType = id;
    print("selected:"+selectedType.toString());
    notifyListeners();
  }


  loadGenreType(){
    musicListLoaded = false;
    var response = jsonDecode(MockResponse.getGenreList());
    musicListLoaded = true;
    genreSelect = response["items"];
    print(genreSelect);

  }





}