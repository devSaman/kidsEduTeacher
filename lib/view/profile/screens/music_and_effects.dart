import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';

class MusicAndEffectsPage extends StatefulWidget {
  static const routeName = '/musicAndEffectsPage';

  const MusicAndEffectsPage({super.key});

  @override
  State<MusicAndEffectsPage> createState() => _MusicAndEffectsPageState();
}

class _MusicAndEffectsPageState extends State<MusicAndEffectsPage> {
  bool isMusicEnabled = true;
  bool isSoundEnabled = true;
  bool isvibrationEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          tr('sounds'),
          style: TextStyles.s700r24Black,
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                tr('music'),
                style: TextStyles.s600r18Black,
              ),
              trailing: CupertinoSwitch(
                  activeColor: Pallate.mainColor,
                  value: isMusicEnabled,
                  onChanged: (newValue) {
                    isMusicEnabled = newValue;
                    setState(() {});
                  }),
            ),
            ListTile(
              title: Text(
                tr('sound_effects'),
                style: TextStyles.s600r18Black,
              ),
              trailing: CupertinoSwitch(
                  activeColor: Pallate.mainColor,
                  value: isSoundEnabled,
                  onChanged: (newValue) {
                    isSoundEnabled = newValue;
                    setState(() {});
                  }),
            ),
            ListTile(
              title: Text(
                tr('vibration'),
                style: TextStyles.s600r18Black,
              ),
              trailing: CupertinoSwitch(
                  activeColor: Pallate.mainColor,
                  value: isvibrationEnabled,
                  onChanged: (newValue) {
                    isvibrationEnabled = newValue;
                    setState(() {});
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
