import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';

class SettingsButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onTap;
  final Color color;
  const SettingsButton(
      {super.key,
      required this.text,
      required this.iconPath,
      required this.onTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
      },
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(.1),
        child: iconPath.contains(".svg")
            ? SvgPicture.asset(
                iconPath,
                width: 20,
                height: 20,
                color: color,
              )
            : Image.asset(
                iconPath,
                width: 20,
                height: 20,
                color: color,
              ),
      ),
      title: Text(
        text,
        style: TextStyles.s700r20Black,
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
