import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/api_path.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/shop_models/main_model.dart';
import 'package:kids_edu_teacher/data/models/video_models/get_all_collections_model.dart';
import 'package:kids_edu_teacher/view/shop/logic/get_banners_bloc/get_banners_bloc.dart';
import 'package:kids_edu_teacher/view/shop/logic/get_shop_data_bloc/get_shop_data_bloc.dart';
import 'package:kids_edu_teacher/view/shop/screens/banner_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/basket_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/cart_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/categories_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/product_detail_page.dart';
import 'package:kids_edu_teacher/view/shop/widgets/product_card.dart';
import 'package:kids_edu_teacher/view/videos/widgets/collection_widget.dart';

class ShopPage extends StatefulWidget {
  static const routeName = '/shopScreen';

  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<ProductModel> products = [];
  List<ChildCategory> categories = [];
  String? category;
  bool isadded = false;

  @override
  void initState() {
    context.read<GetShopDataBloc>().add(const ShopEvent());
    context.read<GetBannersBloc>().add(const GetAllBannersData());
    super.initState();
  }

  String? categoryName;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: SizedBox(
      //   width: MediaQuery.of(context).size.width,
      //   child:
      //   BlocBuilder<GetShopDataBloc, GetShopDataState>(
      //     builder: (context, state) {
      //       if (state is GetShopDataSuccess) {
      //         if (isadded == false) {
      //           categoryName = state.shopMainModel.data[0].name;
      //           for (var i = 0;
      //               i < state.shopMainModel.data[0].childCategories.length;
      //               i++) {
      //             categories
      //                 .add(state.shopMainModel.data[0].childCategories[i]);
      //           }
      //           isadded = true;
      //         }
      //         print(state.shopMainModel.data);
      //         return Drawer(
      //           child: Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 25),
      //             child: Column(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.only(top: 40),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       InkWell(
      //                           onTap: () {
      //                             Navigator.pop(context);
      //                           },
      //                           child: const Icon(Icons.cancel_presentation)),
      //                       Text(
      //                         "categories".tr(),
      //                         style: TextStyles.s700r24Black,
      //                       ),
      //                       InkWell(
      //                         onTap: () {
      //                           Navigator.pushNamed(
      //                               context, CartPage.routeName);
      //                         },
      //                         child: SvgPicture.asset(
      //                           'assets/icons/basket.svg',
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Expanded(
      //                   child: ListView.builder(
      //                     itemCount: state.shopMainModel.data.length,
      //                     itemBuilder: (context, index) {
      //                       return Padding(
      //                         padding: const EdgeInsets.only(top: 10),
      //                         child: InkWell(
      //                           onTap: () async {
      //                             products.clear();
      //                             categories.clear();
      //                             for (var i = 0;
      //                                 i <
      //                                     state.shopMainModel.data[index]
      //                                         .childCategories.length;
      //                                 i++) {
      //                               categories.add(state.shopMainModel
      //                                   .data[index].childCategories[i]);
      //                             }
      //                             for (var i = 0;
      //                                 i <
      //                                     state.shopMainModel.data[index]
      //                                         .products.length;
      //                                 i++) {
      //                               products.add(state
      //                                   .shopMainModel.data[index].products[i]);
      //                             }
      //                             categoryName =
      //                                 state.shopMainModel.data[index].name;
      //                             index = state.shopMainModel.data
      //                                 .indexOf(state.shopMainModel.data[index]);
      //                             category = "";
      //                             setState(() {});
      //                             print(categories);
      //                             Navigator.pop(context);
      //                           },
      //                           child: Container(
      //                             height: 50,
      //                             width: double.infinity,
      //                             decoration: BoxDecoration(
      //                               color: Pallate.whiteColor,
      //                               boxShadow: [
      //                                 BoxShadow(
      //                                   color: Colors.grey.withOpacity(0.5),
      //                                   spreadRadius: .1,
      //                                   blurRadius: 5,
      //                                   offset: const Offset(
      //                                       0, 0), // changes position of shadow
      //                                 ),
      //                               ],
      //                               border:
      //                                   Border.all(color: Pallate.mainColor),
      //                               borderRadius: BorderRadius.circular(16),
      //                             ),
      //                             child: Row(
      //                               children: [
      //                                 const SizedBox(width: 10),
      //                                 Container(
      //                                   width: 40,
      //                                   height: 40,
      //                                   decoration: BoxDecoration(
      //                                     color: Colors.red,
      //                                     image: DecorationImage(
      //                                         image: NetworkImage(
      //                                           "${ApiPaths.basicUrl}/files/view?fileId=${state.shopMainModel.data[index].image}",
      //                                         ),
      //                                         fit: BoxFit.cover),
      //                                     borderRadius:
      //                                         BorderRadius.circular(20),
      //                                   ),
      //                                 ),
      //                                 const SizedBox(width: 10),
      //                                 Text(
      //                                   state.shopMainModel.data[index].name!,
      //                                   style: TextStyles.s600r16Block,
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                         ),
      //                       );
      //                     },
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         );
      //       }
      //       return const Center();
      //     },
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
        centerTitle: false,
        title: Text(
          tr("shop"),
          style: TextStyles.s700r24Black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, BasketPage.routeName);
              },
              child: SvgPicture.asset(
                'assets/icons/basket_icon.svg',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 20,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            BlocBuilder<GetBannersBloc, GetBannersState>(
              builder: (context, state) {
                if (state is GetBannersSuccess) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, BannerPage.routeName,
                          arguments: state.bannersData.data?[0]);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 215,
                      decoration: BoxDecoration(
                        color: Pallate.whiteColor,
                        border: Border.all(color: Pallate.mainColor),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.all(5),
                              width: double.infinity,
                              height: 176,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      "${ApiPaths.basicUrl}/files/view?fileId=${state.bannersData.data?[0].images?[0]}",
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Text(state.bannersData.data?[0].title ?? ""),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            ),
            BlocBuilder<GetShopDataBloc, GetShopDataState>(
              builder: (context, state) {
                if (state is GetShopDataSuccess) {
                  return Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.only(top: 30),
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
                                        context, ShopCategoriesPage.routeName,
                                        arguments:
                                            state.shopMainModel.data[index]);
                                  },
                                  child: CollectionWidget(
                                    data: VideoCollectionModel(
                                      name:
                                          state.shopMainModel.data[index].name,
                                      cover: VideoCoverModel(
                                        additionalParameters: [
                                          Cover1(),
                                          Cover1(),
                                          Cover1(
                                            cover3:
                                                "${ApiPaths.basicUrl}/files/view?fileId=${state.shopMainModel.data[index].image}",
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              childCount: state.shopMainModel.data.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const Expanded(
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
