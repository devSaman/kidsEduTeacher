import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/auth/logic/change_password_bloc/change_password_bloc.dart';
import 'package:kids_edu_teacher/view/auth/widgets/custom_button.dart';
import 'package:kids_edu_teacher/view/auth/widgets/input_widget.dart';
import 'package:kids_edu_teacher/view/main_app/main_app.dart';

class ChangePasswordPage extends StatefulWidget {
  final String phone;
  static const routeName = '/changePasswordPage';

  const ChangePasswordPage({super.key, required this.phone});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController passwordControoller = TextEditingController();
  TextEditingController rePasswordControoller = TextEditingController();
  bool _isVisible = false;
  bool _isVisible1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.transparent),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),

          slivers: [
            SliverToBoxAdapter(
              child: Text(
                tr('create_new_password'),
                style: TextStyles.s700r32Black,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 16),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    tr('create_new_password_definition'),
                    textAlign: TextAlign.start,
                    style: TextStyles.s400r18Grey,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: InputWidget(
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          _isVisible1 = !_isVisible1;
                        });
                      },
                      child: _isVisible1
                          ? const Icon(
                              Icons.remove_red_eye,
                              color: Pallate.darkGreyColor,
                            )
                          : const Icon(
                              Icons.visibility_off_rounded,
                              color: Pallate.darkGreyColor,
                            )),
                  isVisible: _isVisible1,
                  controller: passwordControoller,
                  label: tr('create_new_password'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: InputWidget(
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      child: _isVisible
                          ? const Icon(
                              Icons.remove_red_eye,
                              color: Pallate.darkGreyColor,
                            )
                          : const Icon(
                              Icons.visibility_off_rounded,
                              color: Pallate.darkGreyColor,
                            )),
                  isVisible: _isVisible,
                  controller: rePasswordControoller,
                  label: tr('confirm_new_passwordd'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 90),
                child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
                  listener: (context, state) {
                    if (state is ChangePasswordSuccess) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, MainAppScreen.routeName, (route) => false);
                    } else if (state is ChangePasswordFail) {
                      Fluttertoast.showToast(
                        msg: state.errorModel.message.toString(),
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Pallate.mainColor,
                        textColor: Colors.white,
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      onTap: () {
                        if (passwordControoller.text.isEmpty ||
                            rePasswordControoller.text.isEmpty ||
                            passwordControoller.text.length < 4) {
                          Fluttertoast.showToast(
                              msg: tr('password_fill'),
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Pallate.mainColor,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (passwordControoller.text !=
                            rePasswordControoller.text) {
                          Fluttertoast.showToast(
                              msg: tr('not_match_password'),
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Pallate.mainColor,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          context.read<ChangePasswordBloc>().add(
                              ChangePasswordDataEvent(
                                  psw: passwordControoller.text,
                                  phone: widget.phone.replaceAll("-", "")));
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
            )
          ],
        ),
      ),
    );
  }
}
