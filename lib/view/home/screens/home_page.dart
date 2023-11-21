import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/view/home/widgets/add_child_button.dart';
import 'package:kids_edu_teacher/view/home/widgets/courses_list_widget.dart';

import '../../../constants/text_styles.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homeScreen';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        title: const Text(
          "Kids EDU",
          style: TextStyles.s700r24Black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              'assets/icons/notification.svg',
            ),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: AddChildButton(),
            ),
            SliverToBoxAdapter(
              child: CoursesListWidget(),
            )
          ],
        ),
      ),
    );
  }
}
