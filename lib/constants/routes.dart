import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_edu_teacher/data/models/video_models/get_all_collections_model.dart';
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
import 'package:kids_edu_teacher/view/library/logic/get_document_collections_bloc/get_document_collections_bloc.dart';
import 'package:kids_edu_teacher/view/library/screens/collection_info_page.dart';
import 'package:kids_edu_teacher/view/library/screens/library_page.dart';
import 'package:kids_edu_teacher/view/main_app/info_page.dart';
import 'package:kids_edu_teacher/view/main_app/main_app.dart';
import 'package:kids_edu_teacher/view/profile/screens/balance_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/cards_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/change_language_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/profile_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/settings_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/cart_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/product_detail_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/shop_page.dart';
import 'package:kids_edu_teacher/view/videos/logic/get_user_data_bloc/get_user_data_bloc.dart';
import 'package:kids_edu_teacher/view/videos/logic/get_video_collections_bloc/get_video_collections_bloc.dart';
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
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetVideoCollectionsBloc(),
              ),
              BlocProvider(
                create: (context) => GetUserDataBloc(),
              ),
              BlocProvider(
                create: (context) => GetDocumentCollectionsBloc(),
              ),
            ],
            child: const MainAppScreen(),
          ),
        );
      case LibraryPage.routeName:
        return MaterialPageRoute(builder: (_) => const LibraryPage());
      case VideoPage.routeName:
        return MaterialPageRoute(builder: (_) => const VideoPage());
      case ShopPage.routeName:
        return MaterialPageRoute(builder: (_) => const ShopPage());
      case ProfilePage.routeName:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case CollectionInfoPage.routeName:
        final collection = settings.arguments as VideoCollectionModel;
        return MaterialPageRoute(
            builder: (_) => CollectionInfoPage(
                  data: collection,
                ));
      case VideoPlayerScreen.routeName:
        final data = settings.arguments as VideoPlayerScreen;
        return MaterialPageRoute(
            builder: (_) => VideoPlayerScreen(
                  video: data.video,
                  listOfVideos: data.listOfVideos,
                ));
      case LibraryCollectionScreen.routeName:
        final data = settings.arguments as VideoCollectionModel;

        return MaterialPageRoute(
            builder: (_) => LibraryCollectionScreen(
                  collectionInfo: data,
                ));
      case ProductDetailPage.routeName:
        return MaterialPageRoute(builder: (_) => const ProductDetailPage());
      case CartPage.routeName:
        return MaterialPageRoute(builder: (_) => const CartPage());
      case InfoScreen.routeName:
        return MaterialPageRoute(builder: (_) => const InfoScreen());
      case SettingsPage.routeName:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case CardsPage.routeName:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => GetUserDataBloc(),
                  child: const CardsPage(),
                ));
      case BalancePage.routeName:
        return MaterialPageRoute(builder: (_) => const BalancePage());
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
      case ChangeLanguagePage.routeName:
        return MaterialPageRoute(builder: (_) => const ChangeLanguagePage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
