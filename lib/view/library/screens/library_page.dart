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
import 'package:kids_edu_teacher/view/library/logic/get_document_collections_bloc/get_document_collections_bloc.dart';
import 'package:kids_edu_teacher/view/library/screens/collection_info_page.dart';
import 'package:kids_edu_teacher/view/videos/logic/get_user_data_bloc/get_user_data_bloc.dart';
import 'package:kids_edu_teacher/view/videos/widgets/collection_widget.dart';
import 'package:kids_edu_teacher/view/videos/widgets/favorited_widget.dart';
import 'package:lottie/lottie.dart';

class LibraryPage extends StatefulWidget {
  static const routeName = '/libraryScreen';

  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with TickerProviderStateMixin {
  late TabController controllerTab;

  List<VideoModel> allDocuments = [];

  final _tabs = [
    Tab(text: 'materials'.tr()),
    Tab(text: 'favorites'.tr()),
  ];

  @override
  void initState() {
    controllerTab = TabController(length: 2, vsync: this);
    context
        .read<GetDocumentCollectionsBloc>()
        .add(GetDocumentCollectionsDataEvent());
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
            const SizedBox(height: 5),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TabBarView(
                  controller: controllerTab,
                  children: [
                    BlocBuilder<GetDocumentCollectionsBloc,
                        GetDocumentCollectionsState>(
                      builder: (context, state) {
                        if (state is GetDocumentCollectionsSuccess) {
                          var document = state.documentCollections.data;
                          allDocuments.clear();
                          for (var i = 0; i < document!.length; i++) {
                            allDocuments.addAll(document[i].documents ?? []);
                          }
                          return RefreshIndicator(
                            color: Pallate.mainColor,
                            onRefresh: () async {
                              context
                                  .read<GetDocumentCollectionsBloc>()
                                  .add(GetDocumentCollectionsDataEvent());
                            },
                            child: CustomScrollView(
                              physics: const BouncingScrollPhysics(),
                              slivers: [
                                SliverToBoxAdapter(
                                  child: Text(
                                    "${document.length} ${"collections".tr()}",
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
                                                context,
                                                LibraryCollectionScreen
                                                    .routeName,
                                                arguments: document[index]);
                                          },
                                          child: CollectionWidget(
                                            data: document[index],
                                          ),
                                        );
                                      },
                                      childCount: document.length,
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
                          Hive.box<HiveFavouriteModel>('favourites')
                              .listenable(),
                      builder: (ctx, box, _) {
                        final documents =
                            box.values.toList().cast<HiveFavouriteModel>();
                        List<VideoModel> savedDocuments = [];
                        for (var a = 0; a < documents.length; a++) {
                          for (var i = 0; i < allDocuments.length; i++) {
                            if (documents[a].id == allDocuments[i].id &&
                                documents[a].type == "library") {
                              savedDocuments.add(
                                allDocuments[i],
                              );
                            }
                          }
                        }
                        if (savedDocuments.isEmpty) {
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
                                  "${savedDocuments.length} ${"favorites".tr()}",
                                  style: TextStyles.s700r20Black,
                                ),
                              ),
                              SliverPadding(
                                padding: const EdgeInsets.only(top: 20),
                                sliver: SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    childCount: savedDocuments.length,
                                    (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          // Navigator.pushNamed(
                                          //   context,
                                          //   VideoPlayerScreen.routeName,
                                          //   arguments: VideoPlayerScreen(
                                          //     video: savedVideos[index],
                                          //     listOfVideos: allVideos,
                                          //   ),
                                          // );
                                        },
                                        child: FavoritedVideoWidget(
                                          video: savedDocuments[index],
                                          isLibrary: true,
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
                    //       var documents =
                    //           state.userData.data.favoritedDocuments;
                    //       return CustomScrollView(
                    //         physics: const BouncingScrollPhysics(),
                    //         slivers: [
                    //           SliverToBoxAdapter(
                    //             child: Text(
                    //               "${documents!.length} ${"favorites".tr()}",
                    //               style: TextStyles.s700r20Black,
                    //             ),
                    //           ),
                    //           SliverPadding(
                    //             padding: const EdgeInsets.only(top: 20),
                    //             sliver: SliverList(
                    //               delegate: SliverChildBuilderDelegate(
                    //                 childCount: documents.length,
                    //                 (context, index) => InkWell(
                    //                     onTap: () {
                    //                       // Navigator.pushNamed(context,
                    //                       //     VideoPlayerScreen.routeName,
                    //                       //     arguments: VideoPlayerScreen(
                    //                       //       video: videos[index],
                    //                       //       listOfVideos: videos,
                    //                       //     ));
                    //                     },
                    //                     child: FavoritedVideoWidget(
                    //                       video: documents[index],
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
            ),
          ],
        ),
      ),
    );
  }
}
