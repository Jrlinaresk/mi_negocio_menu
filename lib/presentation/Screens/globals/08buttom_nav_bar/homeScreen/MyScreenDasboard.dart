import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minegociomenu/presentation/Screens/globals/filter/CustomDialog.dart';
import 'package:minegociomenu/presentation/Screens/globals/filter/filtro_busqueda_productos.dart';
import 'package:minegociomenu/presentation/Screens/globals/filter/simple_snapping_sheet.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/homeScreen/menu_detail.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/sub_cat_custom_card.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_fullscreen_image.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_image.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/item_rv_populares.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/product_list_item.dart';
import 'package:minegociomenu/presentation/Screens/particular/presentation/products/presentation/widgets/list_productos.dart';
import 'package:minegociomenu/presentation/widgets/publicaciones/post_widget.dart';
import 'package:minegociomenu/presentation/widgets/promos/simple_promo.dart';
import 'package:minegociomenu/presentation/widgets/titles/title_de_lista.dart';
import 'package:minegociomenu/domain/models/coffee.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class MyScreen extends StatelessWidget {
  List<Coffee> coffees = [
    Coffee(
      coffeeIcon: FontAwesomeIcons.coffee,
      name: "Nombre",
      price: 500,
      moneda: "cup",
      lastprice: 200,
    ),
    Coffee(
      coffeeIcon: FontAwesomeIcons.coffee,
      name: "Nombre",
      price: 600,
      moneda: "cup",
      lastprice: 200,
    ),
    Coffee(
      coffeeIcon: FontAwesomeIcons.coffee,
      name: "Nombre",
      price: 350,
      moneda: "cup",
      lastprice: 200,
    ),
    Coffee(
      coffeeIcon: FontAwesomeIcons.coffee,
      name: "Nombre",
      price: 150,
      moneda: "cup",
      lastprice: 200,
    ),
    Coffee(
      coffeeIcon: FontAwesomeIcons.coffee,
      name: "Nombre",
      price: 500,
      moneda: "cup",
      lastprice: 200,
    ),
    Coffee(
      coffeeIcon: FontAwesomeIcons.coffee,
      name: "Nombre",
      price: 600,
      moneda: "cup",
      lastprice: 200,
    ),
    Coffee(
      coffeeIcon: FontAwesomeIcons.coffee,
      name: "Nombre",
      price: 350,
      moneda: "cup",
      lastprice: 200,
    ),
    Coffee(
      coffeeIcon: FontAwesomeIcons.coffee,
      name: "Nombre",
      price: 150,
      moneda: "cup",
      lastprice: 200,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final ScrollController listViewController = new ScrollController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 16.0, bottom: 0.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Encuentra facil lo que buscas...",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w100)),
                  IconButton(
                    icon: const Icon(Icons.tune),
                    iconSize: 24,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const CustomDialog();
                        },
                      );
/*                       showModalBottomSheet(
                        barrierColor: Colors.transparent,
                        showDragHandle: true,
                        isDismissible: true,
                        useSafeArea: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (BuildContext context) {
                          return FiltroBusquedaProductos(); //FiltroBusquedaProductos() GrabbingWidget
                        },
                      ); */
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: coffees.map((Coffee coffee) {
                    return GestureDetector(
                      child: Sub_Cat_CustomCard(
                        imageUrl:
                            'https://medias.treew.com/imgproducts/thumbs/159462.jpg',
                        text: coffee.name,
                        cardColor: const Color(0xfff6F6F6),
                        cardSize: 160,
                        price: coffee.price,
                        moneda: coffee.moneda,
                        lastprice: coffee.lastprice,
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MenuDetail(coffee: coffee);
                        }));
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            Title_List_Content(
              text: "Te recomendamos...",
              linkText: "Ver Todos",
              linkUrl: "https://example.com",
            ),
            List_productos_Widget(
              itemCount: 3,
              coffeeList: coffees,
              orientation: Axis.vertical,
            ),
            PromoWidget('https://medias.treew.com/sliders/yeyashort_spa.jpg',
                true, true),
            Title_List_Content(
              text: "Ofertas Especiales...",
              linkText: "Ver Todos",
              linkUrl: "https://example.com",
            ),
            List_productos_Widget(
                itemCount: 5,
                coffeeList: coffees,
                orientation: Axis.horizontal),
            Title_List_Content(
              text: "Populares...",
              linkText: "Ver Todos",
              linkUrl: "https://example.com",
            ),
            List_productos_Widget(
                itemCount: 5,
                coffeeList: coffees,
                orientation: Axis.horizontal),
            PromoWidget('https://medias.treew.com/sliders/yeyashort_spa.jpg',
                true, false),
            Title_List_Content(
              text: "Liquidación...",
              linkText: "Ver Todos",
              linkUrl: "https://example.com",
            ),
            List_productos_Widget(
                itemCount: 5,
                coffeeList: coffees,
                orientation: Axis.horizontal),
          ],
        ),
      ),
    );
  }
}
