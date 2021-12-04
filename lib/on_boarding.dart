import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/Ink_in_Water_Background(720p).mp4');
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                height: _controller.value.size.height,
                width: _controller.value.size.width,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child:  SizedBox(
              height: MediaQuery.of(context).size.height*0.2,
              width: MediaQuery.of(context).size.width,
              child:  Center(
                child: Column(
                  children: [
                    const SpinKitThreeBounce(
                      color: Colors.black,
                      size: 25.0,
                      duration: Duration(seconds: 2),
                    ),
                    const SizedBox(height: 30,),
                    Text(
                      'Welcome',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.amiri(

                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}