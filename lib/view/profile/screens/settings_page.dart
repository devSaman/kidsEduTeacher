import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/auth/widgets/custom_button.dart';
import 'package:kids_edu_teacher/view/main_app/info_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/change_language_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/user_personal_info_page.dart';
import 'package:kids_edu_teacher/view/profile/widgets/settings_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settingsScreen';

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          tr('settings'),
          style: TextStyles.s700r24Black,
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
      ),
      body: CustomScrollView(
        
          physics: const BouncingScrollPhysics(),
        
        slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 30),
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
                Navigator.pushNamed(context, UserPesonalInfoPage.routeName);
              },
              text: tr('personal_info'),
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
                // Navigator.pushNamed(context, ChangeLanguagePage.routeName);
              },
              text: tr('notifications'),
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
              text: tr('sounds'),
              iconPath: "assets/icons/volume_filled.svg",
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SettingsButton(
                    color: Pallate.redGradient1,
                    text: tr('log_out'),
                    iconPath: 'assets/icons/log_out.png',
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(44),
                            topRight: Radius.circular(44),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Pallate.whiteColor,
                                borderRadius: BorderRadius.circular(44)),
                            height: 250,
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    tr('log_out'),
                                    style: TextStyles.s700r24Red,
                                  ),
                                  Text(
                                    tr('confirm_log_out'),
                                    textAlign: TextAlign.center,
                                    style: TextStyles.s700r20Black,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomButton(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        text: tr("cancel"),
                                        color:
                                            Pallate.mainColor.withOpacity(.2),
                                        width: 150,
                                        height: 50,
                                      ),
                                      CustomButton(
                                        onTap: () async {
                                          SharedPreferences preferences =
                                              await SharedPreferences
                                                  .getInstance();
                                          await preferences.clear();
                                          final appDir =
                                              await getTemporaryDirectory();
                                          if (appDir.existsSync()) {
                                            appDir.deleteSync(recursive: true);
                                          }
                                          // ignore: use_build_context_synchronously
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              InfoScreen.routeName,
                                              (route) => false);
                                        },
                                        text: tr("yes"),
                                        color: Pallate.mainColor,
                                        width: 150,
                                        height: 50,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SettingsButton(
                  color: Pallate.blueGradient1,
                  onTap: () {
                    Navigator.pushNamed(context, ChangeLanguagePage.routeName);
                  },
                  text: tr('change_language'),
                  iconPath: "assets/icons/language.png",
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
