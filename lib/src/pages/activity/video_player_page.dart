import 'dart:developer';

import 'package:cmu_mobile_app/src/pages/home/home_page.dart';
import 'package:cmu_mobile_app/src/widgets/buttons/main_button.dart';
import 'package:cmu_mobile_app/src/widgets/layouts/main_layout.dart';
import 'package:cmu_mobile_app/src/widgets/loading/loading_box.dart';
import 'package:cmu_mobile_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class VideoPlayPage extends StatefulWidget {
  const VideoPlayPage({
    Key? key,
    required this.link,
    required this.controller,
    required this.nextPage,
    this.endPage = 100,
    this.esteem = false,
  }) : super(key: key);
  final String link;
  final PageController controller;
  final int nextPage;
  final int endPage;
  final bool esteem;

  @override
  _VideoPlayPageState createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  late VideoPlayerController _controller;
  bool videoMenu = false;
  bool landscape = false;
  bool check = false;
  bool end = false;
  bool loading = true;

  @override
  void initState() {
    log("$videoUrl/${widget.link}");
    _controller = VideoPlayerController.network("$videoUrl/${widget.link}")
      ..setLooping(false)
      ..initialize().then((_) {
        loading = false;
        _controller.play();

        _controller.addListener(() {
          if (!mounted) return;
          setState(() {
            if (_controller.value.position == _controller.value.duration) {
              if (widget.nextPage == widget.endPage) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(initPage: 0),
                  ),
                );
              } else {
                widget.controller.jumpToPage(widget.nextPage);
              }
            }
          });
        });
      });

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

  void _launchURL() async {
    if (!await launch(openUrl)) throw 'Could not launch $openUrl';
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
        child: LoadingBox(
          loading: loading,
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
                      const SizedBox(
                        height: 50,
                      ),
                      Visibility(
                        visible: widget.esteem,
                        child: MainButton(
                          width: _size.width * 0.6,
                          fontSize: 10,
                          ontab: _launchURL,
                          title: "แบบวัดความมีคุณค่าในตนเอง",
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // Slider(
                      //   value: _controller.value.position.inSeconds.toDouble(),
                      //   max: _controller.value.duration.inSeconds.toDouble(),
                      //   divisions: 100,
                      //   label: _controller.value.position.inSeconds
                      //       .toDouble()
                      //       .round()
                      //       .toString(),
                      //   onChanged: (double value) {
                      //     setState(() {
                      //       _controller.seekTo(
                      //         Duration(
                      //           seconds: value.toInt(),
                      //         ),
                      //       );
                      //     });
                      //   },
                      // ),
                      // MainButton(
                      //   ontab: () {
                      //     if (widget.nextPage == widget.endPage) {
                      //       Navigator.pushReplacement(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) =>
                      //               const HomePage(initPage: 0),
                      //         ),
                      //       );
                      //     } else {
                      //       widget.controller.jumpToPage(widget.nextPage);
                      //     }
                      //   },
                      //   title: "next",
                      // ),
                    ],
                  )
                : Container(),
          ),
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
