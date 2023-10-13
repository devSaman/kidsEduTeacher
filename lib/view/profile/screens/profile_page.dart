import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/auth/widgets/custom_button.dart';
import 'package:kids_edu_teacher/view/main_app/info_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/change_language_page.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profileScreen';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: FractionallySizedBox(
            widthFactor: .5,
            heightFactor: .5,
            child: SvgPicture.asset(
              'assets/images/main_logo.svg',
            )),
        centerTitle: false,
        title: Text(
          "profile".tr(),
          style: TextStyles.s700r24Black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              'assets/icons/setting.svg',
            ),
          )
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue.shade600,
                ),
                title: const Text("Andrew Ainsley",
                    style: TextStyles.s700r20Black),
                subtitle: const Text(
                  "@andrew_ainsley",
                  style: TextStyles.s500r14grey,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Container(
                width: double.infinity,
                height: 170,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/main_button.png',
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
                        "${'balance'.tr()}: 0 ${'coins'.tr()}",
                        style: TextStyles.s700r18White,
                      ),
                      Text(
                        "${'status'.tr()}: ${'premium'.tr()}",
                        style: TextStyles.s700r18White,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        height: 32,
                        decoration: BoxDecoration(
                          color: Pallate.whiteColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          tr('open'),
                          style: TextStyles.s600r14Main,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
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
                                        onTap: () {
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
                    },
                    leading: CircleAvatar(
                      backgroundColor: Pallate.redGradient1.withOpacity(.2),
                      child: Image.asset(
                        'assets/icons/log_out.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    title: Text(
                      tr('log_out'),
                      style: TextStyles.s700r20Black,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ChangeLanguagePage.routeName);
                    },
                    leading: CircleAvatar(
                      backgroundColor: Pallate.blueGradient1.withOpacity(.2),
                      child: Image.asset(
                        'assets/icons/language.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    title: Text(
                      tr('change_language'),
                      style: TextStyles.s700r20Black,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
