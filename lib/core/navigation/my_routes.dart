import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:se7ty/features/%D9%85%D9%88%D8%A7%D8%B9%D9%8A%D8%AF/pages/appoinment.dart';
import 'package:se7ty/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:se7ty/features/auth/presentation/login/pages/login.dart';
import 'package:se7ty/features/auth/presentation/register/pages/doctor_register_complete.dart';
import 'package:se7ty/features/auth/presentation/register/pages/register_screen_doc.dart';
import 'package:se7ty/features/doctor/main/main_screen_doctor.dart';
import 'package:se7ty/features/home/pages/home_screen.dart';
import 'package:se7ty/features/home/pages/main_screen.dart';
import 'package:se7ty/features/onboarding/pages/onboarding_screen.dart';
import 'package:se7ty/features/doctor/profile/pages/profile_screen.dart';
import 'package:se7ty/features/search/page/search_screen.dart';
import 'package:se7ty/features/setting/pages/setting_screen.dart';
import 'package:se7ty/features/shared%20features/splash/pages/splash_screen.dart';
import 'package:se7ty/features/shared%20features/welcome/pages/welcome_screen.dart';

class MyRoutes {
  static const String login = '/login';
  static const String homePatient = '/homePatient';
  static const String mainPatient = '/mainPatient';
  static const String mainDoctor = '/mainDoctor';
  static const String homeDoctor = '/homeDoctor';
  static const String profileDoctor = '/profileDoctor';
  static const String profilePatient = '/profilePatient';
  static const String appoinment = '/appoinment';
  static const String search = '/search';
  static const String setting = '/setting';

  static const String register = '/register';
  static const String profile = '/profile';
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String onboarding = '/onboarding';
  static const String terms = '/terms';
  static const String privacy = '/privacy';
  static const String completedoctor = '/completedoctor';
  static final GoRouter myroutes = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(path: setting, builder: (context, state) => const SettingScreen()),

      GoRoute(
        path: mainPatient,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: mainDoctor,
        builder: (context, state) =>  MainScreenDoctor(),
      ),
      GoRoute(
        path: profilePatient,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(path: search, builder: (context, state) => const SearchScreen()),
      GoRoute(
        path: appoinment,
        builder: (context, state) => const AppointmentScreen(),
      ),

      GoRoute(
        path: homePatient,
        builder: (context, state) => const HomeScreen(),
      ),
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
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginScreen(type: state.extra as Enum),
        ),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: RegisterScreen(type: state.extra as Enum),
        ),
      ),
      GoRoute(
        path: completedoctor,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: DoctorRegisterComplete(),
        ),
      ),
    ],
  );
}
