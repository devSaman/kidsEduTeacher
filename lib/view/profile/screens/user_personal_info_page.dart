import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/auth/widgets/input_widget.dart';
import 'package:kids_edu_teacher/view/videos/logic/get_user_data_bloc/get_user_data_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UserPesonalInfoPage extends StatefulWidget {
  static const routeName = '/userPrsonalInfoPage';

  const UserPesonalInfoPage({super.key});

  @override
  State<UserPesonalInfoPage> createState() => _UserPesonalInfoPageState();
}

class _UserPesonalInfoPageState extends State<UserPesonalInfoPage> {
  @override
  void initState() {
    context.read<GetUserDataBloc>().add(GetUserData());
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  var dateFormatter = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          tr('personal_info'),
          style: TextStyles.s700r24Black,
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
      ),
      body: BlocBuilder<GetUserDataBloc, GetUserDataState>(
        builder: (context, state) {
          if (state is GetUserDataSuccess) {
            nameController.text = state.userData.data.fullName ?? "";
            phoneController.text = state.userData.data.phoneNumber ?? "";
            birthController.text = state.userData.data.birthDate ?? "";
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: CircleAvatar(
                        backgroundColor: Pallate.blueGradient1,
                        radius: 60,
                        child: SvgPicture.asset(
                          "assets/icons/profile_filled.svg",
                          color: Pallate.whiteColor,
                          height: 50,
                          width: 50,
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
                      padding: const EdgeInsets.only(top: 20),
                      child: InputWidget(
                        controller: phoneController,
                        label: tr('phone_number'),
                      ),
                    ),
                  ),
                  // SliverToBoxAdapter(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(top: 15),
                  //     child: InputWidget(
                  //       maxLength: 10,
                  //       inputFormatter: [
                  //         FilteringTextInputFormatter.digitsOnly,
                  //         dateFormatter
                  //       ],
                  //       inputType: TextInputType.number,
                  //       hintText: tr('hint_date'),
                  //       suffixIcon: InkWell(
                  //         onTap: () async {
                  //           // DateTime? selectedDate = await showDatePicker(
                  //           //     context: context,
                  //           //     initialDate: DateTime.now(),
                  //           //     firstDate: DateTime(1900),
                  //           //     lastDate: DateTime.now());
                  //           // setState(
                  //           //   () {
                  //           //     if (selectedDate == null) {
                  //           //       return;
                  //           //     } else {
                  //           //       birthController.text =
                  //           //           DateFormat('MM/dd/yyyy')
                  //           //               .format(selectedDate);
                  //           //     }
                  //           //   },
                  //           // );
                  //         },
                  //         child: const Icon(
                  //           Icons.calendar_month,
                  //           color: Pallate.mainColor,
                  //         ),
                  //       ),
                  //       controller: birthController,
                  //       label: tr('date_of_birth'),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
