import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/view/home/logic/all_courses_bloc/all_courses_bloc.dart';
import 'package:kids_edu_teacher/view/home/screens/home_page.dart';
import 'package:kids_edu_teacher/view/library/screens/library_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/profile_page.dart';
import 'package:kids_edu_teacher/view/shop/logic/get_shop_data_bloc/get_shop_data_bloc.dart';
import 'package:kids_edu_teacher/view/shop/screens/shop_page.dart';
import 'package:kids_edu_teacher/view/videos/screens/video_page.dart';

class MainAppScreen extends StatefulWidget {
  static const routeName = '/mainAppPage';

  const MainAppScreen({super.key});
  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  final List<Widget> _listOfScreens = [
    const VideoPage(),
    const LibraryPage(),
    BlocProvider(
      create: (context) => AllCoursesBloc(),
      child: const HomePage(),
    ),
    BlocProvider(
      create: (context) => GetShopDataBloc(),
      child: const ShopPage(),
    ),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _listOfScreens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/video_filled.svg",
              color: _selectedIndex == 0 ? Pallate.mainColor : null,
              height: 30,
              width: 30,
            ),
            label: "video".tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/library_filled.svg",
              color: _selectedIndex == 1 ? Pallate.mainColor : null,
              height: 30,
              width: 30,
            ),
            label: "library".tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home_filled.svg",
              color: _selectedIndex == 2 ? Pallate.mainColor : null,
              height: 30,
              width: 30,
            ),
            label: "home".tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/shop_filled.svg",
              color: _selectedIndex == 3 ? Pallate.mainColor : null,
              height: 30,
              width: 30,
            ),
            label: "shop".tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/profile_filled.svg",
              color: _selectedIndex == 4 ? Pallate.mainColor : null,
              height: 30,
              width: 30,
            ),
            label: "profile".tr(),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Pallate.mainColor,
        unselectedItemColor: Pallate.darkGreyColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
