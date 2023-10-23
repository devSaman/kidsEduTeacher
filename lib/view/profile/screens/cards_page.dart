import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
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

  @override
  Widget build(BuildContext context) {
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
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: List.generate(
                      state.userData.data.cards!.length,
                      (index) => PaymentCardWidget(
                        cardData: state.userData.data.cards![index],
                      ),
                    ),
                  ),
                )
              ]),
            );
          } else {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }
}
