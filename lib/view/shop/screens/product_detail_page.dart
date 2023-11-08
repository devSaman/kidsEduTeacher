import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/shop_models/main_model.dart';
import 'package:kids_edu_teacher/view/shop/widgets/add_button.dart';
import 'package:kids_edu_teacher/view/shop/widgets/product_card.dart';
import 'package:kids_edu_teacher/view/shop/widgets/product_images_widget.dart';

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
                                        child: sizeDropDown(widget
                                            .product.attributes[index].items)),
                                  )
                                : const Center()),
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
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: AddButton(),
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
              decoration: const BoxDecoration(
                color: Pallate.mainColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              width: double.infinity,
              height: 40,
            ),
          )
        ],
      ),
    );
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
