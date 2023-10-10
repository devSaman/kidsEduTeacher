import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/shop/screens/cart_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/product_detail_page.dart';
import 'package:kids_edu_teacher/view/shop/widgets/product_card.dart';


class ShopPage extends StatefulWidget {
  static const routeName = '/shopScreen';

  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> with TickerProviderStateMixin {
  late TabController controllerTab;

  final _tabs = [
    Tab(text: 'popular'.tr()),
    Tab(text: 'clothes'.tr()),
    Tab(text: 'shoes'.tr()),
  ];
  @override
  void initState() {
    controllerTab = TabController(length: 3, vsync: this);
    super.initState();
  }

  String categoryName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return index == 0
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.cancel_presentation)),
                            Text(
                              "categories".tr(),
                              style: TextStyles.s700r24Black,
                            ),
                            const Icon(
                              Icons.abc_sharp,
                              color: Colors.transparent,
                            )
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: InkWell(
                          onTap: () {
                            categoryName = "$index item";
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Pallate.mainColor),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                const Icon(Icons.category),
                                const SizedBox(width: 10),
                                Text(
                                  "$index item",
                                  style: TextStyles.s600r16Block,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
              },
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
        centerTitle: true,
        title: Text(
          categoryName,
          style: TextStyles.s700r24Black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, CartPage.routeName);
              },
              child: SvgPicture.asset(
                'assets/icons/basket.svg',
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
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
                      color: Pallate.blueGradient1,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text("News from Apple"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TabBar(
                controller: controllerTab,
                indicatorColor: Pallate.mainColor,
                labelColor: Pallate.mainColor,
                labelStyle: TextStyles.s600r18Main,
                unselectedLabelColor: Pallate.darkGreyColor,
                tabs: _tabs,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controllerTab,
                children: [
                  CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "50 products",
                                style: TextStyles.s700r20Black,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "New",
                                    style: TextStyles.s700r18Main,
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.filter_list,
                                    color: Pallate.mainColor,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  childAspectRatio: .8,
                                  crossAxisSpacing: 30.0,
                                  maxCrossAxisExtent: 180.0,
                                  mainAxisSpacing: 20.0),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ProductDetailPage.routeName);
                                },
                                child: const ShopProductCard(
                                  isWidth: false,
                                ),
                              );
                            },
                            childCount: 7,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "50 products",
                                style: TextStyles.s700r20Black,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "New",
                                    style: TextStyles.s700r18Main,
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.filter_list,
                                    color: Pallate.mainColor,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  childAspectRatio: .8,
                                  crossAxisSpacing: 30.0,
                                  maxCrossAxisExtent: 180.0,
                                  mainAxisSpacing: 20.0),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ProductDetailPage.routeName);
                                },
                                child: const ShopProductCard(
                                  isWidth: false,
                                ),
                              );
                            },
                            childCount: 7,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "50 products",
                                style: TextStyles.s700r20Black,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "New",
                                    style: TextStyles.s700r18Main,
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.filter_list,
                                    color: Pallate.mainColor,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  childAspectRatio: .8,
                                  crossAxisSpacing: 30.0,
                                  maxCrossAxisExtent: 180.0,
                                  mainAxisSpacing: 20.0),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ProductDetailPage.routeName);
                                },
                                child: const ShopProductCard(
                                  isWidth: false,
                                ),
                              );
                            },
                            childCount: 7,
                          ),
                        ),
                      ),
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
