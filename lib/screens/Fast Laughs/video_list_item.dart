import 'package:flutter/material.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/constants/colors.dart';
import 'package:netflix/constants/strings.dart';
import 'package:netflix/constants/styles.dart';
import 'package:netflix/domain/home/models/home.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Home moviedata;

  const VideoListItemInheritedWidget({required this.widget, required this.moviedata ,super.key})
      : super(child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.moviedata != moviedata;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  int index;
  VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.moviedata.posterPath;
    final title = VideoListItemInheritedWidget.of(context)!.moviedata.title;
    final videoUrl = dummyVideoUrls[index % dummyVideoUrls.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(videoUrl: videoUrl, inChanged: (bool isPlaying) {}),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.volume_mute_sharp),
                  iconSize: 30,
                  color: whiteClr,
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: posterPath == null
                              ? null
                              : NetworkImage('$imageAppendUrl$posterPath'),
                          radius: 25,
                        ),
                        Positioned(
                            bottom: .01,
                            child: Text(
                              title ?? 'No title',
                              style: const TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w900,
                              ),
                            ))
                      ],
                    ),
                    height10,
                    VideoTileActions(
                      icon: Icons.emoji_emotions_outlined,
                      title: '2.T',
                    ),
                    VideoTileActions(icon: Icons.add, title: 'My List'),
                    VideoTileActions(icon: Icons.share, title: 'Share'),
                    VideoTileActions(icon: Icons.play_arrow, title: 'Play')
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoTileActions extends StatelessWidget {
  IconData icon;
  String title;
  VideoTileActions({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon),
          iconSize: 30,
          color: whiteClr,
        ),
        Text(title),
        height10,
      ],
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) inChanged;
  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.inChanged});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    videoPlayerController.initialize().then((value) {
      setState(() {
        videoPlayerController.play();
      });
      videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: videoPlayerController.value.aspectRatio,
              child: VideoPlayer(videoPlayerController
                ),
              )
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
