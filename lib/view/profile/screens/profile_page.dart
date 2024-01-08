import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/profile/screens/balance_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/settings_page.dart';
import 'package:kids_edu_teacher/view/videos/logic/get_user_data_bloc/get_user_data_bloc.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profileScreen';

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<GetUserDataBloc>().add(GetUserData());
    super.initState();
  }

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
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SettingsPage.routeName);
              },
              icon: SvgPicture.asset(
                'assets/icons/setting.svg',
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<GetUserDataBloc, GetUserDataState>(
        builder: (context, state) {
          if (state is GetUserDataSuccess) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 40),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue.shade600,
                        child: SvgPicture.asset(
                          "assets/icons/profile_filled.svg",
                          color: Pallate.whiteColor,
                          height: 25,
                          width: 25,
                        ),
                      ),
                      title: Text(state.userData.data.fullName.toString(),
                          style: TextStyles.s700r20Black),
                      subtitle: Text(
                        "+${state.userData.data.phoneNumber}",
                        style: TextStyles.s500r14grey,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
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
                        padding: const EdgeInsets.only(
                            left: 28, top: 10, bottom: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${'balance'.tr()}: ${state.userData.data.balance} ${'coins'.tr()}",
                              style: TextStyles.s700r18White,
                            ),
                            Text(
                              "${'status'.tr()}: ${'premium'.tr()}",
                              style: TextStyles.s700r18White,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, BalancePage.routeName);
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
                                  tr('open'),
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
              ],
            );
          }
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        },
      ),
    );
  }
}
