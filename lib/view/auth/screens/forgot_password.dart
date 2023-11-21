import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/auth/logic/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:kids_edu_teacher/view/auth/screens/verification_page.dart';
import 'package:kids_edu_teacher/view/auth/widgets/custom_button.dart';
import 'package:kids_edu_teacher/view/auth/widgets/input_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const routeName = '/forgotPasswordPage';

  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  var phoneFormatter = MaskTextInputFormatter(
      mask: '##-###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),

          slivers: [
            SliverToBoxAdapter(
              child: Text(
                tr('forgot_password'),
                style: TextStyles.s700r32Black,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 30),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    tr('forgot_password_definition'),
                    textAlign: TextAlign.start,
                    style: TextStyles.s400r18Grey,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: InputWidget(
                  maxLength: 12,
                  inputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                    phoneFormatter
                  ],
                  inputType: TextInputType.number,
                  prefixIcon: const Text(
                    "+998 ",
                    style: TextStyles.s700r20Black,
                  ),
                  controller: phoneController,
                  label: tr('phone_number'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                  listener: (context, state) {
                    if (state is ForgotPasswordSuccess) {
                      print(state.loginData.data);
                      Navigator.pushNamed(context, VerificationPage.routeName,
                          arguments: VerificationPage(
                            phoneNumber: phoneController.text,
                            fromCreate: false,
                          ));
                    } else if (state is ForgotPasswordFail) {
                      Fluttertoast.showToast(
                          msg: state.errorData.message.toString(),
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Pallate.mainColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                    print(state);
                  },
                  builder: (context, state) {
                    return CustomButton(
                      onTap: () {
                        if (phoneController.text.isEmpty ||
                            phoneController.text.length < 12) {
                          Fluttertoast.showToast(
                              msg: tr('fill_number'),
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Pallate.mainColor,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          context.read<ForgotPasswordBloc>().add(
                              ForgotPasswordDataEvent(
                                  phoneNumber: phoneController.text
                                      .replaceAll("-", "")));
                        }
                      },
                      text: tr("continue"),
                      color: Pallate.mainColor,
                      width: 350,
                      height: 58,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
