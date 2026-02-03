import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_app/presentation/screens/screens.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: FirebaseAuth.instance.currentUser == null
        ? "/login"
        : "/home",
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      final isLoggingIn = state.matchedLocation == "/login";

      if (user == null && !isLoggingIn) {
        return "/login";
      }

      if (user != null && isLoggingIn) {
        return "/home";
      }

      return null;
    },
    routes: [
      GoRoute(
        path: "/login",
        name: LoginScreen.routeName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: "/home",
        name: HomeScreen.routeName,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
