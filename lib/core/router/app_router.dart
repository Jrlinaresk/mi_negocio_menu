import 'package:minegociomenu/presentation/Screens/Login/presentation/Screen/login.dart';
import 'package:minegociomenu/presentation/Screens/Login/presentation/Screen/login_screen.dart';
import 'package:minegociomenu/presentation/Screens/Login/presentation/Screen/register_screen.dart';
import 'package:minegociomenu/presentation/Screens/dasboard/screens/dasboard.dart';
import 'package:minegociomenu/presentation/Screens/inicio/presentation/screens/inicio_screen.dart';
import 'package:minegociomenu/presentation/Screens/shopping_cart/cart.dart';
import 'package:minegociomenu/presentation/Screens/splash/screen/splash.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/inicio',
        builder: (context, state) => const InicioScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const InicioScreen(),
      ),
      GoRoute(
        path: '/registerscreen',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/dasboardscreen',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/shopping_cartScreen',
        builder: (context, state) => const ShoppingCartScreen(),
      ),
    ],
/*     redirect: (context, state) {
      final isGoingTo = state.matchedLocation;

      if (isGoingTo == '/splash') {
        return '/inicio'; // Evita redirección infinita
      }
      return '/inicio'; // Redirige a /inicio por defecto
    }, */
  );
}
