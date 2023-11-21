import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/videos/logic/get_user_data_bloc/get_user_data_bloc.dart';

class CheckForPayment extends StatefulWidget {
  final String coinCount;
  static const routeName = '/checkForPayment';

  const CheckForPayment({super.key, required this.coinCount});

  @override
  State<CheckForPayment> createState() => _CheckForPaymentState();
}

class _CheckForPaymentState extends State<CheckForPayment> {
  final amountFormat = NumberFormat("#,##0 000  ", "en_US");

  @override
  void initState() {
    context.read<GetUserDataBloc>().add(GetUserData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          tr('check_for_payment'),
          style: TextStyles.s700r24Black,
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Pallate.greyColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tr('receiver'),
                              style: TextStyles.s500r18grey,
                            ),
                            const Text(
                              "KidsEdu",
                              style: TextStyles.s700r16Main,
                            )
                          ]),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Pallate.greyColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tr('amount'),
                              style: TextStyles.s500r18grey,
                            ),
                            widget.coinCount != ""
                                ? Text(
                                    amountFormat
                                            .format(
                                                int.parse(widget.coinCount) *
                                                    1000)
                                            .replaceAll(",", " ") +
                                        tr('sum'),
                                    style: TextStyles.s700r16Main)
                                : const Center()
                          ]),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Pallate.greyColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tr('sender'),
                              style: TextStyles.s500r18grey,
                            ),
                            BlocBuilder<GetUserDataBloc, GetUserDataState>(
                              builder: (context, state) {
                                if (state is GetUserDataSuccess) {
                                  return Text(
                                    state.userData.data.fullName.toString(),
                                    style: TextStyles.s700r16Main,
                                  );
                                }
                                return const SizedBox();
                              },
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Pallate.mainColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    width: double.infinity,
                    height: 50,
                    child: Text(
                      tr('pay'),
                      style: TextStyles.s700r16White,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
