# ass_3

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


```
lib/
│
├── app/                        # App bootstrapper, routing, global theme definitions
│   ├── app.dart
│   └── routes.dart
│
├── core/                       # Shared platform wrappers, core UI design tokens, network clients
│   ├── network/                # Shared Dio instance, interceptors
│   └── theme/                  # Design systems, common widgets
│
└── features/                   # Feature-driven boundaries
    ├── authentication/         # Example Feature: Auth
    └── checkout/               # Example Feature: Checkout
        ├── data/               # Data Layer: APIs, models, repo implementations
        │   ├── datasources/    # Remote API callers & local persistent storage
        │   ├── models/         # JSON serializable data transfer objects
        │   └── repositories/   # Concrete repository implementations
        │
        ├── domain/             # Domain Layer: Pure Dart logic (Zero external dependencies)
        │   ├── entities/       # Immutable business models (e.g., using Freezed)
        │   ├── repositories/   # Abstract repository contracts (interfaces)
        │   └── usecases/       # Unique, single business logic rules
        │
        └── presentation/       # Presentation Layer: Framework UI components
            ├── blocs/          # State management (BLoC/Cubit)
            ├── pages/          # Full screen views
            └── widgets/        # Component widgets unique to this feature

```

route boiler plate: 

```
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/features/authentication/presentation/pages/login_page.dart';
import 'package:my_app/features/checkout/presentation/pages/checkout_page.dart';
import 'package:my_app/features/home/presentation/pages/home_page.dart';

class AppRoutes {
  // 1. Define unique path strings as constants to prevent typos
  static const String login = '/login';
  static const String home = '/';
  static const String checkout = '/checkout';

  // 2. Configure the central router instance
  static final GoRouter router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(
        path: login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: checkout,
        builder: (context, state) {
          // Extra data or arguments passed during navigation can be extracted here
          final cartId = state.extra as String?;
          return CheckoutPage(cartId: cartId);
        },
      ),
    ],
    // 3. Centralized route guard (e.g., Redirect to login if unauthenticated)
    redirect: (context, state) {
      final bool loggingIn = state.matchedLocation == login;
      final bool isLoggedIn = _checkUserLoginStatus(); // Global auth check

      if (!isLoggedIn && !loggingIn) return login;
      if (isLoggedIn && loggingIn) return home;
      return null;
    },
  );

  static bool _checkUserLoginStatus() => true; // Placeholder logic
}
```