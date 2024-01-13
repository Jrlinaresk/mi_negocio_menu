import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/conf/router/app_router.dart';
import 'package:minegociomenu/conf/theme/color_schemes.g.dart';
import 'package:minegociomenu/utils/app_preferences.dart';

/* void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(), //SplashScreen(),
  ));
} */

void main() async {
  runApp(const ProviderScope(child: MyApp()));
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.init();
} //ver

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(
          useMaterial3: true, colorScheme: lightColorScheme), //darkColorScheme
      title: 'Material App',
    );
  }
}
