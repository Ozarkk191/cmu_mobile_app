import 'dart:async';
import 'package:cmu_mobile_app/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/widgets/layouts/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayPage extends StatefulWidget {
  const VideoPlayPage(
      {Key? key,
      required this.link,
      required this.controller,
      required this.nextPage})
      : super(key: key);
  final String link;
  final PageController controller;
  final int nextPage;

  @override
  _VideoPlayPageState createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  late VideoPlayerController _controller;
  bool videoMenu = false;
  bool landscape = false;
  bool check = false;
  bool end = false;

  void checkEnd() {
    Timer(Duration(seconds: _controller.value.duration.inSeconds), () {
      widget.controller.jumpToPage(widget.nextPage);
    });
  }

  @override
  void initState() {
    _controller = VideoPlayerController.asset(widget.link)
      ..setLooping(true)
      ..initialize().then((_) {
        _controller.play();
        checkEnd();
        _controller.addListener(
          () => setState(() {
            // log(_controller.value.duration.inSeconds.toString());
            // log(_controller.value.position.inSeconds.toString());
            // // if (!check) {
            // //   if (_controller.value.position.inSeconds > 0) {
            // //     check = true;
            // //     log(check.toString());
            // //   }
            // // }
            // if (_controller.value.position.inSeconds ==
            //     _controller.value.duration.inSeconds) {
            //   end == true;
            //   _controller.pause();

            //   if (landscape) {
            //     _rotatePortrait();
            //   }
            // }
            // if (end) {
            //   Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const SubSplashPage(),
            //     ),
            //   );
            // }
          }),
        );
      });
    _controller.setLooping(true);

    super.initState();
  }

  void _showMenu() {
    setState(() {
      videoMenu = !videoMenu;
    });
  }

  void _rotateLandscape() {
    setState(() {
      landscape = true;
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  void _rotatePortrait() {
    setState(() {
      landscape = false;
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: MainLayout(
        child: SizedBox(
          width: _size.width,

          // margin: const EdgeInsets.all(20),
          child: _controller.value.isInitialized
              ? Column(
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: _showMenu,
                            child: VideoPlayer(_controller),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Visibility(
                              visible: videoMenu,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (_controller.value.isPlaying) {
                                          _controller.pause();
                                        } else {
                                          _controller.play();
                                        }
                                      },
                                      child: Icon(
                                        _controller.value.isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: landscape
                                          ? _rotatePortrait
                                          : _rotateLandscape,
                                      child: Icon(
                                        landscape
                                            ? Icons.fullscreen_exit
                                            : Icons.fullscreen,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Visibility(
                    //   visible: end,
                    //   child: MainButton(
                    //     ontab: () {
                    //       widget.controller.jumpToPage(widget.nextPage);
                    //     },
                    //     title: "next",
                    //   ),
                    // ),
                  ],
                )
              : Container(),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _controller.value.isPlaying
      //           ? _controller.pause()
      //           : _controller.play();
      //     });
      //   },
      //   child: Icon(
      //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),
      // ),
    );
  }
}
