import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/screens/auth/sign_in.dart';
import 'package:video_player/video_player.dart';
class BumbleBeeRemoteVideo extends StatefulWidget {
  @override
  _BumbleBeeRemoteVideoState createState() => _BumbleBeeRemoteVideoState();
}

class _BumbleBeeRemoteVideoState extends State<BumbleBeeRemoteVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/splashscreen.mp4');

    _controller.addListener(() {
      setState(() {});
      _controller.play();
    });
    // _controller.setLooping(true);
    _controller.initialize();
    Future.delayed(const Duration(seconds: 1), () {
Get.to(SignIn());
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding:  EdgeInsets.all(20),
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                VideoPlayer(_controller),
                ClosedCaption(text: _controller.value.caption.text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}