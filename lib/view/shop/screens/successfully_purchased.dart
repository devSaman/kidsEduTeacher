import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/hive_models/basket_model.dart';
import 'package:kids_edu_teacher/view/main_app/main_app.dart';
import 'package:kids_edu_teacher/view/shop/widgets/add_button.dart';

class SuccessfullyPurchasedPage extends StatefulWidget {
  static const routeName = '/successfullyPurchasedScreen';

  const SuccessfullyPurchasedPage({super.key});

  @override
  State<SuccessfullyPurchasedPage> createState() =>
      _SuccessfullyPurchasedPageState();
}

class _SuccessfullyPurchasedPageState extends State<SuccessfullyPurchasedPage> {
  @override
  void initState() {
    Hive.box<BasketModel>('basket').clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          tr('thanks_for_purchase'),
          style: TextStyles.s700r24Black,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/thanks_for_purchase.png",
                  ),
                  const SizedBox(height: 30),
                  Text(
                    tr('operator_call_you'),
                    textAlign: TextAlign.center,
                    style: TextStyles.s400r16Black,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    tr('contact_us'),
                    textAlign: TextAlign.center,
                    style: TextStyles.s400r16Black,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    tr('all_the_best'),
                    textAlign: TextAlign.center,
                    style: TextStyles.s400r16Black,
                  ),
                  const SizedBox(height: 50),
                  AddButton(
                    isFilled: false,
                    text: tr('call_us'),
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),
                  AddButton(
                    isFilled: true,
                    text: tr('back_to_home'),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, MainAppScreen.routeName, (route) => false);
                    },
                  ),
                  const SizedBox(height: 70),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
