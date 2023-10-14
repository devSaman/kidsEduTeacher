import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/main_app/info_page.dart';
// import 'package:kids_edu_teacher/view/main_app/main_app.dart';
import 'package:lottie/lottie.dart';

class InitialPage extends StatefulWidget {
  static const routeName = '/initialScreen';

  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    // Timer(
    //   const Duration(seconds: 3),
    //   () {
    //     Navigator.pushNamedAndRemoveUntil(
    //         context, InfoScreen.routeName, (route) => false);
    //   },
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallate.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/main_logo.svg',
              height: 200.0,
              width: 200.0,
            ),
            const SizedBox(height: 40),
            const Text("Panda Kids", style: TextStyles.s700r48Black),
            const SizedBox(height: 40),
            Lottie.asset(
              'assets/animations/loading_purple.json',
              repeat: true,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
