import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:minegociomenu/libs/shopping/persistent_shopping_cart.dart';
import 'package:minegociomenu/presentation/Screens/globals/07appbar/shopping_cart/cart_view.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/Maps/example.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/bloc/bloc.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/homeScreen/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/profileScreen/presentation/screens/ProfileScreen.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/screens/product_category_screen.dart';
import 'package:minegociomenu/presentation/widgets/notificaciones/CustomNotificationPromo.dart';
import 'package:minegociomenu/presentation/widgets/SliderView.dart';
import 'package:minegociomenu/presentation/widgets/navigation/mBottomNavigationBar.dart';
import 'dart:ui' as ui;

import '../../../../delegates/search/search_delegate.dart';
import '../04Login/presentation/Screen/signIn_demo.dart';
import '../10notificaciones/notificaciones_screen.dart';
import '../11administracion/administracion_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const title = 'salomon_bottom_bar';

  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<DashboardScreen> {
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
  bool notificarionPromoShow = true;
  late Timer
      _timer; // Temporizador para cambiar la variable notificarionPromoShow

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

  void updateText_notificarionPromoShow(bool value) {
    setState(() {
      notificarionPromoShow = value;
    });
  }

  final List<Widget> _Fragment_screens = [
    // Lista de widgets para mostrar en cada pestaña
    //buttombar
    MenuList(),
/*     const HomeScreen(), */
    const FlutterMapOsrmExample(), // MapaScreen
    //const MBloc(),
    //drawer
    const ProfileScreen(),
    const NotificacionesScreen(),
    const AdministracionScreen(),
    const SignInDemo(),
  ];

  @override
  void initState() {
    title = "Super Market 23";
    super.initState();
    // Iniciar el temporizador para cambiar la variable cada 5 segundos
    _timer = Timer.periodic(const Duration(seconds: 120), (timer) {
      setState(() {
        if (notificarionPromoShow == false) {
          notificarionPromoShow = !notificarionPromoShow;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SliderDrawer(
              appBar: SliderAppBar(
                  appBarPadding: const EdgeInsets.only(left: 8),
                  appBarColor: const Color(0xff131A22),
                  drawerIconColor: Colors.white,
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.transparent,
                        child: Expanded(
                          child: Center(
                            child: Text(title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Row(
                    children: [
                      /*                       IconButton(
                          onPressed: () {
                            context.push(
                              '/empresas',
                            );
                          },
                          icon: const Icon(Bootstrap.shop)), */

                      InkWell(
                        // borrar productdetallesscreen
                        onTap: () {
                          //showToast("Funcion pendiente");
                                                   ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Buscar productos')));
                          showSearch(
                              context: context,
                              delegate: ItemProductoSearchDelegate(ref));
                                             context.push(
                            '/searchproductsscreen',
                          );
                        },
                        child: const Icon(
                          Icons.search,
                          color: Color(0xffFFD54B),
                        ), // Icono de búsqueda ,
                      ),
                      PersistentShoppingCart().showCartItemCountWidget(
                        cartItemCountWidgetBuilder: (itemCount) => IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartView()),
                            );
                          },
                          icon: Badge(
                            label: Text(itemCount.toString()),
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                      ),
/*                       IconButton(
                          onPressed: () {
                            //showToast("Funcion pendiente");
                            context.push(
                              '/shopping_cartScreen',
                            );
                          },
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          )), */
                      const SizedBox(
                        width: 8.0,
                      ),
                    ],
                  )),
              key: _sliderDrawerKey,
              sliderOpenSize: 200,
              slider: SliderView(
                onItemClick: (title) {
                  _sliderDrawerKey.currentState!.closeSlider();
                  setState(() {
                    this.title = title;
                    // Utiliza una estructura condicional para asignar _currentIndex
                    if (title == "Notification") {
                      _currentIndex = 4;
                    } else if (title == "LogOut") {
                      context.push('/login');
                    } else if (title == "Configuraciones") {
                      context.push('/administracion_screen');
                    }
                  });
                },
              ),
              child: Stack(
                children: [
                  Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: notificarionPromoShow
                        ? CustomNotificationPromo(
                            "Oferta especial para ti solo por hoy",
                            "Entrega gratis con tu primera orden",
                            (value) {
                              setState(() {
                                notificarionPromoShow = value;
                              });
                            },
                          )
                        : null,
                    body: Stack(
                      children: [
                        IndexedStack(
                          index: _currentIndex,
                          children: _Fragment_screens,
                        ),
                      ],
                    ),
                    bottomNavigationBar: mBottomNavigationBar(
                      updateText_currentIndex,
                      updateText_title,
                      items: [],
                    ),
                    //child: AuthorList()
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
