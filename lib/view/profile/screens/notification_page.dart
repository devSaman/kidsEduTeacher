import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';

class NotificationSettingsPage extends StatefulWidget {
  static const routeName = '/notificationSettingsPage';

  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool isNotificationenabled = true;
  bool isPaymentNotificationEnabled = true;
  bool isAppNotificationenabled = true;
  bool isNewsNotificationenabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          tr('notifications'),
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
                tr('push_notifications'),
                style: TextStyles.s600r18Black,
              ),
              trailing: CupertinoSwitch(
                  activeColor: Pallate.mainColor,
                  value: isNotificationenabled,
                  onChanged: (newValue) {
                    isNotificationenabled = newValue;
                    setState(() {});
                  }),
            ),
            ListTile(
              title: Text(
                tr('payment_notification'),
                style: TextStyles.s600r18Black,
              ),
              trailing: CupertinoSwitch(
                  activeColor: Pallate.mainColor,
                  value: isPaymentNotificationEnabled,
                  onChanged: (newValue) {
                    isPaymentNotificationEnabled = newValue;
                    setState(() {});
                  }),
            ),
            ListTile(
              title: Text(
                tr('update_notification'),
                style: TextStyles.s600r18Black,
              ),
              trailing: CupertinoSwitch(
                  activeColor: Pallate.mainColor,
                  value: isAppNotificationenabled,
                  onChanged: (newValue) {
                    isAppNotificationenabled = newValue;
                    setState(() {});
                  }),
            ),
            ListTile(
              title: Text(
                tr('news_notification'),
                style: TextStyles.s600r18Black,
              ),
              trailing: CupertinoSwitch(
                  activeColor: Pallate.mainColor,
                  value: isNewsNotificationenabled,
                  onChanged: (newValue) {
                    isNewsNotificationenabled = newValue;
                    setState(() {});
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
