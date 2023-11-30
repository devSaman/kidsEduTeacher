import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/api_path.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/data/models/common_models/courses_model.dart';

class LessonContrentPage extends StatefulWidget {
  final LessonContent content;
  static const routeName = '/lessonContentScreen';

  const LessonContrentPage({super.key, required this.content});

  @override
  State<LessonContrentPage> createState() => _LessonContrentPageState();
}

class _LessonContrentPageState extends State<LessonContrentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Pallate.blackColor,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Lesson",
          style: TextStyles.s700r24Black,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: List.generate(
                  widget.content.body.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  "${ApiPaths.basicUrl}/files/view?fileId=${widget.content.headerImage}",
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: double.infinity,
                          height: 230,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.content.body[index].text,
                          textAlign: TextAlign.justify,
                          style: widget.content.body[index].bold
                              ? TextStyles.s700r24Black
                              : TextStyles.s500r18grey,
                        )
                      ],
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
