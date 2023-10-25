import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/common_models/get_user_model.dart';
import 'package:kids_edu_teacher/view/profile/logic/add_card_bloc/add_card_bloc.dart';
import 'package:kids_edu_teacher/view/profile/widgets/add_card_sheet.dart';
import 'package:kids_edu_teacher/view/profile/widgets/payment_card_widget.dart';
import 'package:kids_edu_teacher/view/videos/logic/get_user_data_bloc/get_user_data_bloc.dart';

class CardsPage extends StatefulWidget {
  static const routeName = '/cardsScreen';

  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  @override
  void initState() {
    context.read<GetUserDataBloc>().add(GetUserData());
    super.initState();
  }

  TextEditingController typeController = TextEditingController(text: "Uzcard");
  TextEditingController numberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext mainContext) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          tr('cards'),
          style: TextStyles.s700r24Black,
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
      ),
      body: BlocBuilder<GetUserDataBloc, GetUserDataState>(
        builder: (context, state) {
          if (state is GetUserDataSuccess) {
            List<UserCardsModel> cards = [];
            for (var i = 0; i < state.userData.data.cards!.length; i++) {
              if (state.userData.data.cards![i].isVerified!) {
                cards.add(state.userData.data.cards![i]);
              }
            }
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: List.generate(
                        cards.length,
                        (index) => PaymentCardWidget(
                          cardData: cards[index],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocListener<AddCardBloc, AddCardState>(
          listener: (context, state) {
            print(state);
            if (state is AddCardSuccess) {
              Navigator.pop(context);
            }
          },
          child: InkWell(
            onTap: () {
              showModalBottomSheet<void>(
                isScrollControlled: true,
                context: context,
                backgroundColor: Colors.transparent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                builder: (parentContext) {
                  return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: BlocProvider(
                        create: (context) => AddCardBloc(),
                        child: AddCardSheet(
                          numberController: numberController,
                          typeController: typeController,
                          dateController: dateController,
                        ),
                      ));
                },
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
              child: Text(
                tr('add_card'),
                style: TextStyles.s700r16White,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
