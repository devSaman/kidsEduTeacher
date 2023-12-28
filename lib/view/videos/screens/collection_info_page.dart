import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/video_models/get_all_collections_model.dart';
import 'package:kids_edu_teacher/view/videos/screens/video_player_page.dart';
import 'package:kids_edu_teacher/view/videos/widgets/favorited_widget.dart';
import 'package:lottie/lottie.dart';

class CollectionInfoPage extends StatefulWidget {
  final VideoCollectionModel data;

  static const routeName = '/collectionInfoScreen';

  const CollectionInfoPage({super.key, required this.data});

  @override
  State<CollectionInfoPage> createState() => _CollectionInfoPageState();
}

class _CollectionInfoPageState extends State<CollectionInfoPage> {
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
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.data.name.toString(),
          style: TextStyles.s700r24Black,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: double.infinity,
                  height: 230,
                  decoration: BoxDecoration(
                    color: Pallate.blackColor,
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          widget.data.cover!.additionalParameters![2].cover3
                              .toString(),
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 32),
            //     child: SizedBox(
            //       width: double.infinity,
            //       height: 60,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           SizedBox(
            //             width: 80,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: [
            //                 Text(widget.data.videos!.length.toString(),
            //                     style: TextStyles.s700r20Black),
            //                 Text(
            //                   tr('videos'),
            //                   style: TextStyles.s500r16grey,
            //                   overflow: TextOverflow.ellipsis,
            //                 ),
            //               ],
            //             ),
            //           ),
            //           SizedBox(
            //             width: 80,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: [
            //                 const Text('23K', style: TextStyles.s700r20Black),
            //                 Text(
            //                   tr('view'),
            //                   style: TextStyles.s500r16grey,
            //                   overflow: TextOverflow.ellipsis,
            //                 ),
            //               ],
            //             ),
            //           ),
            //           SizedBox(
            //             width: 80,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: [
            //                 const Text('105', style: TextStyles.s700r20Black),
            //                 Text(tr('favorited'),
            //                     overflow: TextOverflow.ellipsis,
            //                     style: TextStyles.s500r16grey),
            //               ],
            //             ),
            //           ),
            //           SizedBox(
            //             width: 80,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: [
            //                 const Text('459', style: TextStyles.s700r20Black),
            //                 Text(tr('shared'), style: TextStyles.s500r16grey),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'description'.tr(),
                      style: TextStyles.s700r20Black,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.data.description.toString(),
                      textAlign: TextAlign.justify,
                      style: TextStyles.s500r18grey,
                    ),
                    const SizedBox(height: 24),
                    widget.data.videos!.isEmpty
                        ? const Center()
                        : Text(
                            'videos'.tr(),
                            style: TextStyles.s700r20Black,
                          )
                  ],
                ),
              ),
            ),

            widget.data.videos!.isNotEmpty
                ? SliverPadding(
                    padding: const EdgeInsets.only(top: 20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: widget.data.videos!.length,
                        (context, index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              VideoPlayerScreen.routeName,
                              arguments: VideoPlayerScreen(
                                video: widget.data.videos![index],
                                listOfVideos: widget.data.videos!,
                              ),
                            );
                          },
                          child: FavoritedVideoWidget(
                            video: widget.data.videos![index],
                            isLibrary: false,
                          ),
                        ),
                      ),
                    ),
                  )
                : SliverToBoxAdapter(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/animations/empty_panda.json',
                            repeat: true,
                            width: double.infinity,
                          ),
                          Text(
                            tr('empty_list'),
                            style: TextStyles.s500r18grey,
                          )
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
