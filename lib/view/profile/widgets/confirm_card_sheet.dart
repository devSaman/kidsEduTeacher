import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/profile/logic/add_card_bloc/add_card_bloc.dart';
import 'package:kids_edu_teacher/view/profile/widgets/input_for_card.dart';

class ConfirmcardSheet extends StatefulWidget {
  final TextEditingController numberController;
  const ConfirmcardSheet({super.key, required this.numberController});

  @override
  State<ConfirmcardSheet> createState() => _ConfirmcardSheetState();
}

class _ConfirmcardSheetState extends State<ConfirmcardSheet> {
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCardBloc(),
      lazy: false,
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: const BoxDecoration(
          color: Pallate.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        width: double.infinity,
        height: 405,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 10),
              InputForCard(controller: codeController),
              BlocConsumer<AddCardBloc, AddCardState>(
                listener: (context, state) {
                  print(state);
                  if (state is ConfirmCardSuccess) {
                    codeController.clear();

                    Navigator.pop(context);
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      context.read<AddCardBloc>().add(
                            ConfirmCardEvent(
                                number: widget.numberController.text,
                                code: codeController.text),
                          );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Pallate.mainColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      width: double.infinity,
                      height: 50,
                      child: Text(
                        tr('confirm'),
                        style: TextStyles.s700r16White,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
