import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/constants/text_styles.dart';
import 'package:kids_edu_teacher/view/main_app/main_app.dart';

class ChangeLanguagePage extends StatefulWidget {
  static const routeName = '/changeLanguageScreen';

  const ChangeLanguagePage({super.key});

  @override
  State<ChangeLanguagePage> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  var list = [
    const Language("English", Locale('en')),
    const Language("Russian", Locale('ru')),
    const Language("O'zbek", Locale('uz')),
  ];
  Language? language;
  void setLocale(Locale locale) => context.setLocale(locale);

  Language getLanguageName(Locale locale) {
    for (var language in list) {
      if (language.locale == locale) return language;
    }
    return const Language("Russian", Locale("ru"));
  }

  @override
  Widget build(BuildContext context) {
    language = getLanguageName(context.locale);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          tr('languages'),
          style: TextStyles.s700r24Black,
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
      ),
      body: Column(
        children: List.generate(
          list.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              onTap: () {
                setState(() {
                  language = list[
                      index]; // Update the selected language when the ListTile is tapped
                });
                setLocale(
                    Language(list[index].nameKey, list[index].locale).locale);
                Navigator.pushNamedAndRemoveUntil(
                    context, MainAppScreen.routeName, (route) => false);
              },
              trailing: Radio(
                value: list[index],
                activeColor: Pallate.mainColor,
                groupValue: language,
                onChanged: (Language? value) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, MainAppScreen.routeName, (route) => false);
                  setLocale(
                      Language(list[index].nameKey, list[index].locale).locale);
                  setState(() {
                    language = value;
                  });
                },
              ),
              title: Text(
                list[index].nameKey,
                style: TextStyles.s600r18Black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Language {
  final String nameKey;
  final Locale locale;
  const Language(this.nameKey, this.locale);
}
