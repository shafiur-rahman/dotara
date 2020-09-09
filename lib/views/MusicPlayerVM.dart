

import 'package:audio_service/audio_service.dart';
import 'package:dotara/services/AudioPlayerTask.dart';
import 'package:dotara/utils/Logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

import '../MusicPlayerController.dart';

class MusicPlayerVM with ChangeNotifier {

  VideoPlayerController videoPlayerController;
  bool playerInitialized = false;
  bool buffering = false;
  String lastPlayedUrl = "";
  bool isPlaying = false;
  int mediaDuration = 0;
  int mediaPosition = 0;
  int mediaDurationMilli = 0;
  int mediaPositionMilli = 0;
  var song;

  MusicPlayerVM();

  Future<bool> initController(var song) async {


    this.song = song;

    String url = song['media_url'].toString();

    if(url != lastPlayedUrl) {

      Logger.printWrapped("service start calling start");
      await AudioService.start(
        backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
        androidNotificationChannelName: 'Audio Service Demo',
        // Enable this if you want the Android service to exit the foreground state on pause.
        //androidStopForegroundOnPause: true,
        androidNotificationColor: 0xFF2196f3,
        androidNotificationIcon: 'mipmap/ic_launcher',
        androidEnableQueue: true,
      ).then((value) {
        Logger.printWrapped("service start calling end");
      });

      playerInitialized = false;
      isPlaying = false;
      mediaDuration = 0;
      mediaPosition = 0;
      mediaDurationMilli = 0;
      mediaPositionMilli = 0;
      //notifyListeners();
      videoPlayerController?.pause();

      videoPlayerController =
          MusicPlayerController.getVideoPlayerController(url);
      await videoPlayerController
        ..initialize().then((value) {
          mediaDuration = videoPlayerController.value.duration.inSeconds;
          mediaDurationMilli =
              videoPlayerController.value.duration.inMilliseconds;
          playerInitialized = true;
          lastPlayedUrl = url;
          videoPlayerController.play();
          notifyListeners();
        })
        ..addListener(() async {

          //just not to notify everytime..  only notify if any update..
          if (isPlaying != videoPlayerController.value.isPlaying) {
            isPlaying = videoPlayerController.value.isPlaying;
            notifyListeners();
          }

          if(videoPlayerController.value.isBuffering != buffering) {
            buffering = videoPlayerController.value.isBuffering;
            notifyListeners();
          }

          //Logger.printWrapped(videoPlayerController.value.isBuffering.toString());

          if (videoPlayerController.value.isPlaying &&
              videoPlayerController.value.position.inMilliseconds !=
                  mediaPositionMilli) {
            mediaPositionMilli =
                videoPlayerController.value.position.inMilliseconds;
          }

          if (videoPlayerController.value.isPlaying &&
              videoPlayerController.value.position.inSeconds != mediaPosition) {
            mediaPosition = videoPlayerController.value.position.inSeconds;
            //Logger.printWrapped(mediaPosition.toString());
            notifyListeners();
          }

          if (videoPlayerController.value.duration?.compareTo(
              videoPlayerController.value.position) == 0 ||
              videoPlayerController.value.duration?.compareTo(
                  videoPlayerController.value.position) == -1) {
            //End *****
            await videoPlayerController.seekTo(Duration.zero);
            mediaPosition = 0;
            mediaPositionMilli = 0;
            videoPlayerController.pause();
            notifyListeners();
          }
        });
    }
    return true;
  }

  play() async {

    String url = song['media_url'].toString();

    if(playerInitialized && lastPlayedUrl == url) {
      if(mediaDurationMilli == mediaPositionMilli) {
        videoPlayerController.play();
      }
      else {
        videoPlayerController.play();
      }
    }
    else {
      initController(song).then((value) {});
    }
  }

  pause() async {
    videoPlayerController.pause();
  }

  String durationToHms(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  double getProgress() {
    if(mediaDuration == 0) {
      return 0;
    }
    else {
      return (mediaPosition/mediaDuration)*100;
    }
  }

  seekTo(double value) async {
    if(mediaDurationMilli != 0) {
      bool alreadyPlaying = videoPlayerController.value.isPlaying;
      if(alreadyPlaying) {
        videoPlayerController.pause();
      }
      Duration position = Duration(
          milliseconds: (mediaDurationMilli * value).toInt());
      mediaPosition = position.inSeconds;
      mediaPositionMilli = position.inMilliseconds;
      notifyListeners();
      await videoPlayerController.seekTo(position);
      if(alreadyPlaying) {
        videoPlayerController.play();
      }
    }
  }

  void _audioPlayerTaskEntrypoint() async {
    Logger.printWrapped("entry Point");
    AudioServiceBackground.run(() => AudioPlayerTask());
  }



}
