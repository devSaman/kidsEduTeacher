import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/profile/screens/cards_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/coins_page.dart';
import 'package:kids_edu_teacher/view/profile/widgets/settings_button.dart';

class BalancePage extends StatefulWidget {
  static const routeName = '/balanceScreen';

  const BalancePage({super.key});

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          tr('balance'),
          style: TextStyles.s700r24Black,
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                width: double.infinity,
                height: 170,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/main_balance.png',
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 28, top: 10, bottom: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${'balance'.tr()}: ${0} ${'coins'.tr()}",
                        style: TextStyles.s700r18White,
                      ),
                      Text(
                        "${'status'.tr()}: ${'premium'.tr()}",
                        style: TextStyles.s700r18White,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.pushNamed(context, BalancePage.routeName);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          height: 32,
                          decoration: BoxDecoration(
                            color: Pallate.whiteColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            tr('Premium'),
                            style: TextStyles.s600r14Main,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SettingsButton(
                color: Pallate.orange,
                onTap: () {
                  Navigator.pushNamed(context, CardsPage.routeName);
                },
                text: tr('cards'),
                iconPath: "assets/icons/profile_filled.svg",
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SettingsButton(
                color: Pallate.redGradient2,
                onTap: () {
                  Navigator.pushNamed(context, CoinsPage.routeName);
                },
                text: tr('coins'),
                iconPath: "assets/icons/notification_filled.svg",
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SettingsButton(
                color: Pallate.mainColor,
                onTap: () {
                  // Navigator.pushNamed(context, ChangeLanguagePage.routeName);
                },
                text: tr('shop'),
                iconPath: "assets/icons/volume_filled.svg",
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SettingsButton(
                color: Pallate.green,
                onTap: () {
                  // Navigator.pushNamed(context, ChangeLanguagePage.routeName);
                },
                text: tr('subscription'),
                iconPath: "assets/icons/subscription.svg",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
