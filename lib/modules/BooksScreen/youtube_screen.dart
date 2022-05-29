import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerWidget extends StatefulWidget {
  final String videoUrl;
  //final BuildContext context;

  const YoutubePlayerWidget({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);
  @override
  _YoutubePlayerWidgetState createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {
  //String videoUrl = "https://www.youtube.com/watch?v=FikZajrtFXc\r\n";

  //late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  late YoutubePlayerController _controller;

  void play() {
    _controller = YoutubePlayerController(
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl).toString(),
    )..addListener(listener);
  }

  @override
  void initState() {
    play();
    super.initState();

    super.initState();
  }

  @override
  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });

      _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void deativate() {
    _controller.pause();
    super.deactivate();
  }

//static const routePass = 'youtubeScreen';
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        builder: (context, player) {
          return Container(
            height: 250,
            child: player,
          );
        });
  }
}
