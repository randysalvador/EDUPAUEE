import 'package:chewie/chewie.dart';
import 'package:edupauee/Explorar/explorar_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(
    Video(),
  );
}

class Video extends StatefulWidget {
  Video(
      {this.title = 'Chewie Demo',
      this.url,
      FutureBuilder<List<Explore>> children});

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

  bool isYoutubeVideo(url) {
    return url.contains("youtube");
  }

  @override
  void initState() {
    super.initState();
    isYoutubeVideo(widget.url)
        ? this.runYoutubePlayer()
        : this.initializePlayer();
  }

  @override
  void dispose() {
    if (isYoutubeVideo(widget.url)) {
      _controller.dispose();
    } else {
      _videoPlayerController1.dispose();
      _chewieController.dispose();
    }
    super.dispose();
  }

  @override
  void deactivate() {
    if (isYoutubeVideo(widget.url)) {
      _controller.pause();
    } else {
      _videoPlayerController1.pause();
      _chewieController.pause();
    }

    super.deactivate();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.network(widget.url);
    await _videoPlayerController1.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      allowFullScreen: true,
      allowedScreenSleep: false,
      autoInitialize: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    setState(() {});
  }

  Future<void> runYoutubePlayer() async {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url),
      flags: YoutubePlayerFlags(
        enableCaption: false,
        disableDragSeek: true,
        isLive: false,
        autoPlay: true,
        mute: false,
        controlsVisibleAtStart: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (orientation == Orientation.landscape) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/FondoEdu.png"),
                fit: BoxFit.cover,
              )),
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xFF9B2242),
                  title: titulo(context),
                  elevation: 0,
                ),
                body: youtubeHierarchy(),
                backgroundColor: Colors.transparent,
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/fondoBEDU.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: true,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  flexibleSpace: Container(
                    alignment: Alignment.bottomCenter,
                    child: Imagen(),
                  ),
                ),
                body: youtubeHierarchy(),
                backgroundColor: Colors.transparent,
              ),
            );
          }
        },
      ),
    );
  }

  youtubeHierarchy() {
    return isYoutubeVideo(widget.url) == false
        ? _chewieController != null &&
                _chewieController.videoPlayerController.value.initialized
            ? Chewie(
                controller: _chewieController,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  CircularProgressIndicator(),
                  SizedBox(height: 100),
                  Text(
                    'Cargando',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )
        : Container(
            child: Align(
              alignment: Alignment.topCenter,
              child: FittedBox(
                fit: BoxFit.fill,
                child: YoutubePlayer(
                  controller: _controller,
                ),
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

class Imagen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('assets/images/appbarlogo.png');
    Image image = Image(
      image: assetImage,
      width: 335,
      height: 55,
    );
    return Container(
      child: image,
    );
  }
}
