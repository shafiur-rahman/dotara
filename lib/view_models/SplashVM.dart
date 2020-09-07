
import 'dart:convert';

import 'package:dotara/mock_response/MockResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class SplashVM with ChangeNotifier {



  BuildContext context;
  bool loaded = false;
  var bandInfo;
  bool signUp = false;
  bool fbLogin = false;
  bool listenMusic = true;
  bool signIn = true;


  pressed(){
    signUp = true;
    signIn = false;
    listenMusic =false;
    notifyListeners();
  }


  SplashVM(this.context) {
    loadBandInfo();
  }

  loadBandInfo (){
    loaded = false;
    var response = json.decode(MockResponse.getBandInfo());
    loaded = true;
    bandInfo = response;
    notifyListeners();
  }

}
