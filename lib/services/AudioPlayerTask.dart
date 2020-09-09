/*
* Created by Ahammed Hossain Shanto
* on 8/31/20
*/


import 'dart:io';
import 'dart:math';

import 'package:audio_session/audio_session.dart';
import 'package:dotara/utils/Logger.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:rxdart/rxdart.dart';


class AudioPlayerTask extends BackgroundAudioTask {

//  final _mediaLibrary = MediaLibrary();
//  AudioPlayer _player = new AudioPlayer();
//  AudioProcessingState _skipState;
//  Seeker _seeker;
//  StreamSubscription<PlaybackEvent> _eventSubscription;

//  List<MediaItem> get queue => _mediaLibrary.items;
//  int get index => _player.currentIndex;
//  MediaItem get mediaItem => index == null ? null : queue[index];

  @override
  Future<void> onStart(Map<String, dynamic> params) async {
    // We configure the audio session for speech since we're playing a podcast.
    // You can also put this in your app's initialisation if your app doesn't
    // switch between two types of audio as this example does.
    Logger.printWrapped('onStart');
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Broadcast media item changes.
    AudioServiceBackground.setState(playing: true, controls: [
      MediaControl(
          label: "play/pause",
          action: MediaAction.play
      ),
    ],
      processingState: AudioProcessingState.ready,
    );
//    // Propagate all events from the audio player to AudioService clients.
//    _eventSubscription = _player.playbackEventStream.listen((event) {
//      _broadcastState();
//    });
//    // Special processing for state transitions.
//    _player.processingStateStream.listen((state) {
//      switch (state) {
//        case ProcessingState.completed:
//        // In this example, the service stops when reaching the end.
//          onStop();
//          break;
//        case ProcessingState.ready:
//        // If we just came from skipping between tracks, clear the skip
//        // state now that we're ready to play.
//          _skipState = null;
//          break;
//        default:
//          break;
//      }
//    });

    // Load and broadcast the queue
//    AudioServiceBackground.setQueue(queue);
//    try {
//      await _player.load(ConcatenatingAudioSource(
//        children:
//        queue.map((item) => AudioSource.uri(Uri.parse(item.id))).toList(),
//      ));
//      // In this example, we automatically start playing on start.
//      onPlay();
//    } catch (e) {
//      print("Error: $e");
//      onStop();
//    }
  }


  @override
  Future<void> onPlay() {

  }

  @override
  Future<void> onPause() {

  }



//  @override
//  Future<void> onStop() async {
//    await _player.pause();
//    await _player.dispose();
//    _eventSubscription.cancel();
//    // It is important to wait for this state to be broadcast before we shut
//    // down the task. If we don't, the background task will be destroyed before
//    // the message gets sent to the UI.
//    await _broadcastState();
//    // Shut down this task
//    await super.onStop();
//  }

}