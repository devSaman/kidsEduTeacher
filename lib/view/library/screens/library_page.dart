import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/library/screens/collection_info_page.dart';
import 'package:kids_edu_teacher/view/videos/widgets/collection_widget.dart';
import 'package:kids_edu_teacher/view/videos/widgets/favorited_widget.dart';


class LibraryPage extends StatefulWidget {
  static const routeName = '/libraryScreen';

  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with TickerProviderStateMixin {
  late TabController controllerTab;

  final _tabs = [
    Tab(text: 'materials'.tr()),
    Tab(text: 'favorites'.tr()),
  ];

  final List<String> datas = ["Books", "Notebooks", "Another"];
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
        title: const Text(
          "Kids EDU",
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
            const SizedBox(height: 24),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Container(
                      height: 38,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: Pallate.mainColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        datas[index],
                        style: TextStyles.s600r16White,
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
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
                                          context, LibraryCollectionScreen.routeName);
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
                                    // Navigator.pushNamed(
                                    //     context, VideoPlayerScreen.routeName);
                                  },
                                  child: const FavoritedVideoWidget(
                                    isLibrary: true,
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
