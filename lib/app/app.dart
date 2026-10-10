import 'package:ass_3/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(423, 828),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
      ),
    );
  }
}

// // lib/app/app.dart
// import 'package:flutter/material.dart';
// import 'package:my_app/app/routes.dart'; // Import your routes file
// import 'package:my_app/core/theme/app_theme.dart'; // Example shared theme location

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Injecting MaterialApp.router tells Flutter to use GoRouter
//     return MaterialApp.router(
//       title: 'Enterprise Scaled App',
//       debugShowCheckedModeBanner: false,

//       // Global Design Token Configuration
//       theme: AppTheme.lightTheme,
//       darkTheme: AppTheme.darkTheme,
//       themeMode: ThemeMode.system,

//       // 💥 THE WIRING: Pass your router configuration from AppRoutes
//       routerConfig: AppRoutes.router,
//     );
//   }
// }
