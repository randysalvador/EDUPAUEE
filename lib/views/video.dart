import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(
    Video(),
  );
}

class Video extends StatefulWidget {
  Video({this.title = 'Chewie Demo', this.url});

  final String title;
  final String url;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<Video> {
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    isYoutubeVideo(widget.url) ? this.runYoutubePlayer() : this.initializePlayer();
  }

  @override
  void dispose() {
   
    if(isYoutubeVideo(widget.url)){
      _controller.dispose(); 
    }else{
      _videoPlayerController1.dispose();
      _chewieController.dispose();
    }
    super.dispose();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.network(widget.url);
    await _videoPlayerController1.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: true,
    );
    setState(() {});
  }

  Future<void> runYoutubePlayer() async {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url),
      flags: YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: true,
        mute: false,
      ),
    );
  }

  bool isYoutubeVideo(url) {
    return url.contains("youtube");
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF1F2430),
        backgroundColor: Color(0xFF1F2430),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Color(0xFF1F2430),
        appBar: AppBar(
          title: titulo(context),
        ),
        body:
        Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: isYoutubeVideo(widget.url) == false
                    ? _chewieController != null &&
                            _chewieController
                                .videoPlayerController.value.initialized
                        ? Chewie(
                            controller: _chewieController,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 20),
                              Text('Cargando'),
                            ],
                          )
                    : YoutubePlayer(
                        controller: _controller,
                        liveUIColor: Colors.amber,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget titulo(BuildContext context) {
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text('EDU',
                style: GoogleFonts.bangers(
                    fontSize: 40, color: Color(0XFFFF6B3D))),
          ),
          Container(
            child: Text(
              ' PAUEE',
              style: GoogleFonts.bangers(
                fontSize: 40,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
