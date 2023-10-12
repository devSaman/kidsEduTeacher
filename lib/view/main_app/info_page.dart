import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/auth/screens/create_account_page.dart';
import 'package:kids_edu_teacher/view/auth/screens/login_page.dart';
import 'package:kids_edu_teacher/view/auth/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InfoScreen extends StatefulWidget {
  static const routeName = '/infoScreen';

  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView(
                  controller: controller,
                  children: const [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage(
                              "assets/images/0frame.png",
                            ),
                            height: 295,
                            width: 340,
                          ),
                          Text(
                            'Помощник для учителя, учитель для ученика.',
                            style: TextStyles.s700r32Black,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage("assets/images/1frame.png"),
                            height: 250,
                            width: 340,
                          ),
                          Text(
                            'Найдите веселые и интересные викторины, чтобы улучшить свои знания.',
                            style: TextStyles.s700r32Black,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage("assets/images/2frame.png"),
                            height: 295,
                            width: 340,
                          ),
                          Text(
                            'Play and take quiz challenges together with your friends.',
                            style: TextStyles.s700r32Black,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const WormEffect(
                  dotColor: Pallate.greyColor,
                  activeDotColor: Pallate.blueGradient1,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                onTap: (){
                  Navigator.pushNamed(context, CreateAccountPage.routeName);
                },
                text: tr("start"),
                color: Pallate.mainColor,
                width: 350,
                height: 58,
              ),
              const SizedBox(height: 24),
              CustomButton(
                onTap: (){
                  Navigator.pushNamed(context, LoginPage.routeName);

                },
                text: tr('have_account'),
                color: Pallate.mainColor.withOpacity(.2),
                width: 350,
                height: 58,
              ),
              const SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
