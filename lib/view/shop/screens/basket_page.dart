import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/hive_models/basket_model.dart';
import 'package:kids_edu_teacher/data/models/shop_models/make_order_model.dart';
import 'package:kids_edu_teacher/view/main_app/main_app.dart';
import 'package:kids_edu_teacher/view/profile/screens/coins_page.dart';
import 'package:kids_edu_teacher/view/shop/logic/make_order_bloc/make_order_bloc.dart';
import 'package:kids_edu_teacher/view/shop/screens/successfully_purchased.dart';
import 'package:kids_edu_teacher/view/shop/widgets/add_button.dart';
import 'package:kids_edu_teacher/view/shop/widgets/basket_product_card.dart';
import 'package:kids_edu_teacher/view/videos/logic/get_user_data_bloc/get_user_data_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class BasketPage extends StatefulWidget {
  static const routeName = '/basketPageScreen';

  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  void initState() {
    context.read<GetUserDataBloc>().add(GetUserData());
    super.initState();
  }

  int price = 0;
  int userBalance = 0;
  bool isTapped = false;

  getPrice(List<BasketModel> data) {
    price = 0;
    for (var i = 0; i < data.length; i++) {
      for (var a = 0; a < data[i].qty; a++) {
        data[i].price != "null"
            ? price += int.parse(data[i].price.toString())
            : price = 0;
      }
    }
    print(price);
  }

  @override
  Widget build(BuildContext context) {
    final product =
        Hive.box<BasketModel>("basket").values.toList().cast<BasketModel>();
    getPrice(product);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
        centerTitle: true,
        title: Text(
          tr("basket"),
          style: TextStyles.s700r24Black,
        ),
      ),
      body: ValueListenableBuilder<Box<BasketModel>>(
        valueListenable: Hive.box<BasketModel>('basket').listenable(),
        builder: (ctx, box, index) {
          final productss = box.values.toList().cast<BasketModel>();
          if (productss.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Lottie.asset(
                    'assets/animations/sleep_panda.json',
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
          } else {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    color: Pallate.greyColor,
                    height: 56,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${tr("products")} (${productss.length})",
                            style: TextStyles.s600r14Grey,
                          ),
                          Text(
                            tr("price"),
                            style: TextStyles.s600r14Grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: List.generate(
                        productss.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(
                              bottom: 10, left: 15, right: 15),
                          child: BasketProductCardWidget(
                            product: productss[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  sliver: SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Pallate.greyColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                tr('check'),
                                style: TextStyles.s600r17Black,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    tr('total'),
                                    style: TextStyles.s600r17Black,
                                  ),
                                  Text(
                                    "$price " + tr('coins'),
                                    style: TextStyles.s600r16Main,
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 10, bottom: 80),
                  sliver: SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 36,
                            child: AddButton(
                              isFilled: false,
                              text: tr('to_shopping'),
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    MainAppScreen.routeName, (route) => false);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 220,
                            height: 36,
                            child: BlocConsumer<MakeOrderBloc, MakeOrderState>(
                              listener: (context, state) {
                                if (state is MakeOrderSuccess) {
                                  isTapped = false;

                                  setState(() {});
                                  Navigator.pushNamed(context,
                                      SuccessfullyPurchasedPage.routeName);
                                }
                              },
                              builder: (context, state) {
                                return isTapped
                                    ? Center(
                                        child: CircularProgressIndicator
                                            .adaptive())
                                    : AddButton(
                                        isFilled: true,
                                        text: tr('make_order'),
                                        onTap: () {
                                          setState(() {
                                            isTapped = true;
                                          });
                                          if (userBalance < price) {
                                            isTapped = false;
                                            setState(() {});
                                            showTopSnackBar(
                                              displayDuration:
                                                  const Duration(seconds: 3),
                                              Overlay.of(context),
                                              CustomSnackBar.info(
                                                backgroundColor: Pallate.orange,
                                                message: tr('not_enough_coin'),
                                              ),
                                            );
                                          } else {
                                            List<ProductModel> productsss = [];
                                            for (var i = 0;
                                                i < productss.length;
                                                i++) {
                                              productsss.add(
                                                ProductModel(
                                                    count: int.parse(
                                                        productss[i]
                                                            .qty
                                                            .toString()),
                                                    productId: productss[i]
                                                        .id
                                                        .toString(),
                                                    optionName:
                                                        productss[i].attribute,
                                                    optionValue: productss[i]
                                                        .attributeValue),
                                              );
                                            }
                                            context.read<MakeOrderBloc>().add(
                                                MakeOrderDataEvent(
                                                    orderData: MakeOrderModel(
                                                        amount: int.parse(
                                                            price.toString()),
                                                        productIds:
                                                            productsss)));
                                          }
                                        },
                                      );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Pallate.mainColor.withOpacity(.8),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        width: double.infinity,
        height: 40,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr('your_balance'),
                style: TextStyles.s600r15White,
              ),
              BlocBuilder<GetUserDataBloc, GetUserDataState>(
                builder: (context, state) {
                  if (state is GetUserDataSuccess) {
                    userBalance =
                        int.parse(state.userData.data.balance.toString());
                    return Row(
                      children: [
                        Text(
                          state.userData.data.balance.toString(),
                          style: TextStyles.s600r15White,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, CoinsPage.routeName);
                          },
                          icon: const Icon(
                            Icons.add_circle_outlined,
                            color: Pallate.greyColor,
                          ),
                        ),
                      ],
                    );
                  }
                  return SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
