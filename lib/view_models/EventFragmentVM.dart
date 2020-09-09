/*
* Created by Ahammed Hossain Shanto
* on 8/23/20
*/



import 'dart:convert';

import 'package:dotara/mock_response/MockResponse.dart';
import 'package:flutter/cupertino.dart';

class EventFragmentVM with ChangeNotifier {

  BuildContext context;
  List events = new List();
  bool eventLoaded = false;

  EventFragmentVM(this.context) {
    loadEvent();
  }

  loadEvent() async {

    eventLoaded = false;
    notifyListeners();


    await Future.delayed(Duration(seconds: 1));
    var response = MockResponse.getEvents();
    var responseBody = json.decode(response);

    events = responseBody['events'];
    eventLoaded = true;
    notifyListeners();

  }
}