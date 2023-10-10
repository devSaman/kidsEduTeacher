import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue.shade600,
            ),
            title: const Text("Andrew Ainsley", style: TextStyles.s700r20Black),
            subtitle: const Text(
              "@andrew_ainsley",
              style: TextStyles.s500r14grey,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'my_children'.tr(),
              style: TextStyles.s700r24Black,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
              child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.red.shade300,
                    ),
                    title: const Text("Darron Kulikowski",
                        style: TextStyles.s700r20Black),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      height: 32,
                      decoration: BoxDecoration(
                        color: Pallate.mainColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        "more".tr(),
                        style: TextStyles.s600r14White,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green.shade300,
                    ),
                    title: const Text("Maryland Winkles",
                        style: TextStyles.s700r20Black),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      height: 32,
                      decoration: BoxDecoration(
                        color: Pallate.mainColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        "more".tr(),
                        style: TextStyles.s600r14White,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
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
                      padding:
                          const EdgeInsets.only(left: 28, top: 10, bottom: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${'balance'.tr()}: 0 ${'coins'.tr()}", style: TextStyles.s700r18White,),
                          Text("${'status'.tr()}: ${'premium'.tr()}", style: TextStyles.s700r18White,),
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
              )
            ],
          ))
        ],
      ),
    );
  }
}
