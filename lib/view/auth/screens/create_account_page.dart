import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/auth/logic/create_account_bloc/create_account_bloc.dart';
import 'package:kids_edu_teacher/view/auth/screens/verification_page.dart';
import 'package:kids_edu_teacher/view/auth/widgets/custom_button.dart';
import 'package:kids_edu_teacher/view/auth/widgets/date_input.dart';
import 'package:kids_edu_teacher/view/auth/widgets/input_widget.dart';
import 'package:kids_edu_teacher/view/auth/widgets/phone_number_mask.dart';

class CreateAccountPage extends StatefulWidget {
  static const routeName = '/createAccountPage';

  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordControoller = TextEditingController();
  TextEditingController rePasswordControoller = TextEditingController();
  TextEditingController birthController = TextEditingController();
  bool _isVisible = false;
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
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: InputWidget(
                  controller: nameController,
                  label: tr('full_name'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: InputWidget(
                  maxLength: 10,
                  inputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                    DateOfBirthTextInputFormatter()
                  ],
                  inputType: TextInputType.number,
                  hintText: tr('hint_date'),
                  suffixIcon: InkWell(
                    onTap: () {
                      print("ddd");
                    },
                    child: const Icon(
                      Icons.calendar_month,
                      color: Pallate.mainColor,
                    ),
                  ),
                  controller: birthController,
                  label: tr('date_of_birth'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: InputWidget(
                  maxLength: 12,
                  inputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                    CustomPhoneNumberTextInputFormatter()
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
                  label: tr('re_password'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 25),
                child: BlocConsumer<CreateAccountBloc, CreateAccountState>(
                  listener: (context, state) {
                    if (state is CreateAccountSuccess) {
                      Navigator.pushNamed(context, VerificationPage.routeName);
                    } else if (state is CreateAccountFail) {
                      print("dd");
                      Fluttertoast.showToast(
                          msg: state.errorModel.message.toString(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Pallate.mainColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      onTap: () {
                        context.read<CreateAccountBloc>().add(
                            CreateAccountDataEvent(
                                fullName: nameController.text,
                                psw: passwordControoller.text,
                                birthDate: birthController.text,
                                phone:
                                    phoneController.text.replaceAll("-", "")));
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
