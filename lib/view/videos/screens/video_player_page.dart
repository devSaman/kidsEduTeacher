import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/video_models/get_all_collections_model.dart';
import 'package:kids_edu_teacher/view/videos/widgets/favorited_widget.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoModel video;
  final List<VideoModel> listOfVideos;
  static const routeName = '/videoPlayerScreen';

  const VideoPlayerScreen(
      {super.key, required this.video, required this.listOfVideos});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  String extractVideoId(String youtubeUrl) {
    Uri uri = Uri.parse(youtubeUrl);
    String videoId = uri.queryParameters['v']!;
    return videoId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Pallate.blackColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset(
              'assets/icons/star.svg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              'assets/icons/send.svg',
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: YoutubePlayerBuilder(
                      player: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId:
                              extractVideoId(widget.video.link.toString()),
                          flags: const YoutubePlayerFlags(
                            autoPlay: false,
                            mute: false,
                          ),
                        ),
                      ),
                      builder: (context, player) {
                        return player;
                      },
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.video.name.toString(),
                      style: TextStyles.s700r24Black,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(widget.video.views.toString(),
                                      style: TextStyles.s700r20Black),
                                  Text(tr('view'),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.s500r16grey),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(widget.video.favorited.toString(),
                                      style: TextStyles.s700r20Black),
                                  Text(tr('favorited'),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.s500r16grey),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(widget.video.shared.toString(),
                                      style: TextStyles.s700r20Black),
                                  Text(tr('shared'),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.s500r16grey),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'description'.tr(),
                      style: TextStyles.s700r20Black,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.video.description.toString(),
                      textAlign: TextAlign.justify,
                      style: TextStyles.s500r18grey,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'videos'.tr(),
                      style: TextStyles.s700r20Black,
                    )
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: widget.listOfVideos.length,
                  (context, index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, VideoPlayerScreen.routeName,
                          arguments: VideoPlayerScreen(
                            video: widget.listOfVideos[index],
                            listOfVideos: widget.listOfVideos,
                          ));
                    },
                    child: FavoritedVideoWidget(
                      video: widget.listOfVideos[index],
                      isLibrary: false,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
