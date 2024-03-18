import 'package:alaraaf/controller/video/videocontroller.dart';
import 'package:alaraaf/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:alaraaf/controller/onboarding_controller.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    VideoPlayerScreencontrollerImp controller =
        Get.put(VideoPlayerScreencontrollerImp());

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('AlArraf Video'),
      // ),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: Stack(
        children: [
          Opacity(
            opacity: 0.6,
            child: FutureBuilder(
              future: controller.initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return AspectRatio(
                    aspectRatio:
                        controller.controller.value.aspectRatio / 1.202,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(controller.controller),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Positioned(
            bottom: 200,
            left: 75,
            height: 400,
            width: 200,
            child: SizedBox(
              width: 80,
              height: 40,

              /// Uncomment the following line to check the position/size of the Container
              //color: Color(0xff0360da),
              child: Align(
                  alignment: Alignment.center,

                  /// Integrate Image overlay into a video
                  child: Column(
                    children: [
                      Image.asset(AppImageAsset.logoorg),
                      Text(
                        "Spiritual Insight Unleashed",
                        style: TextStyle(fontSize: 13, color: Colors.white70),
                      )
                    ],
                  )),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 90,
            height: 400,
            width: 200,
            child: SizedBox(
              width: 80,
              height: 40,

              /// Uncomment the following line to check the position/size of the Container
              //color: Color(0xff0360da),
              child: Align(
                alignment: Alignment.bottomCenter,

                /// Integrate Image overlay into a video
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 35),
                  onPressed: () {
                    controller.continues();
                  },
                  color: Color.fromARGB(180, 255, 187, 15),
                  textColor: Colors.white,
                  child: Text("Explore Your Insight".tr),
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 1,
            left: 45,
            height: 70,
            width: 300,
            child: SizedBox(
              width: 80,
              height: 40,

              /// Uncomment the following line to check the position/size of the Container
              //color: Color(0xff0360da),
              child: Align(
                alignment: Alignment.bottomCenter,

                /// Integrate Image overlay into a video
                child: Column(
                  children: [
                    Text(
                      "By Creating An account or login in, you agreeing to the",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      "Terms and Conditions and Privacy Policy.",
                      style: TextStyle(
                          color: Color.fromARGB(180, 255, 187, 15),
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Wrap the play or pause in a call to `setState`. This ensures the
      //     // correct icon is shown.
      //     setState(() {
      //       // If the video is playing, pause it.
      //       if (_controller.value.isPlaying) {
      //         _controller.pause();
      //       } else {
      //         // If the video is paused, play it.
      //         _controller.play();
      //       }
      //     });
      //   },
      //   // Display the correct icon depending on the state of the player.
      //   child: Icon(
      //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),
      // ),
    );
  }
}
