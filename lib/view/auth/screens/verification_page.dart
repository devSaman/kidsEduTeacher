import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/auth/logic/verification_bloc/verification_bloc.dart';
import 'package:kids_edu_teacher/view/auth/widgets/custom_button.dart';
import 'package:kids_edu_teacher/view/main_app/main_app.dart';
import 'package:pinput/pinput.dart';

class VerificationPage extends StatefulWidget {
  final String phoneNumber;
  static const routeName = '/verificationPage';

  const VerificationPage({super.key, required this.phoneNumber});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  var pinController = TextEditingController();

  final focusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
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
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Pinput(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  length: 6,
                  controller: pinController,
                  focusNode: focusNode,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 8),
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    context.read<VerificationBloc>().add(VerificationDataEvent(
                        phone: widget.phoneNumber, code: pinController.text));
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: focusedBorderColor,
                      ),
                    ],
                  ),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 40),
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
              padding: const EdgeInsets.only(top: 40),
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
                padding: const EdgeInsets.only(top: 50, bottom: 25),
                child: BlocConsumer<VerificationBloc, VerificationState>(
                  listener: (context, state) {
                    if (state is VerificationSuccess) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, MainAppScreen.routeName, (route) => false);
                    } else if (state is VerificationError) {
                      Fluttertoast.showToast(
                          msg: state.errorData.message.toString(),
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Pallate.mainColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      onTap: () {
                        if (pinController.text.length < 6) {
                          Fluttertoast.showToast(
                              msg: tr('please_fill_verification'),
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Pallate.mainColor,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          context.read<VerificationBloc>().add(
                              VerificationDataEvent(
                                  phone: widget.phoneNumber,
                                  code: pinController.text));
                        }
                      },
                      text: tr("confirm"),
                      color: Pallate.mainColor,
                      width: 350,
                      height: 58,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
