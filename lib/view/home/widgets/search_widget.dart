import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';

class SearchHouses extends SearchDelegate {
  final BuildContext context;
  SearchHouses(this.context);
  @override
  List<Widget>? buildActions(BuildContext context) => null;

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  String? get searchFieldLabel => 'Поиск';

  @override
  Widget buildResults(BuildContext context) => const SizedBox();

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: Pallate.greyColor,
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.only(top: 4.0),
        color: Pallate.whiteColor,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0, top: 32.0, right: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Недавние поиски',
                style: TextStyles.s600r10Black,
              ),
              // Flexible(
              //   child: ListView.builder(
              //     itemCount: 25,
              //     itemBuilder: (context, index) => Container(
              //       margin: const EdgeInsets.symmetric(vertical: 16.0),
              //       child: const Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Flexible(
              //             child: Text(
              //               'Дом',
              //               maxLines: 1,
              //               overflow: TextOverflow.fade,
              //             ),
              //           ),
              //           Icon(Icons.remove),
              //         ],
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
