import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/videos/screens/collection_info_page.dart';
import 'package:kids_edu_teacher/view/videos/screens/video_player_page.dart';
import 'package:kids_edu_teacher/view/videos/widgets/collection_widget.dart';
import 'package:kids_edu_teacher/view/videos/widgets/favorited_widget.dart';


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
  @override
  void initState() {
    controllerTab = TabController(length: 2, vsync: this);
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
            )),
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
                  CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: Text(
                          "7 ${"collections".tr()}",
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
                                    Navigator.pushNamed(
                                        context, CollectionInfoPage.routeName);
                                  },
                                  child: const CollectionWidget());
                            },
                            childCount: 7,
                          ),
                        ),
                      )
                    ],
                  ),
                  CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: Text(
                          "28 ${"favorites".tr()}",
                          style: TextStyles.s700r20Black,
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.only(top: 20),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            childCount: 28,
                            (context, index) => InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, VideoPlayerScreen.routeName);
                                },
                                child: const FavoritedVideoWidget(
                                  isLibrary: false,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
