import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_edu_teacher/constants/colors.dart';
import 'package:kids_edu_teacher/view/main_app/main_app.dart';

import 'constants/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
        Locale('uz'),
      ],
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      path: "assets/translations",
      child: const KidsEduApp(),
    ),
  );
}

class KidsEduApp extends StatelessWidget {
  const KidsEduApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kids Edu',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: MainAppScreen.routeName,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        primaryColor: Pallate.mainColor,
        fontFamily: GoogleFonts.nunito().fontFamily,
      ),
    );
  }
}
