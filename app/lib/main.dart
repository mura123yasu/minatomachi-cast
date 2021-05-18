import 'package:flutter/material.dart';

import 'package:flutter_sound/flutter_sound.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Boring Show',
      home: BoringPage(),
    );
  }
}

class BoringPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PlaybackButton(),
      ),
    );
  }
}

class PlaybackButton extends StatefulWidget {
  @override
  _PlaybackButtonState createState() => _PlaybackButtonState();
}

class _PlaybackButtonState extends State<PlaybackButton> {
  bool _isPlaying = false;
  FlutterSound _sound;
  // final url = 'https://anchor.fm/minatomachi-radio/episodes/14-e109hg3';
  final url = 'assets/minato_cast.mp3';

  @override
  void initState() {
    super.initState();
    _sound = FlutterSound();
  }

  void _stop() async {
    await _sound.stopPlayer();
  }

  void _play() async {
    await _sound.startPlayer(url);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _isPlaying ? Icon(Icons.stop) : Icon(Icons.play_arrow),
      onPressed: () {
        if (_isPlaying) {
          _stop();
        } else {
          _play();
        }
        setState(() => _isPlaying = !_isPlaying);
      },
    );
  }
}
