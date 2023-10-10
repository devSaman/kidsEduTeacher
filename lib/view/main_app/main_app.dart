import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/view/home/screens/home_page.dart';
import 'package:kids_edu_teacher/view/library/screens/library_page.dart';
import 'package:kids_edu_teacher/view/main_app/bottom_bar_widget.dart';
import 'package:kids_edu_teacher/view/profile/screens/profile_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/shop_page.dart';
import 'package:kids_edu_teacher/view/videos/screens/video_page.dart';


class MainAppScreen extends StatefulWidget {
  static const routeName = '/mainAppPage';

  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  List<Widget> _listOfScreens = [];
  Widget? videosPage, libraryPage, homePage, shopPage, profilePage;
  @override
  void initState() {
    super.initState();
    videosPage = const VideoPage();
    homePage = const HomePage();
    libraryPage = const LibraryPage();
    shopPage = const ShopPage();
    profilePage = const ProfilePage();
    _listOfScreens = [
      videosPage!,
      libraryPage!,
      homePage!,
      shopPage!,
      profilePage!
    ];
  }

  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _listOfScreens[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 4,
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomBarItem(
                  label: "video".tr(),
                  changeItem: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  iconPath: _selectedIndex == 0
                      ? "assets/icons/video_filled.svg"
                      : "assets/icons/video.svg",
                ),
                BottomBarItem(
                  label: "library".tr(),
                  changeItem: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  iconPath: _selectedIndex == 1
                      ? "assets/icons/library_filled.svg"
                      : "assets/icons/library.svg",
                ),
                BottomBarItem(
                  label: "home".tr(),
                  changeItem: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  iconPath: _selectedIndex == 2
                      ? "assets/icons/home_filled.svg"
                      : "assets/icons/home.svg",
                ),
                BottomBarItem(
                  label: "shop".tr(),
                  changeItem: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                  iconPath: _selectedIndex == 3
                      ? "assets/icons/shop_filled.svg"
                      : "assets/icons/shop.svg",
                ),
                BottomBarItem(
                  label: "profile".tr(),
                  changeItem: () {
                    setState(() {
                      _selectedIndex = 4;
                    });
                  },
                  iconPath: _selectedIndex == 4
                      ? "assets/icons/profile_filled.svg"
                      : "assets/icons/profile.svg",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
