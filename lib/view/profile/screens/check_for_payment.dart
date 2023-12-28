import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/common_models/get_user_model.dart';
import 'package:kids_edu_teacher/view/main_app/main_app.dart';
import 'package:kids_edu_teacher/view/profile/logic/top_up_balance_bloc/top_up_balance_bloc.dart';
import 'package:kids_edu_teacher/view/profile/widgets/payment_card_widget.dart';
import 'package:kids_edu_teacher/view/videos/logic/get_user_data_bloc/get_user_data_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

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

  final controller = PageController(viewportFraction: 1);
  String teacherId = "";
  int cardIndex = 0;
  List<UserCardsModel> cards = [];
  bool isButtonPressed = false;

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
                                  teacherId = state.userData.data.id.toString();
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
              child: Column(
                children: [
                  const SizedBox(height: 150),
                  RichText(
                    text: TextSpan(
                      text: tr('payment_desc'),
                      style: TextStyles.s400r16Black,
                      children: [
                        TextSpan(
                            text: tr('public_offer'),
                            style: const TextStyle(color: Pallate.mainColor)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<GetUserDataBloc, GetUserDataState>(
                    builder: (context, state) {
                      if (state is GetUserDataSuccess) {
                        cards.clear();
                        for (var i = 0;
                            i < state.userData.data.cards!.length;
                            i++) {
                          if (state.userData.data.cards![i].isVerified!) {
                            cards.add(state.userData.data.cards![i]);
                          }
                        }
                        return Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 140,
                              width: double.infinity,
                              child: PageView.builder(
                                onPageChanged: (data) {
                                  setState(() {
                                    cardIndex = data;
                                  });
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: cards.length,
                                physics: const BouncingScrollPhysics(),
                                controller: controller,
                                itemBuilder: (context, index) {
                                  return PaymentCardWidget(
                                    isForPayment: true,
                                    cardData: cards[index],
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              right: 0,
                              left: 0,
                              bottom: 0,
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                height: 4,
                                child: SmoothPageIndicator(
                                  controller: controller,
                                  count: cards.length,
                                  effect: const WormEffect(
                                    dotColor: Pallate.redGradient1,
                                    activeDotColor: Pallate.mainColor,
                                    dotHeight: 5,
                                    dotWidth: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: Pallate.mainColor,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocConsumer<TopUpBalanceBloc, TopUpBalanceState>(
                    listener: (context, state) {
                      if (state is TopUpBalanceSuccess) {
                        isButtonPressed = false;
                        AwesomeDialog(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          dismissOnTouchOutside: false,
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.rightSlide,
                          title: tr('success_payment'),
                          desc: tr('success_payment_description',
                              args: [widget.coinCount.toString()]),
                          // btnCancelOnPress: () {},
                          btnOkColor: Pallate.green,
                          btnOkOnPress: () async {
                            Navigator.pushNamedAndRemoveUntil(context,
                                MainAppScreen.routeName, (route) => false);
                          },
                        ).show();
                        print("SUCCES BRO");
                      } else if (state is TopUpBalanceFail) {
                        isButtonPressed = false;
                        AwesomeDialog(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: tr('fail_payment'),
                                desc: state.errorModel.message,
                                btnCancelText: tr('retry'),
                                btnCancelColor: Pallate.orange,
                                btnCancelOnPress: () {})
                            .show();
                        setState(() {});
                      }
                    },
                    builder: (context, state) {
                      return isButtonPressed
                          ? const CircularProgressIndicator.adaptive()
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  isButtonPressed = true;
                                });

                                context.read<TopUpBalanceBloc>().add(
                                      TopUpBalanceDataEvent(
                                          teacherId: teacherId,
                                          cardNumber: cards[cardIndex]
                                              .number
                                              .toString(),
                                          amount: int.parse(widget.coinCount)),
                                    );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Pallate.mainColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                width: double.infinity,
                                height: 50,
                                child: isButtonPressed
                                    ? const CircularProgressIndicator.adaptive()
                                    : Text(
                                        tr('pay'),
                                        style: TextStyles.s700r16White,
                                      ),
                              ),
                            );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
