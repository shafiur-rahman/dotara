/*
* Created by Ahammed Hossain Shanto
* on 8/27/20
*/

import 'package:dotara/constants/ProjectConstants.dart';

class Logger {

  static void printWrapped(String text) {
    if(BUILD_TYPE.toLowerCase() == "staging") {
      final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
      pattern.allMatches(text).forEach((match) =>
          print("LoggerG: " + match.group(0)));
    }
  }

}
