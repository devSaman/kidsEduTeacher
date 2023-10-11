import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/auth/widgets/custom_button.dart';

class VerificationPage extends StatelessWidget {
  static const routeName = '/verificationPage';

  const VerificationPage({super.key});

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
                  tr('sent_sms'),
                  style: TextStyles.s700r32Black,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 16),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    tr('sent_sms_definition'),
                    textAlign: TextAlign.center,
                    style: TextStyles.s400r18Grey,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 16),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    tr("didn't_receive_email"),
                    textAlign: TextAlign.center,
                    style: TextStyles.s400r18Grey,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 16),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    tr('you_can_resend_code'),
                    textAlign: TextAlign.center,
                    style: TextStyles.s400r18Grey,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 25),
                child: CustomButton(
                  onTap: () {},
                  text: tr("confirm"),
                  color: Pallate.mainColor,
                  width: 350,
                  height: 58,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
