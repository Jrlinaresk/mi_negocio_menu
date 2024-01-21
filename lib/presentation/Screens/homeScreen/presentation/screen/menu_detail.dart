import 'package:minegociomenu/core/const.dart';
import 'package:minegociomenu/presentation/Screens/homeScreen/presentation/screen/HomeScreen.dart';
import 'package:minegociomenu/presentation/widgets/shopping_cart/agregar_restar.dart/agregar_restar.dart';
import 'package:minegociomenu/presentation/widgets/botones/itemTabCustom.dart';
import 'package:minegociomenu/presentation/Screens/products/presentation/widgets/product_list_item.dart';
import 'package:minegociomenu/domain/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuDetail extends StatefulWidget {
  Coffee coffee;

  MenuDetail({super.key, required this.coffee});

  @override
  MenuDetailState createState() => MenuDetailState();
}

class MenuDetailState extends State<MenuDetail> {
  final List<Widget> _tabViews = [
    // Lista de widgets para mostrar en cada pestaña
    const CategoriatListProductos(),
    const CategoriatListProductos(),
    const CategoriatListProductos(),
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
              backgroundColor: Colors.white,
              expandedHeight: 300.0, // Altura expandida de la appbar
              pinned: true, // Permanece visible mientras se hace scroll
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.coffee.name,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                background: Image.network(
                  'https://medias.treew.com/imgproducts/thumbs/142688.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Acción al presionar el icono de buscar
                  },
                ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: ProductListItem(
                                title: 'Nombre del producto',
                                subtitle: 'Marca',
                                date: '7USD',
                                rating: 3.5,
                                starCount: 0,
                                isFavorite: false,
                                price: const [17, 12]),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                                left: 16, right: 16.0, bottom: 8),
                            child: Divider(height: 3),
                          ),
                        ],
                      ),
                      AddToCartButton(
                        initialQuantity: 1,
                        onQuantityChanged: (newQuantity) {
                          // Lógica para manejar el cambio en la cantidad
                          print('Nueva cantidad: $newQuantity');
                        },
                      ),
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
                  Text("35USD",
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
                    onPressed: () {},
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
