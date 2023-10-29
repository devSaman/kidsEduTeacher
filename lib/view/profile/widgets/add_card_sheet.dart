import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/profile/logic/add_card_bloc/add_card_bloc.dart';
import 'package:kids_edu_teacher/view/profile/widgets/confirm_card_sheet.dart';
import 'package:kids_edu_teacher/view/profile/widgets/input_for_card.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddCardSheet extends StatefulWidget {
  final TextEditingController typeController;
  final TextEditingController numberController;
  final TextEditingController dateController;
  const AddCardSheet(
      {super.key,
      required this.typeController,
      required this.numberController,
      required this.dateController});

  @override
  State<AddCardSheet> createState() => _AddCardSheetState();
}

class _AddCardSheetState extends State<AddCardSheet> {
  var dateFormatter = MaskTextInputFormatter(
      mask: '##/##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var numberFormatter = MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCardBloc(),
      lazy: false,
      child: Container(
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
              InputForCard(
                  hintText: "Uzcard", controller: widget.typeController),
              InputForCard(
                inputFormatter: [
                  FilteringTextInputFormatter.digitsOnly,
                  numberFormatter
                ],
                inputType: TextInputType.number,
                controller: widget.numberController,
                maxLength: 19,
                hintText: "8600 9860 8600 9860",
              ),
              InputForCard(
                inputFormatter: [
                  FilteringTextInputFormatter.digitsOnly,
                  dateFormatter
                ],
                inputType: TextInputType.number,
                controller: widget.dateController,
                hintText: "01/20",
                maxLength: 5,
              ),
              BlocConsumer<AddCardBloc, AddCardState>(
                listener: (parentContext, state) {
                  if (state is AddCardSuccess) {
                    widget.dateController.clear();
                    widget.typeController.clear();
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ),
                      builder: (parentContext) {
                        return BlocProvider(
                            create: (context) => AddCardBloc(),
                            child: ConfirmcardSheet(
                              phone: state.successCard.data!.resultt!.phone
                                  .toString(),
                              numberController: widget.numberController,
                            ));
                      },
                    );
                  } else if (state is AddCardFail) {
                      Fluttertoast.showToast(
                        msg: state.errorData.msg.toString(),
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Pallate.mainColor,
                        textColor: Colors.white,
                      );
                  }
                },
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      if (widget.typeController.text.isEmpty) {
                        Fluttertoast.showToast(
                          msg: tr('name_required'),
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Pallate.mainColor,
                          textColor: Colors.white,
                        );
                      } else if (widget.numberController.text.isEmpty ||
                          widget.numberController.text.length < 19) {
                        Fluttertoast.showToast(
                          msg: tr('number_required'),
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Pallate.mainColor,
                          textColor: Colors.white,
                        );
                      } else if (widget.dateController.text.isEmpty ||
                          widget.dateController.text.length < 5) {
                        Fluttertoast.showToast(
                          msg: tr('date_not_valid'),
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Pallate.mainColor,
                          textColor: Colors.white,
                        );
                      } else {
                        context.read<AddCardBloc>().add(
                              AddCardDataEvent(
                                name: widget.typeController.text,
                                number: widget.numberController.text,
                                expiration: widget.dateController.text,
                                isMain: true,
                              ),
                            );
                      }
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
                        tr('add_card'),
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
