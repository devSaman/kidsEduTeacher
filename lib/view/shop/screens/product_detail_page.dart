import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/routes.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/hive_models/basket_model.dart';
import 'package:kids_edu_teacher/data/models/shop_models/main_model.dart';
import 'package:kids_edu_teacher/view/main_app/main_app.dart';
import 'package:kids_edu_teacher/view/profile/screens/coins_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/successfully_purchased.dart';
import 'package:kids_edu_teacher/view/shop/widgets/add_button.dart';
import 'package:kids_edu_teacher/view/shop/widgets/product_card.dart';
import 'package:kids_edu_teacher/view/shop/widgets/product_images_widget.dart';
import 'package:kids_edu_teacher/view/videos/logic/get_user_data_bloc/get_user_data_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  final List<ProductModel> products;
  static const routeName = '/productDetailScreen';

  const ProductDetailPage(
      {super.key, required this.product, required this.products});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

String? sizeValue;

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    context.read<GetUserDataBloc>().add(GetUserData());

    sizeValue = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text(
          widget.product.name,
          style: TextStyles.s700r24Black,
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 16),
        //     child: SvgPicture.asset(
        //       'assets/icons/search.svg',
        //     ),
        //   )
        // ],
      ),
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(top: 20),
                sliver: SliverToBoxAdapter(
                  child: ProductImagesWidget(
                    images: widget.product.images,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: TextStyles.s700r20Black,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.product.description,
                        style: TextStyles.s400r14Grey,
                        textAlign: TextAlign.justify,
                      ),
                      // const ListTile(
                      //   leading: Text(
                      //     "Цвет",
                      //     style: TextStyles.s600r16Block,
                      //   ),
                      //   trailing: SizedBox(
                      //     height: 50,
                      //     width: 120,
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         CircleAvatar(
                      //           radius: 10,
                      //           backgroundColor: Pallate.blackColor,
                      //         ),
                      //         CircleAvatar(
                      //           radius: 10,
                      //           backgroundColor: Pallate.redGradient1,
                      //         ),
                      //         CircleAvatar(
                      //           radius: 10,
                      //           backgroundColor: Pallate.redGradient2,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Column(
                        children: List.generate(
                          widget.product.attributes.length,
                          (index) => widget
                                  .product.attributes[index].items.isNotEmpty
                              ? ListTile(
                                  leading: Text(
                                    widget.product.attributes[index].name,
                                    style: TextStyles.s600r16Block,
                                  ),
                                  trailing: SizedBox(
                                    width: 120,
                                    child: sizeDropDown(
                                        widget.product.attributes[index].items),
                                  ),
                                )
                              : const Center(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Container(
                            decoration: BoxDecoration(
                              color: Pallate.greyColor.withOpacity(.5),
                              border: Border.all(color: Pallate.greyColor),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "${widget.product.price} ${tr('coins')}",
                              style: TextStyles.s700r20Black,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: ValueListenableBuilder<Box<BasketModel>>(
                          valueListenable:
                              Hive.box<BasketModel>('basket').listenable(),
                          builder: (ctx, box, index) {
                            return isProductInHive(widget.product.id)
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: AddButton(
                                          onTap: () {
                                            if (getDrugQty(widget.product.id) >
                                                1) {
                                              decreaseQuantity(
                                                  widget.product.id);
                                            } else {
                                              deleteProduct(widget.product.id);
                                              showTopSnackBar(
                                                displayDuration:
                                                    const Duration(seconds: 3),
                                                Overlay.of(context),
                                                CustomSnackBar.info(
                                                  backgroundColor:
                                                      Pallate.orange,
                                                  message: tr(
                                                      'product_remove_basket'),
                                                ),
                                              );
                                            }

                                            setState(() {});
                                          },
                                          text: "-",
                                          isFilled: true,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: AddButton(
                                          onTap: () {},
                                          text: getDrugQty(widget.product.id)
                                              .toString(),
                                          isFilled: false,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: AddButton(
                                          onTap: () {
                                            increaseQuantity(widget.product.id);
                                            setState(() {});
                                          },
                                          text: "+",
                                          isFilled: true,
                                        ),
                                      ),
                                    ],
                                  )
                                : AddButton(
                                    isFilled: true,
                                    text: tr('add_to_basket'),
                                    onTap: () {
                                      addToBox(
                                          widget.product.id,
                                          widget.product.name,
                                          widget.product.attributes.isNotEmpty
                                              ? widget
                                                  .product.attributes[0].name
                                              : "",
                                          sizeValue ?? "",
                                          widget.product.price,
                                          widget.product.images.isNotEmpty
                                              ? widget.product.images[0]
                                              : "",
                                          1);
                                      showTopSnackBar(
                                        displayDuration:
                                            const Duration(seconds: 3),
                                        Overlay.of(context),
                                        CustomSnackBar.success(
                                          message:
                                              tr('product_add_basket_success'),
                                        ),
                                      );
                                    },
                                  );
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Вам также могут понравиться",
                          style: TextStyles.s600r18Black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: SizedBox(
                          height: 220,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: widget.products.length,
                              itemBuilder: (context, index) {
                                var product = widget.products[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, ProductDetailPage.routeName,
                                          arguments: ProductDetailPage(
                                            product: product,
                                            products: widget.products,
                                          ));
                                    },
                                    child: ShopProductCard(
                                      product: ProductModel(
                                          id: product.id,
                                          images: product.images,
                                          name: product.name,
                                          description: product.description,
                                          price: product.price,
                                          conditions: product.conditions,
                                          isDeleted: product.isDeleted,
                                          attributes: product.attributes),
                                      isWidth: true,
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
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
                          return Row(
                            children: [
                              Text(
                                state.userData.data.balance.toString(),
                                style: TextStyles.s600r15White,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, CoinsPage.routeName);
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
          )
        ],
      ),
    );
  }

  void increaseQuantity(String productId) {
    final box = Hive.box<BasketModel>('basket').values.toList();
    for (var product in box) {
      if (productId == product.id) {
        product.qty++;
        break;
      }
    }
  }

  void decreaseQuantity(String productId) {
    final box = Hive.box<BasketModel>('basket').values.toList();
    for (var product in box) {
      if (productId == product.id) {
        product.qty--;
        break;
      }
    }
  }

  bool isProductInHive(String productId) {
    final savedProductList = Hive.box<BasketModel>('basket').values.toList();
    var product;
    for (var prod in savedProductList) {
      if (prod.id == productId) {
        product = prod;
      }
    }
    return product != null;
  }

  num getDrugQty(String productId) {
    num qty = 0;
    final basket = Hive.box<BasketModel>('basket').values.toList();
    for (var prod in basket) {
      if (prod.id == productId) {
        qty = prod.qty;
      }
    }
    return qty;
  }

  void addToBox(id, name, attribute, attributeValue, price, image, qty) {
    final product = BasketModel()
      ..id = id
      ..name = name
      ..attribute = attribute
      ..attributeValue = attributeValue
      ..price = price
      ..image = image
      ..id = id
      ..qty = qty;

    final box = Hive.box<BasketModel>('basket');
    box.add(product);
  }

  void deleteProduct(String productId) {
    final box = Hive.box<BasketModel>('basket').values.toList();
    final listProducts = Hive.box<BasketModel>('basket');
    for (var product in box) {
      if (productId == product.id) {
        listProducts.delete(product.key);
        break;
      }
    }
  }

  Widget sizeDropDown(List<String> data) {
    return DropdownButtonFormField2<String>(
      value: sizeValue,
      isExpanded: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      hint: const Text(
        'Введите местоположение',
        style: TextStyle(fontSize: 14),
      ),
      items: data
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item.toString(),
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          )
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Введите местоположение';
        }
        return null;
      },
      onChanged: (value) {
        sizeValue = value;
        setState(() {});
      },
      onSaved: (value) {
        sizeValue = value;
      },
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }
}
