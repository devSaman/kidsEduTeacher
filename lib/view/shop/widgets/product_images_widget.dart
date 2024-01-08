import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/api_path.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImagesWidget extends StatelessWidget {
  final List<String> images;
  ProductImagesWidget({super.key, required this.images});
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width - 40,
          child: Stack(
            children: [
              PageView.builder(
                controller: controller,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              "${ApiPaths.basicUrl}/files/view?fileId=${images[index]}",
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  alignment: Alignment.bottomCenter,
                  height: 4,
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: images.length,
                    effect: const WormEffect(
                      dotColor: Pallate.blackColor,
                      activeDotColor: Pallate.mainColor,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 80,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            "${ApiPaths.basicUrl}/files/view?fileId=${images[index]}",
                          ),
                          fit: BoxFit.cover),
                      color: Pallate.darkGreyColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: 80,
                    height: 80,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
