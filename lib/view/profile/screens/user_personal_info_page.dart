import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';

class UserPesonalInfoPage extends StatefulWidget {
  static const routeName = '/userPrsonalInfoPage';

  const UserPesonalInfoPage({super.key});

  @override
  State<UserPesonalInfoPage> createState() => _UserPesonalInfoPageState();
}

class _UserPesonalInfoPageState extends State<UserPesonalInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          tr('personal_info'),
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
              padding: const EdgeInsets.only(top: 25),
              child: CircleAvatar(
                radius: 60,
              ),
            ),
          )
        ],
      ),
    );
  }
}
