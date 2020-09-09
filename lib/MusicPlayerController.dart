/*
* Created by Ahammed Hossain Shanto
* on 8/26/20
*/

import 'package:video_player/video_player.dart';

class MusicPlayerController {
  static VideoPlayerController videoPlayerController;

  static VideoPlayerController getVideoPlayerController(String url) {
    videoPlayerController = new VideoPlayerController.network(url);
    return videoPlayerController;
  }

  static void disposeController() async {
    videoPlayerController?.pause();
  }
}