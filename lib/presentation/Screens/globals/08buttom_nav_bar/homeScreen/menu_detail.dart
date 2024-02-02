import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/core/config/const.dart';
import 'package:minegociomenu/core/services/carrito_service.dart';
import 'package:minegociomenu/core/utils/carrito.dart';
import 'package:minegociomenu/domain/globalProviders/04shoping_car/shoping.dart';
import 'package:minegociomenu/domain/models/payment/orden/orden_whatsapp.dart';
import 'package:minegociomenu/domain/models/producto/producto.dart';
import 'package:minegociomenu/libs/shopping/model/cart_model.dart';
import 'package:minegociomenu/libs/shopping/persistent_shopping_cart.dart';
import 'package:minegociomenu/presentation/Screens/globals/07appbar/shopping_cart/cart.dart';
import 'package:minegociomenu/presentation/Screens/globals/07appbar/shopping_cart/cart_view.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/homeScreen/HomeScreen.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_fullscreen_image.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_image.dart';
import 'package:minegociomenu/presentation/widgets/shopping_cart/agregar_restar.dart/agregar_restar.dart';
import 'package:minegociomenu/presentation/widgets/botones/itemTabCustom.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/product_list_item.dart';
import 'package:minegociomenu/domain/models/producto/producto.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuDetail extends ConsumerStatefulWidget {
  Producto producto;
  var imageUrl;

  MenuDetail({super.key, required this.producto, this.imageUrl});

  @override
  MenuDetailState createState() => MenuDetailState();
}

class MenuDetailState extends ConsumerState<MenuDetail> {
  late OrdenWhatsApp orden;
  int multiplicador = 1;
  final List<Widget> _tabViews = [
    // Lista de widgets para mostrar en cada pestaña
    // const CategoriatListProductos(),
    // const CategoriatListProductos(),
    // const CategoriatListProductos(),
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double appBarHeight = AppBar().preferredSize.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              titleTextStyle: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 8.0),
              backgroundColor: Colors.white,
              expandedHeight: 300.0, // Altura expandida de la appbar
              pinned: true, // Permanece visible mientras se hace scroll
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // Verifica si la SliverAppBar está expandida o no
                  final bool isExpanded = constraints.maxHeight >
                      300.0; // Ajusta según sea necesario

                  return PreferredSize(
                    preferredSize: Size.fromHeight(isExpanded
                        ? 56.0
                        : 150.0), // Ajusta según sea necesario
                    child: FlexibleSpaceBar(
                      titlePadding: isExpanded
                          ? const EdgeInsets.only(left: 24.0, bottom: 4.0)
                          : const EdgeInsets.only(left: 48.0, bottom: 16.0),
                      title: Text(
                        widget.producto.nombre,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: isExpanded ? 14.0 : 16.0,
                        ),
                      ),
                      background: Padding(
                        padding: const EdgeInsets.only(
                            left: 32.0, right: 32.0, top: 48.0),
                        child: buildFullscreenImage(widget.imageUrl, false),
                      ),
                    ),
                  );
                },
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
/*                 IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Acción al presionar el icono de buscar
                  },
                ), */
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {
                    // Acción al presionar el icono de favoritos
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // Acción al presionar el icono de compartir
                  },
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  //primer componente
                  Stack(
                    children: [
                      Column(
                        children: [
                          Positioned(
                            left: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0),
                              child: ProductListItem(
                                subtitle: widget.producto.marca!,
                                date: '7USD',
                                rating: 4.5,
                                starCount: 0,
                                isFavorite: false,
                                price: [
                                  widget.producto.lastprice!,
                                  widget.producto.precio!
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                                left: 16, right: 16.0, bottom: 8),
                            child: Divider(
                              height: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      /* Positioned(
                        right: 0,
                        child: AddToCartButton(
                          initialQuantity: 1,
                          onQuantityChanged: (newQuantity) {
                            setState(() {
                              multiplicador = newQuantity;
                            });
                          },
                          ProductoID: widget.producto.productoID!,
                        ),
                      ), */
                    ],
                  ),
                  //tab componente
                  // Nueva sección para el TabBar
                ],
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Theme.of(context).primaryColor,
                  tabs: [
                    ItemTab_Custom(
                      title: "Opiniones",
                      v2: true,
                    ),
                    ItemTab_Custom(
                      title: "Detalles",
                      v2: true,
                    ),
                    ItemTab_Custom(
                      title: "Ofertas",
                      v2: true,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SizedBox(
                    height: screenHeight -
                        appBarHeight -
                        kToolbarHeight, // Resta la altura del appBar
                    child: TabBarView(children: _tabViews),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 136,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 48.0, right: 48.0, bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total a pagar:"),
                  Text("${widget.producto.precio!}USD",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Theme.of(context).primaryColor,
                          fontSize: 28)),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 8, // Ajusta el valor según tus necesidades
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () async {
                      orden = OrdenWhatsApp(
                        OrdenID: widget.producto
                            .productoID!, // Asigna el ID de la orden según corresponda
                        cantidad:
                            multiplicador, // Asigna la cantidad según corresponda
                        producto: widget.producto, // Asigna el producto deseado
                      );

                      //alternativa
                      // Add product to the cart
                      await PersistentShoppingCart().addToCart(
                          PersistentShoppingCartItem(
                              productId: orden.OrdenID.toString(),
                              productName: orden.producto.nombre,
                              unitPrice: orden.producto.precio!,
                              quantity: multiplicador,
                              productThumbnail: widget.imageUrl
/*                               orden.producto.ImagenUrl != null
                                  ? orden.producto.ImagenUrl!.first
                                  : null */
                              ));

                      _obtenerCarrito(ref);
                      //abrir la vista de carrito
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartView()),
                      );
                    },
                    child: const SizedBox(
                      height: 64,
                      child: Center(
                        child: Text(
                          "Agregar al carrito",
                          style: TextStyle(
                              fontFamily: 'Roboto', color: Colors.white),
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<OrdenWhatsApp>> _obtenerCarrito(ref) async {
  List<OrdenWhatsApp> carrito = [];
  Map<String, dynamic> cartData = PersistentShoppingCart().getCartData();
  List<PersistentShoppingCartItem> cartItems = cartData['cartItems'];
  double totalPriceFromData = cartData['totalPrice'];
// También puedes iterar sobre la lista cartItems si es necesario
  for (PersistentShoppingCartItem cartItem in cartItems) {
    carrito.add(OrdenWhatsApp(
        OrdenID: int.parse(cartItem.productId),
        cantidad: cartItem.quantity,
        producto: Producto(
            nombre: cartItem.productName,
            CategoriaID: 1,
            disponibilidad: cartItem.quantity,
            estado: "1",
            precio: cartItem.unitPrice,
            garantia: "1anno")));
  }
  return carrito;
}
