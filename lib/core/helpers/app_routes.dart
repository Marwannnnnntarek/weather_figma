import 'package:go_router/go_router.dart';
import 'package:myapp/features/home/presentation/views/home_view.dart';
import 'package:myapp/features/login/presentation/views/login_view.dart';
import 'package:myapp/features/register/presentation/views/register_view.dart';
import 'package:myapp/features/search/presentation/views/search_view.dart';
import 'package:myapp/features/start/presentation/views/start_view.dart';
import 'package:myapp/features/verification/presentation/views/verification_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const StartView()),
    GoRoute(path: '/LoginView', builder: (context, state) => const LoginView()),
    GoRoute(
      path: '/RegisterView',
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(path: '/HomeView', builder: (context, state) => const HomeView()),
    GoRoute(
      path: '/VerificationView',
      builder: (context, state) => VerificationView(user: state.extra as User),
    ),
    GoRoute(
      path: '/SearchView',
      builder: (context, state) => const SearchView(),
    ),
  ],
);
