import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/shop_models/main_model.dart';
import 'package:kids_edu_teacher/view/shop/screens/product_detail_page.dart';
import 'package:kids_edu_teacher/view/shop/widgets/product_card.dart';
import 'package:lottie/lottie.dart';

class ShopCategoriesPage extends StatefulWidget {
  final ShopMaincategories categoryData;
  static const routeName = '/shopCategoriesPage';

  const ShopCategoriesPage({super.key, required this.categoryData});

  @override
  State<ShopCategoriesPage> createState() => _ShopCategoriesPageState();
}

class _ShopCategoriesPageState extends State<ShopCategoriesPage> {
  List<ProductModel> products = [];
  List<ChildCategory> categories = [];
  String? category;

  @override
  void initState() {
    categories.addAll(widget.categoryData.childCategories);
    products.addAll(widget.categoryData.products);
    // controllerTab = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          widget.categoryData.name ?? "",
          style: TextStyles.s700r24Black,
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            widget.categoryData.childCategories.isNotEmpty
                ? SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (ctx, idx) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: InkWell(
                              onTap: () {
                                if (category == categories[idx].name) {
                                  products.clear();
                                  category = null;
                                  products.addAll(widget.categoryData.products);
                                } else {
                                  products.clear();
                                  category = categories[idx].name;
                                  for (var i = 0;
                                      i < categories[idx].products.length;
                                      i++) {
                                    products.add(categories[idx].products[i]);
                                  }
                                }
                                setState(() {});
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: category == categories[idx].name
                                          ? Pallate.mainColor
                                          : Pallate.mainColor.withOpacity(.2)),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(categories[idx].name,
                                        style: category == categories[idx].name
                                            ? TextStyles.s600r18Main
                                            : TextStyles.s600r18Black),
                                    // const SizedBox(
                                    //   height: 5,
                                    // ),
                                    // category == categories[idx].name
                                    //     ? Container(
                                    //         width: 50,
                                    //         height: 2,
                                    //         color: Pallate.mainColor,
                                    //       )
                                    //     : const Center()
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                : const Center(),
            Expanded(
              child: products.isNotEmpty
                  ? CustomScrollView(
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
                                )

                                // const Row(
                                //   children: [
                                //     Text(
                                //       "New",
                                //       style: TextStyles.s700r18Main,
                                //     ),
                                //     SizedBox(width: 5),
                                //     Icon(
                                //       Icons.filter_list,
                                //       color: Pallate.mainColor,
                                //     )
                                //   ],
                                // )
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
                                        arguments: ProductDetailPage(
                                          product: products[index],
                                          products: products,
                                        ));
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
                        )
                      ],
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
