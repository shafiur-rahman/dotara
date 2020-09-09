

import 'dart:convert';

import 'package:dotara/mock_response/MockResponse.dart';
import 'package:flutter/cupertino.dart';

class EventDetailsVM with ChangeNotifier {
  BuildContext context;
  bool detailsLoaded = false;
  var eventDetails;
  EventDetailsVM(this.context, int eventId) {
    loadEventDetails(eventId);
  }

  loadEventDetails(int eventId) async {
    detailsLoaded = false;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 200));
    var response = MockResponse.getEventDetails();
    var responseBody = json.decode(response);

    eventDetails = responseBody;
    detailsLoaded = true;
    notifyListeners();
  }
}
