import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/api_path.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/constants/utils.dart';
import 'package:kids_edu_teacher/data/models/shop_models/banner_model.dart';

class BannerPage extends StatefulWidget {
  final BannerModel bannerId;
  static const routeName = '/bannerPage';

  const BannerPage({super.key, required this.bannerId});

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
        centerTitle: false,
        title: Text(
          widget.bannerId.title ?? "",
          style: TextStyles.s700r24Black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: double.infinity,
                    height: 176,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            "${ApiPaths.basicUrl}/files/view?fileId=${widget.bannerId.images?[0]}",
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.bannerId.title ?? "",
                    style: TextStyles.s700r24Black,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.bannerId.description ?? "",
                    style: TextStyles.s500r18grey,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              backgroundColor: Pallate.mainColor,
              onPressed: () {
                Utils.launchLink(link: widget.bannerId.url ?? "");
              },
              child: SvgPicture.asset(
                "assets/icons/read.svg",
                color: Pallate.whiteColor,
                height: 25,
                width: 25,
              ),
            ),
            FloatingActionButton(
              backgroundColor: Pallate.mainColor,
              onPressed: () {
                Utils.phoneCall(number: widget.bannerId.adminPhoneNumber ?? "");
              },
              child: SvgPicture.asset(
                "assets/icons/call.svg",
                color: Pallate.whiteColor,
                height: 25,
                width: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
