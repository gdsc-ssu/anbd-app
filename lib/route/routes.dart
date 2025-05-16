import 'package:anbd/screens/auth/login/login_screen.dart';
import 'package:anbd/screens/auth/signup/category/category_screen.dart';
import 'package:anbd/screens/auth/signup/location/location_screen.dart';
import 'package:anbd/screens/auth/signup/question/question_screen.dart';
import 'package:anbd/screens/home/share_post/image/image_select_screen.dart';
import 'package:anbd/screens/home/share_post/share_post_create_screen.dart';
import 'package:anbd/screens/mypage/mypage_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:anbd/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:anbd/screens/home/home_screen.dart';
import 'package:anbd/screens/onboarding/onboarding_screen.dart';
import 'package:anbd/screens/home/detail/detail_screen.dart';
import 'package:anbd/screens/loading/loading_screen.dart';
import 'package:anbd/constants/paths.dart';
import 'package:anbd/screens/mypage/liked/liked_screen.dart';
import 'package:anbd/screens/home/search/search_screen.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';

class AppRouter {
  static late GoRouter router;

  static Future<void> setupRouter() async {
    final prefs = await SharedPreferences.getInstance();
    const String initialLocation = Paths.login;

    router = GoRouter(
      initialLocation: initialLocation,
      routes: [
        GoRoute(
          path: Paths.onboarding,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: Paths.home,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: Paths.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: Paths.question,
          builder: (context, state) => QuestionScreen(),
        ),
        GoRoute(
          path: Paths.location,
          builder: (context, state) => LocationScreen(),
        ),
        GoRoute(
          path: Paths.category,
          builder: (context, state) => CategoryScreen(),
        ),
        GoRoute(
          path: Paths.detail,
          builder: (context, state) {
            final String id = state.pathParameters['id'] ?? '0';
            return DetailScreen(productId: id);
          },
        ),
        GoRoute(
          path: Paths.loading,
          builder: (context, state) => const LoadingScreen(),
        ),
        GoRoute(
          path: Paths.sharePost,
          builder: (context, state) => const SharePostCreateScreen(),
        ),
        GoRoute(
          path: Paths.sharePostImageSelect,
          builder: (context, state) => const ImageSelectScreen(),
        ),
        GoRoute(
          path: Paths.mypage,
          builder: (context, state) => const MyPageScreen(),
        ),
        GoRoute(
          path: Paths.liked,
          builder: (context, state) => const LikedScreen(),
        ),
        GoRoute(
          path: Paths.chattingRoom,
          builder: (context, state) => const ChattingRoomScreen(),
        ),
        GoRoute(
          path: Paths.search,
          builder: (context, state) {
            final posts = state.extra as List<SharePostResponse>;
            return SearchScreen(allPosts: posts);
          },
        ),

      ],
    );
  }
}
