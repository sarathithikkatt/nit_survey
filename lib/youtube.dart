import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youtube extends StatefulWidget {
  const Youtube({Key? key}) : super(key: key);

  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: 'kF4EUM8CwT4', //Add videoID.
              flags: YoutubePlayerFlags(
                hideControls: false,
                controlsVisibleAtStart: true,
                autoPlay: false,
                mute: false,
                enableCaption: false,
              ),
            ),
            showVideoProgressIndicator: true,
            // progressIndicatorColor: AppColors.primary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: 'kF4EUM8CwT4', //Add videoID.
              flags: YoutubePlayerFlags(
                hideControls: false,
                controlsVisibleAtStart: true,
                autoPlay: false,
                mute: false,
                enableCaption: false,
              ),
            ),
            showVideoProgressIndicator: true,
            // progressIndicatorColor: AppColors.primary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: YoutubePlayer(
            // aspectRatio: 9 / 16,
            controller: YoutubePlayerController(
              initialVideoId: 'UDIQwGb-4YQ', //Add videoID.
              flags: YoutubePlayerFlags(
                hideControls: false,
                controlsVisibleAtStart: true,
                autoPlay: false,
                mute: false,
                enableCaption: false,
              ),
            ),
            showVideoProgressIndicator: true,
            // progressIndicatorColor: AppColors.primary,
          ),
        ),
      ],
    ));
  }
}
