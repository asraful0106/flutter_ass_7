

import 'package:ass_3/features/home/presentation/pages/home.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  // 1. Define unique path strings as constants to prevent typos
  static const String home = "/";


  // 2. Configure the central router instance

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const Home(),
      ),
    ]
  );
}