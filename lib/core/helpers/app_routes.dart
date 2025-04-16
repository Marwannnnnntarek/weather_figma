import 'package:go_router/go_router.dart';
import 'package:myapp/features/cover/presentation/views/cover_view.dart';
import 'package:myapp/features/home/presentation/views/home_view.dart';
import 'package:myapp/features/login/presentation/views/login_view.dart';
import 'package:myapp/features/register/presentation/views/register_view.dart';
import 'package:myapp/features/search/presentation/views/search_view.dart';
import 'package:myapp/features/start/presentation/views/start_view.dart';
import 'package:myapp/features/auth/presentation/screens/verification_screen.dart';

abstract class AppRouters {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const CoverView()),
      GoRoute(
        path: '/StartView',
        builder: (context, state) => const StartView(),
      ),
      GoRoute(
        path: '/RegisterView',
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(path: '/HomeView', builder: (context, state) => const HomeView()),
      GoRoute(
        path: '/LoginView',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/SearchView',
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: '/VerificationScreen',
        builder: (context, state) {
          final email = state.extra as Map<String, String>?;
          return VerificationScreen(
            email: email?['email'] ?? '',
            password: email?['password'] ?? '',
          );
        },
      ),
    ],
  );
}
