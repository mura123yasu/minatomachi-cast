import 'package:flutter/material.dart';

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

  void _stop() {}

  void _play() {}

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
        _isPlaying = !_isPlaying;
      },
    );
  }
}
