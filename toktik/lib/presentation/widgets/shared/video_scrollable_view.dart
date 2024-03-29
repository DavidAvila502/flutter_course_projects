import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost currentVideoPost = videos[index];
        return Stack(
          children: [
            // Video player + gradiente
            SizedBox.expand(
                child: FullScreenPlayer(
              caption: currentVideoPost.caption,
              videoUrl: currentVideoPost.videoUrl,
            )),
            // Buttons
            Positioned(
                bottom: 40,
                right: 20,
                child: VideoButtons(video: currentVideoPost)),
          ],
        );
      },
    );
  }
}
