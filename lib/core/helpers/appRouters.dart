import 'package:go_router/go_router.dart';
import 'package:myapp/features/cover/presentation/views/CoverView.dart';
import 'package:myapp/features/home/presentation/views/HomeView.dart';
import 'package:myapp/features/register/presentation/views/RegisterView.dart';
import 'package:myapp/features/start/presentation/views/startView.dart';


abstract class AppRouters {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const CoverView()),
      GoRoute(path: '/StartView', builder: (context, state) => const StartView()),
      GoRoute(path: '/RegisterView', builder: (context, state) => const RegisterView()),
        GoRoute(path: '/HomeView', builder: (context, state) => const HomeView()),
    ],
  );
}
