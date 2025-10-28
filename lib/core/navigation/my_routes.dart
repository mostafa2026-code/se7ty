import 'package:go_router/go_router.dart';
import 'package:se7ty/features/auth/presentation/login/pages/login.dart';
import 'package:se7ty/features/auth/presentation/register/pages/register_screen_doc.dart';
import 'package:se7ty/features/home/pages/home_screen.dart';
import 'package:se7ty/features/onboarding/pages/onboarding_screen.dart';
import 'package:se7ty/features/profile/pages/profile_screen.dart';
import 'package:se7ty/features/splash/pages/splash_screen.dart';
import 'package:se7ty/features/welcome/pages/welcome_screen.dart';

class MyRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String register = '/register';
  static const String profile = '/profile';
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String onboarding = '/onboarding';
  static const String terms = '/terms';
  static const String privacy = '/privacy';
  static final GoRouter myroutes = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(path: home, builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => LoginScreen(type: state.extra as Enum),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => RegisterScreen(type: state.extra as Enum),
      ),
    ],
  );
}
