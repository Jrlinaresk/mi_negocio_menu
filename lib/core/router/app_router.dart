import 'package:minegociomenu/presentation/Screens/globals/04Login/presentation/Screen/login.dart';
import 'package:minegociomenu/presentation/Screens/globals/04Login/presentation/Screen/login_screen.dart';
import 'package:minegociomenu/presentation/Screens/globals/05register/presentation/register_screen.dart';
import 'package:minegociomenu/presentation/Screens/globals/06dasboard/dashboard_screen.dart';
import 'package:minegociomenu/presentation/Screens/globals/04Login/presentation/Screen/inicio_screen.dart';
import 'package:minegociomenu/presentation/Screens/globals/07appbar/shopping_cart/cart.dart';
import 'package:minegociomenu/presentation/Screens/globals/01splash/splash.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/Screens/globals/00administracion/11administracion/administracion_categorias_screen.dart';
import '../../presentation/Screens/globals/00administracion/11administracion/administracion_clientes_screen.dart';
import '../../presentation/Screens/globals/00administracion/11administracion/administracion_mensajes_screen.dart';
import '../../presentation/Screens/globals/00administracion/11administracion/administracion_negocios_screen.dart';
import '../../presentation/Screens/globals/00administracion/11administracion/administracion_productos_screen.dart';
import '../../presentation/Screens/globals/00administracion/11administracion/administracion_screen.dart';
import '../../presentation/Screens/globals/00administracion/11administracion/administracion_ventas_screen.dart';
import '../../presentation/Screens/globals/07appbar/searchProductsScreen/search_products_screen.dart';

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
        path: '/searchproductsscreen',
        builder: (context, state) => const SearchProductsScreen(),
      ),
      GoRoute(
        path: '/shopping_cartScreen',
        builder: (context, state) => const ShoppingCartScreen(), //
      ),
      //
      //
      // administracion
      //
      //
      GoRoute(
        path: '/administracion_screen',
        builder: (context, state) => const AdministracionScreen(),
      ),
      GoRoute(
        path: '/config_datos_del_negocio',
        builder: (context, state) => const AdministracionNegociosScreen(),
      ),
      GoRoute(
        path: '/config_clientes',
        builder: (context, state) => const AdministracionClientesScreen(),
      ),
      GoRoute(
        path: '/config_productos',
        builder: (context, state) => const AdministracionProductosScreen(),
      ),
      GoRoute(
        path: '/config_categoria',
        builder: (context, state) => const AdministracionCategoriasScreen(),
      ),
      GoRoute(
        path: '/config_ventas',
        builder: (context, state) => const AdministracionVentasScreen(),
      ),
      GoRoute(
        path: '/config_mensajes',
        builder: (context, state) => const AdministracionMensajesScreen(),
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
