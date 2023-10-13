import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_edu_teacher/view/auth/logic/change_password_bloc/change_password_bloc.dart';
import 'package:kids_edu_teacher/view/auth/logic/create_account_bloc/create_account_bloc.dart';
import 'package:kids_edu_teacher/view/auth/logic/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:kids_edu_teacher/view/auth/logic/login_bloc/login_bloc.dart';
import 'package:kids_edu_teacher/view/auth/logic/verification_bloc/verification_bloc.dart';
import 'package:kids_edu_teacher/view/auth/screens/change_paasword.dart';
import 'package:kids_edu_teacher/view/auth/screens/create_account_page.dart';
import 'package:kids_edu_teacher/view/auth/screens/forgot_password.dart';
import 'package:kids_edu_teacher/view/auth/screens/login_page.dart';
import 'package:kids_edu_teacher/view/auth/screens/verification_page.dart';

import 'package:kids_edu_teacher/view/home/screens/home_page.dart';
import 'package:kids_edu_teacher/view/library/screens/collection_info_page.dart';
import 'package:kids_edu_teacher/view/library/screens/library_page.dart';
import 'package:kids_edu_teacher/view/main_app/info_page.dart';
import 'package:kids_edu_teacher/view/main_app/main_app.dart';
import 'package:kids_edu_teacher/view/profile/screens/profile_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/cart_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/product_detail_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/shop_page.dart';
import 'package:kids_edu_teacher/view/videos/screens/collection_info_page.dart';
import 'package:kids_edu_teacher/view/videos/screens/video_page.dart';
import 'package:kids_edu_teacher/view/videos/screens/video_player_page.dart';

import '../view/main_app/initial_page.dart';

abstract class Routes {
  static const String initialPage = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialPage:
        return MaterialPageRoute(builder: (_) => const InitialPage());
      case MainAppScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MainAppScreen());
      case LibraryPage.routeName:
        return MaterialPageRoute(builder: (_) => const LibraryPage());
      case VideoPage.routeName:
        return MaterialPageRoute(builder: (_) => const VideoPage());
      case ShopPage.routeName:
        return MaterialPageRoute(builder: (_) => const ShopPage());
      case ProfilePage.routeName:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case CollectionInfoPage.routeName:
        return MaterialPageRoute(builder: (_) => const CollectionInfoPage());
      case VideoPlayerScreen.routeName:
        return MaterialPageRoute(builder: (_) => const VideoPlayerScreen());
      case LibraryCollectionScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => const LibraryCollectionScreen());
      case ProductDetailPage.routeName:
        return MaterialPageRoute(builder: (_) => const ProductDetailPage());
      case CartPage.routeName:
        return MaterialPageRoute(builder: (_) => const CartPage());
      case InfoScreen.routeName:
        return MaterialPageRoute(builder: (_) => const InfoScreen());
      case CreateAccountPage.routeName:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CreateAccountBloc(),
                  child: const CreateAccountPage(),
                ));
      case VerificationPage.routeName:
        var data = settings.arguments as VerificationPage;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => VerificationBloc(),
                  child: VerificationPage(
                    phoneNumber: data.phoneNumber,
                    fromCreate: data.fromCreate,
                  ),
                ));
      case LoginPage.routeName:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginBloc(),
                  child: const LoginPage(),
                ));
      case ForgotPasswordPage.routeName:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ForgotPasswordBloc(),
                  child: const ForgotPasswordPage(),
                ));
      case ChangePasswordPage.routeName:
        final phone = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ChangePasswordBloc(),
                  child: ChangePasswordPage(
                    phone: phone,
                  ),
                ));
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
