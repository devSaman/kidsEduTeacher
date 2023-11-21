import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/profile/screens/check_for_payment.dart';
import 'package:kids_edu_teacher/view/profile/widgets/input_for_card.dart';

class CoinsPage extends StatefulWidget {
  static const routeName = '/coinsPage';

  const CoinsPage({super.key});

  @override
  State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  TextEditingController coinController = TextEditingController(text: "10");
  int money = 10000;
  final amountFormat = NumberFormat("#,##0 000  ", "en_US");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          tr('coins'),
          style: TextStyles.s700r24Black,
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 240,
                    height: 60,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Pallate.mainColor.withOpacity(.3)),
                      color: Pallate.greyColor.withOpacity(.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "1 coin = 1 000 so’m",
                      style: TextStyles.s600r18Black,
                    ),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Pallate.greyColor.withOpacity(.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/user_card_image.png',
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12)),
                        ),
                        width: 140,
                        height: 80,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: InputForCard(
                            inputFormatter: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            inputType: TextInputType.number,
                            onChanged: (query) {
                              setState(() {
                                coinController.text.isNotEmpty
                                    ? money =
                                        int.parse(coinController.text) * 1000
                                    : money = 0;
                              });
                            },
                            hasborder: false,
                            controller: coinController,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Image.asset(
                  'assets/images/Swap.png',
                  width: 45,
                  height: 45,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Pallate.greyColor.withOpacity(.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/user_card_image.png',
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12)),
                        ),
                        width: 140,
                        height: 80,
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: money != 0
                                ? Text(
                                    amountFormat
                                        .format(int.parse(money.toString()))
                                        .replaceAll(",", " "),
                                    style: TextStyles.s600r18Black)
                                : const Center()),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, CheckForPayment.routeName,
                        arguments: coinController.text);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Pallate.mainColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    width: double.infinity,
                    height: 50,
                    child: Text(
                      tr('continue'),
                      style: TextStyles.s700r16White,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
