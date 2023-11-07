import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/api_path.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/shop_models/main_model.dart';
import 'package:kids_edu_teacher/view/shop/logic/get_shop_data_bloc/get_shop_data_bloc.dart';
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
  List<ProductModel> products = [];

  final _tabs = [
    Tab(text: 'popular'.tr()),
    Tab(text: 'clothes'.tr()),
    Tab(text: 'shoes'.tr()),
  ];
  @override
  void initState() {
    context.read<GetShopDataBloc>().add(const ShopEvent());
    controllerTab = TabController(length: 3, vsync: this);
    super.initState();
  }

  String? categoryName;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<GetShopDataBloc, GetShopDataState>(
          builder: (context, state) {
            if (state is GetShopDataSuccess) {
              categoryName = state.shopMainModel.data[0].name;
              print(state.shopMainModel.data);
              return Drawer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
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
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, CartPage.routeName);
                              },
                              child: SvgPicture.asset(
                                'assets/icons/basket.svg',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.shopMainModel.data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: InkWell(
                                onTap: () {
                                  products.clear();
                                  for (var i = 0;
                                      i <
                                          state.shopMainModel.data[index]
                                              .products.length;
                                      i++) {
                                    products.add(state
                                        .shopMainModel.data[index].products[i]);
                                  }
                                  categoryName =
                                      state.shopMainModel.data[index].name;
                                  index = state.shopMainModel.data
                                      .indexOf(state.shopMainModel.data[index]);
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Pallate.whiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: .1,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                    border:
                                        Border.all(color: Pallate.mainColor),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                "${ApiPaths.basicUrl}/files/view?fileId=${state.shopMainModel.data[index].image}",
                                              ),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        state.shopMainModel.data[index].name!,
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
                    ],
                  ),
                ),
              );
            }
            return const Center();
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
        centerTitle: true,
        title: Text(
          categoryName ?? "",
          style: TextStyles.s700r24Black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
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
                      image: const DecorationImage(
                          image: AssetImage('assets/images/banner.png'),
                          fit: BoxFit.cover),
                      // color: Pallate.blueGradient1,
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
            // Padding(
            //   padding: const EdgeInsets.only(top: 20),
            //   child: TabBar(
            //     controller: controllerTab,
            //     indicatorColor: Pallate.mainColor,
            //     labelColor: Pallate.mainColor,
            //     labelStyle: TextStyles.s600r18Main,
            //     unselectedLabelColor: Pallate.darkGreyColor,
            //     tabs: _tabs,
            //   ),
            // ),
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${products.length} products",
                            style: TextStyles.s700r20Black,
                          ),
                          const Row(
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
                                  context, ProductDetailPage.routeName,
                                  arguments: products[index]);
                            },
                            child: ShopProductCard(
                              product: products[index],
                              isWidth: false,
                            ),
                          );
                        },
                        childCount: products.length,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
