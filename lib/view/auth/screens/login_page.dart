import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/hive_service.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/common_models/get_user_model.dart';
import 'package:kids_edu_teacher/data/repositories/main_repository.dart';
import 'package:kids_edu_teacher/view/auth/logic/login_bloc/login_bloc.dart';
import 'package:kids_edu_teacher/view/auth/screens/forgot_password.dart';
import 'package:kids_edu_teacher/view/auth/widgets/custom_button.dart';
import 'package:kids_edu_teacher/view/auth/widgets/input_widget.dart';
import 'package:kids_edu_teacher/view/main_app/main_app.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/loginPage';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var phoneFormatter = MaskTextInputFormatter(
      mask: '##-###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordControoller = TextEditingController();
  bool _isVisible1 = false;

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
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                tr('login'),
                style: TextStyles.s700r32Black,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
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
                  label: tr('password'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 40),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ForgotPasswordPage.routeName);
                  },
                  child: Text(
                    tr('forgot_password'),
                    style: TextStyles.s700r20Main,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      MainRepository.getUserData().then(
                        (res) {
                          if (res is UserModel) {
                            var favDocuments = res.data.favoritedDocuments;
                            var favVideos = res.data.favoritedVidoes;
                            for (var i = 0; i < favDocuments!.length; i++) {
                              HiveService.isItemInHive(favDocuments[i].id ?? "")
                                  ? null
                                  : HiveService.addToBox(
                                      favDocuments[i].id ?? "", "library");
                            }
                            for (var i = 0; i < favVideos!.length; i++) {
                              HiveService.isItemInHive(favVideos[i].id ?? "")
                                  ? null
                                  : HiveService.addToBox(
                                      favVideos[i].id ?? "", "video");
                            }
                          }
                          Navigator.pushNamedAndRemoveUntil(context,
                              MainAppScreen.routeName, (route) => false,
                              arguments: phoneController.text);
                        },
                      );
                    } else if (state is LoginFail) {
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
                        if (passwordControoller.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: tr('password_fill'),
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Pallate.mainColor,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (phoneController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: tr('fill_number'),
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Pallate.mainColor,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          context.read<LoginBloc>().add(LoginDataEvent(
                              phone: phoneController.text,
                              psw: passwordControoller.text));
                        }
                      },
                      text: tr("sign_in"),
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
