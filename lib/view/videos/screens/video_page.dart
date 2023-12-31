import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/hive_models/hive_favourite_model.dart';
import 'package:kids_edu_teacher/data/models/video_models/get_all_collections_model.dart';
import 'package:kids_edu_teacher/view/videos/logic/get_user_data_bloc/get_user_data_bloc.dart';
import 'package:kids_edu_teacher/view/videos/logic/get_video_collections_bloc/get_video_collections_bloc.dart';
import 'package:kids_edu_teacher/view/videos/screens/collection_info_page.dart';
import 'package:kids_edu_teacher/view/videos/screens/video_player_page.dart';
import 'package:kids_edu_teacher/view/videos/widgets/collection_widget.dart';
import 'package:kids_edu_teacher/view/videos/widgets/favorited_widget.dart';
import 'package:lottie/lottie.dart';

class VideoPage extends StatefulWidget {
  static const routeName = '/videoScreen';

  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> with TickerProviderStateMixin {
  late TabController controllerTab;

  final _tabs = [
    Tab(text: 'all_videos'.tr()),
    Tab(text: 'favorites'.tr()),
  ];
  List<VideoModel> allVideos = [];
  @override
  void initState() {
    controllerTab = TabController(length: 2, vsync: this);
    context.read<GetVideoCollectionsBloc>().add(GetVideoCollectionsDataEvent());
    context.read<GetUserDataBloc>().add(GetUserData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: FractionallySizedBox(
          widthFactor: .5,
          heightFactor: .5,
          child: SvgPicture.asset(
            'assets/images/main_logo.svg',
          ),
        ),
        centerTitle: false,
        title: Text(
          'videos'.tr(),
          style: TextStyles.s700r24Black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              'assets/icons/notification.svg',
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            TabBar(
              controller: controllerTab,
              indicatorColor: Pallate.mainColor,
              labelColor: Pallate.mainColor,
              labelStyle: TextStyles.s600r14Main,
              unselectedLabelColor: Pallate.darkGreyColor,
              tabs: _tabs,
            ),
            const SizedBox(height: 15),
            Expanded(
              child: TabBarView(
                controller: controllerTab,
                children: [
                  BlocBuilder<GetVideoCollectionsBloc,
                      GetVideoCollectionsState>(
                    builder: (context, state) {
                      if (state is GetVideoCollectionsSuccess) {
                        allVideos.clear();
                        for (var i = 0;
                            i < state.videoCollections.data!.length;
                            i++) {
                          allVideos.addAll(
                              state.videoCollections.data?[i].videos ?? []);
                        }
                        print(allVideos.length);
                        return RefreshIndicator(
                          color: Pallate.mainColor,
                          onRefresh: () async {
                            context
                                .read<GetVideoCollectionsBloc>()
                                .add(GetVideoCollectionsDataEvent());
                          },
                          child: CustomScrollView(
                            physics: const BouncingScrollPhysics(),
                            slivers: [
                              SliverToBoxAdapter(
                                child: Text(
                                  "${state.videoCollections.data!.length.toString()} ${"collections".tr()}",
                                  style: TextStyles.s700r20Black,
                                ),
                              ),
                              SliverPadding(
                                padding: const EdgeInsets.only(top: 20),
                                sliver: SliverGrid(
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          childAspectRatio: 1.6,
                                          crossAxisSpacing: 16.0,
                                          maxCrossAxisExtent: 180.0,
                                          mainAxisSpacing: 20.0),
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                      return InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                CollectionInfoPage.routeName,
                                                arguments: state
                                                    .videoCollections
                                                    .data![index]);
                                          },
                                          child: CollectionWidget(
                                            data: state
                                                .videoCollections.data![index],
                                          ));
                                    },
                                    childCount:
                                        state.videoCollections.data!.length,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                      return const CupertinoActivityIndicator(
                        color: Pallate.mainColor,
                      );
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable:
                        Hive.box<HiveFavouriteModel>('favourites').listenable(),
                    builder: (ctx, box, _) {
                      final videos =
                          box.values.toList().cast<HiveFavouriteModel>();
                      List<VideoModel> savedVideos = [];
                      for (var a = 0; a < videos.length; a++) {
                        for (var i = 0; i < allVideos.length; i++) {
                          if (videos[a].id == allVideos[i].id &&
                              videos[a].type == "video") {
                            savedVideos.add(
                              allVideos[i],
                            );
                          }
                        }
                      }
                      if (savedVideos.isEmpty) {
                        return Center(
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
                        );
                      }
                      return SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: CustomScrollView(
                          physics: const BouncingScrollPhysics(),
                          slivers: [
                            SliverToBoxAdapter(
                              child: Text(
                                "${savedVideos.length} ${"favorites".tr()}",
                                style: TextStyles.s700r20Black,
                              ),
                            ),
                            SliverPadding(
                              padding: const EdgeInsets.only(top: 20),
                              sliver: SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  childCount: savedVideos.length,
                                  (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          VideoPlayerScreen.routeName,
                                          arguments: VideoPlayerScreen(
                                            video: savedVideos[index],
                                            listOfVideos: allVideos,
                                          ),
                                        );
                                      },
                                      child: FavoritedVideoWidget(
                                        video: savedVideos[index],
                                        isLibrary: false,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  // BlocBuilder<GetUserDataBloc, GetUserDataState>(
                  //   builder: (context, state) {
                  //     if (state is GetUserDataSuccess) {
                  //       var videos = state.userData.data.favoritedVidoes;
                  //       return CustomScrollView(
                  //         physics: const BouncingScrollPhysics(),
                  //         slivers: [
                  //           SliverToBoxAdapter(
                  //             child: Text(
                  //               "${videos!.length} ${"favorites".tr()}",
                  //               style: TextStyles.s700r20Black,
                  //             ),
                  //           ),
                  //           SliverPadding(
                  //             padding: const EdgeInsets.only(top: 20),
                  //             sliver: SliverList(
                  //               delegate: SliverChildBuilderDelegate(
                  //                 childCount: videos.length,
                  //                 (context, index) => InkWell(
                  //                     onTap: () {
                  //                       Navigator.pushNamed(context,
                  //                           VideoPlayerScreen.routeName,
                  //                           arguments: VideoPlayerScreen(
                  //                             video: videos[index],
                  //                             listOfVideos: videos,
                  //                           ));
                  //                     },
                  //                     child: FavoritedVideoWidget(
                  //                       video: videos[index],
                  //                       isLibrary: false,
                  //                     )),
                  //               ),
                  //             ),
                  //           )
                  //         ],
                  //       );
                  //     }
                  //     return const CupertinoActivityIndicator(
                  //       color: Pallate.mainColor,
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
