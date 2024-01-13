import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:minegociomenu/delegates/search_delegate.dart';
import 'package:minegociomenu/disaing/Screens/homeScreen/presentation/screen/HomeScreen.dart';
import 'package:minegociomenu/disaing/Screens/notification/presentation/screens/mNotification.dart';
import 'package:minegociomenu/disaing/Screens/profileScreen/presentation/screens/ProfileScreen.dart';
import 'package:minegociomenu/disaing/Screens/settingsScreen/presentation/screens/SettingsScreen.dart';
import 'package:minegociomenu/disaing/widgets/SliderView.dart';
import 'package:minegociomenu/disaing/widgets/mSalomonBottomBar.dart';
import 'package:minegociomenu/utils/ui/tools.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const title = 'salomon_bottom_bar';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  late String title;
  var _currentIndex = 0; // Índice seleccionado inicialmente

  void updateText_currentIndex(var value) {
    setState(() {
      _currentIndex = value;
    });
  }

  void updateText_title(var value) {
    setState(() {
      title = value;
    });
  }

  final List<Widget> _Fragment_screens = [
    // Lista de widgets para mostrar en cada pestaña
    //buttombar
    const HomeScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
    //drawer
    const mNotification(),
  ];

  @override
  void initState() {
    title = "Home";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'BalsamiqSans'),
      home: Scaffold(
        body: SafeArea(
          child: SliderDrawer(
              appBar: SliderAppBar(
                  appBarPadding: const EdgeInsets.only(left: 16),
                  appBarColor: Colors.white,
                  title: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700)),
                        ),
                      ),
/*                       IconButton(
                          onPressed: () {
                            context.push(
                              '/empresas',
                            );
                          },
                          icon: const Icon(Bootstrap.shop)), */
                      IconButton(
                          onPressed: () {
                            showToast("Funcion pendiente");
/*                             context.push(
                              '/favoritosscreen',
                            ); */
                          },
                          icon: const Icon(Icons.favorite)),
                      InkWell(
                        // borrar productdetallesscreen
                        onTap: () {
                          showToast("Funcion pendiente");
                          /*                         ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Buscar productos')));
                          showSearch(
                              context: context,
                              delegate: ItemProductoSearchDelegate(ref));
/*                           context.push(
                            '/searchproductsscreen',
                          ); */ */
                        },
                        child: const Icon(Icons.search), // Icono de búsqueda ,
                      ),
                    ],
                  )),
              key: _sliderDrawerKey,
              sliderOpenSize: 179,
              slider: SliderView(
                onItemClick: (title) {
                  _sliderDrawerKey.currentState!.closeSlider();
                  setState(() {
                    this.title = title;
                    // Utiliza una estructura condicional para asignar _currentIndex
                    if (title == "Notification") {
                      _currentIndex = 3;
                    } else if (title == "LogOut") {
                      context.push('/login');
                    }
                  });
                },
              ),
              child: Scaffold(
                body: IndexedStack(
                  index: _currentIndex,
                  children: _Fragment_screens,
                ),
                bottomNavigationBar: mSalomonBottomBar(
                    updateText_currentIndex, updateText_title),
                //child: AuthorList()
              )),
        ),
      ),
    );
  }
}
