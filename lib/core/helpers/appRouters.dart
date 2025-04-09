import 'package:go_router/go_router.dart';
import 'package:myapp/features/cover/presentation/views/CoverView.dart';
import 'package:myapp/features/home/presentation/views/HomeView.dart';
import 'package:myapp/features/login/presentation/views/LoginView.dart';
import 'package:myapp/features/register/presentation/views/register_view.dart';
import 'package:myapp/features/start/presentation/views/start_view.dart';

abstract class AppRouters {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const CoverView()),
      GoRoute(
        path: '/StartView',
        builder: (context, state) => const StartView(),
      ),
      GoRoute(path: '/RegisterView', builder: (context, state) => const RegisterView()),
      // GoRoute(
      //   path: '/SignInScreen',
      //   builder: (context, state) => const SignInScreen(),
      // ),
      GoRoute(path: '/HomeView', builder: (context, state) => const HomeView()),
      GoRoute(
        path: '/LoginView',
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:go_router/go_router.dart';
// import 'package:myapp/core/services/auth_service.dart';
// import 'package:myapp/features/auth/presentation/screens/sign_in_screen.dart';
// import 'package:myapp/features/auth/presentation/screens/sign_up_screen.dart';
// import 'package:myapp/features/cover/presentation/views/CoverView.dart';
// import 'package:myapp/features/home/presentation/views/HomeView.dart';
// import 'package:myapp/features/start/presentation/views/startView.dart';

// abstract class AppRouters {
//   static final authService = AuthService();

//   static final router = GoRouter(
//     initialLocation: '/',
//     redirect: (context, state) {
//       final isAuth = FirebaseAuth.instance.currentUser != null;
//       final isAuthRoute = state.matchedLocation == '/signin' ||
//                          state.matchedLocation == '/signup';

//       if (!isAuth && !isAuthRoute) {
//         return '/signin';
//       }

//       if (isAuth && isAuthRoute) {
//         return '/';
//       }

//       return null;
//     },
//     routes: [
//       GoRoute(
//         path: '/',
//         builder: (context, state) => const CoverView(),
//       ),
//       GoRoute(
//         path: '/signin',
//         builder: (context, state) => const SignInScreen(),
//       ),
//       GoRoute(
//         path: '/signup',
//         builder: (context, state) => const SignUpScreen(),
//       ),
//       GoRoute(
//         path: '/StartView',
//         builder: (context, state) => const StartView(),
//       ),
//       GoRoute(
//         path: '/HomeView',
//         builder: (context, state) => const HomeView(),
//       ),
//     ],
//   );
// }
