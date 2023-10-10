import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';

class CreateAccountPage extends StatefulWidget {
  static const routeName = '/createAccountPage';

  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  tr('create_account'),
                  style: TextStyles.s700r32Black,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 16),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    tr('create_account_definition'),
                    textAlign: TextAlign.center,
                    style: TextStyles.s400r18Grey,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TextFormField(
                controller: namecontroller,
                decoration: InputDecoration(
                  labelText: tr('full_name')
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
