

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class AudioPlayerService extends ChangeNotifier{
  final AudioPlayer _audioPlayer=AudioPlayer();
  bool _isPlaying=false;
  String songName='Today_Hit/Astronaut-In-The-Ocean.mp3';

  bool get isPlaying => _isPlaying;

  setSong(String songUrl){
    songName=songUrl;
    notifyListeners();
  }

  AudioPlayerService(){
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if(state==PlayerState.playing){
        _isPlaying=true;
      }
      if(state==PlayerState.completed){
        _isPlaying=false;
      }
      if(state==PlayerState.stopped){
        _isPlaying=false;
      }
      if(state==PlayerState.paused){
        _isPlaying=false;
      }
      notifyListeners();

    });
  }

  void playMusic(String url){
    if(_isPlaying){
      _audioPlayer.pause();
      _audioPlayer.play(AssetSource(url));
    }else{
      _audioPlayer.play(AssetSource(url));
    }
    _isPlaying=true;
    notifyListeners();
  }
  void pause(){
    if(_isPlaying){
      _audioPlayer.pause();
    }
  }
  @override
  void dispose(){
    _audioPlayer.dispose();
    super.dispose();
  }

}