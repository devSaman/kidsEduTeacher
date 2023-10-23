import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/auth/widgets/custom_button.dart';
import 'package:kids_edu_teacher/view/main_app/info_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/change_language_page.dart';
import 'package:kids_edu_teacher/view/profile/widgets/settings_button.dart';
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
      body: CustomScrollView(slivers: [
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
