import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/videos/screens/video_player_page.dart';
import 'package:kids_edu_teacher/view/videos/widgets/favorited_widget.dart';


class CollectionInfoPage extends StatefulWidget {
  static const routeName = '/collectionInfoScreen';

  const CollectionInfoPage({super.key});

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
        title: const Text(
          "Education Collection",
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
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
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
                            const Text('45', style: TextStyles.s700r20Black),
                            Text(tr('videos'), style: TextStyles.s500r16grey),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('23K', style: TextStyles.s700r20Black),
                            Text(tr('view'), style: TextStyles.s500r16grey),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('105', style: TextStyles.s700r20Black),
                            Text(tr('favorited'),
                                style: TextStyles.s500r16grey),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('459', style: TextStyles.s700r20Black),
                            Text(tr('shared'), style: TextStyles.s500r16grey),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                    const Text(
                      "This is a back to school quizzo. Let's make this game in your class to revive the classroom atmosphere after the holidays. Let's have fun at school! 🔥",
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
                  childCount: 7,
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
      ),
    );
  }
}
