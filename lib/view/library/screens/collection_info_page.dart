import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/video_models/get_all_collections_model.dart';
import 'package:kids_edu_teacher/view/videos/widgets/favorited_widget.dart';

class LibraryCollectionScreen extends StatefulWidget {
  static const routeName = '/libraryCollectionScreen';

  const LibraryCollectionScreen({super.key});

  @override
  State<LibraryCollectionScreen> createState() =>
      _LibraryCollectionScreenState();
}

class _LibraryCollectionScreenState extends State<LibraryCollectionScreen> {


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
          "Education",
          style: TextStyles.s700r24Black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
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
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 18),
                child: Text(
                  "76 Books",
                  style: TextStyles.s700r20Black,
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
                        // Navigator.pushNamed(
                        //     context, VideoPlayerScreen.routeName);
                      },
                      child: FavoritedVideoWidget(
                        isLibrary: true,
                        video: VideoModel(),
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
