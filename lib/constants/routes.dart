import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_edu_teacher/data/models/common_models/courses_model.dart';
import 'package:kids_edu_teacher/data/models/shop_models/banner_model.dart';
import 'package:kids_edu_teacher/data/models/shop_models/main_model.dart';
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
import 'package:kids_edu_teacher/view/home/screens/course_info_page.dart';
import 'package:kids_edu_teacher/view/home/screens/courses_list.dart';

import 'package:kids_edu_teacher/view/home/screens/home_page.dart';
import 'package:kids_edu_teacher/view/home/screens/lesson_content_page.dart';
import 'package:kids_edu_teacher/view/home/screens/lesson_info_page.dart';
import 'package:kids_edu_teacher/view/home/screens/lesson_slider.dart';
import 'package:kids_edu_teacher/view/library/logic/get_document_collections_bloc/get_document_collections_bloc.dart';
import 'package:kids_edu_teacher/view/library/screens/collection_info_page.dart';
import 'package:kids_edu_teacher/view/library/screens/library_page.dart';
import 'package:kids_edu_teacher/view/main_app/info_page.dart';
import 'package:kids_edu_teacher/view/main_app/main_app.dart';
import 'package:kids_edu_teacher/view/profile/logic/add_card_bloc/add_card_bloc.dart';
import 'package:kids_edu_teacher/view/profile/logic/top_up_balance_bloc/top_up_balance_bloc.dart';
import 'package:kids_edu_teacher/view/profile/screens/balance_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/cards_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/change_language_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/check_for_payment.dart';
import 'package:kids_edu_teacher/view/profile/screens/coins_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/music_and_effects.dart';
import 'package:kids_edu_teacher/view/profile/screens/notification_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/profile_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/settings_page.dart';
import 'package:kids_edu_teacher/view/profile/screens/user_personal_info_page.dart';
import 'package:kids_edu_teacher/view/shop/logic/get_shop_data_bloc/get_shop_data_bloc.dart';
import 'package:kids_edu_teacher/view/shop/logic/make_order_bloc/make_order_bloc.dart';
import 'package:kids_edu_teacher/view/shop/screens/banner_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/basket_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/cart_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/categories_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/product_detail_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/shop_page.dart';
import 'package:kids_edu_teacher/view/shop/screens/successfully_purchased.dart';
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
              BlocProvider(
                create: (context) => GetShopDataBloc(),
              ),
            ],
            child: const MainAppScreen(),
          ),
        );
      case BasketPage.routeName:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => GetUserDataBloc(),
                    ),
                    BlocProvider(
                      create: (context) => MakeOrderBloc(),
                    ),
                  ],
                  child: const BasketPage(),
                ));
      case SuccessfullyPurchasedPage.routeName:
        return MaterialPageRoute(
            builder: (_) => const SuccessfullyPurchasedPage());
      case LibraryPage.routeName:
        return MaterialPageRoute(builder: (_) => const LibraryPage());
      case CoursesListPage.routeName:
        final lessons = settings.arguments as List<Course>;
        return MaterialPageRoute(
            builder: (_) => CoursesListPage(courses: lessons));
      case CourseInfoPage.routeName:
        final course = settings.arguments as Course;
        return MaterialPageRoute(
            builder: (_) => CourseInfoPage(course: course));
      case LessonInfoPage.routeName:
        final lesson = settings.arguments as Lesson;
        return MaterialPageRoute(
            builder: (_) => LessonInfoPage(lesson: lesson));
      case LessonSliderPage.routeName:
        final slides = settings.arguments as List<VideoCoverModel>;
        return MaterialPageRoute(
            builder: (_) => LessonSliderPage(slides: slides));
      case LessonContrentPage.routeName:
        final content = settings.arguments as LessonContent;
        return MaterialPageRoute(
            builder: (_) => LessonContrentPage(content: content));
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
        final data = settings.arguments as ProductDetailPage;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => GetUserDataBloc(),
                  child: ProductDetailPage(
                    product: data.product,
                    products: data.products,
                  ),
                ));
      case CoinsPage.routeName:
        return MaterialPageRoute(builder: (_) => const CoinsPage());
      case CheckForPayment.routeName:
        final coin = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetUserDataBloc(),
              ),
              BlocProvider(
                create: (context) => TopUpBalanceBloc(),
              ),
            ],
            child: CheckForPayment(coinCount: coin),
          ),
        );
      case BannerPage.routeName:
        final bannerId = settings.arguments as BannerModel;
        return MaterialPageRoute(
            builder: (_) => BannerPage(bannerId: bannerId));
      case NotificationSettingsPage.routeName:
        return MaterialPageRoute(
            builder: (_) => const NotificationSettingsPage());
      case MusicAndEffectsPage.routeName:
        return MaterialPageRoute(builder: (_) => const MusicAndEffectsPage());
      case ShopCategoriesPage.routeName:
        final category = settings.arguments as ShopMaincategories;
        return MaterialPageRoute(
            builder: (_) => ShopCategoriesPage(categoryData: category));
      case CartPage.routeName:
        return MaterialPageRoute(builder: (_) => const CartPage());
      case InfoScreen.routeName:
        return MaterialPageRoute(builder: (_) => const InfoScreen());
      case SettingsPage.routeName:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case CardsPage.routeName:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => GetUserDataBloc(),
                    ),
                    BlocProvider(
                      create: (context) => AddCardBloc(),
                    ),
                  ],
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
      case UserPesonalInfoPage.routeName:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => GetUserDataBloc(),
                  child: const UserPesonalInfoPage(),
                ));
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
