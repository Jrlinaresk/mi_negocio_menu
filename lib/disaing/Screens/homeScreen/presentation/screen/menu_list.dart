import 'package:minegociomenu/const.dart';
import 'package:minegociomenu/disaing/Screens/homeScreen/presentation/screen/menu_detail.dart';
import 'package:minegociomenu/icons/my_flutter_app_icons.dart';
import 'package:minegociomenu/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  List<Coffee> coffees = [
    Coffee(coffeeIcon: Roboto.cup, name: "Espresso", price: 500),
    Coffee(coffeeIcon: Roboto.beer, name: "Cappuccino", price: 600),
    Coffee(coffeeIcon: Roboto.coffee_cup, name: "Macciato", price: 350),
    Coffee(coffeeIcon: Roboto.coffee_mug, name: "Latte", price: 150),
    Coffee(coffeeIcon: FontAwesomeIcons.coffee, name: "Mocha", price: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Divider(height: 1, color: Colors.grey.shade400),
          ListView.builder(
            shrinkWrap: true,
            itemCount: coffees.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  GestureDetector(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(20),
                      title: Text(coffees[index].name,
                          style: TextStyle(color: Colors.brown.shade800)),
                      leading: Icon(coffees[index].coffeeIcon,
                          size: 40, color: brown),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MenuDetail(coffee: coffees[index]);
                      }));
                    },
                  ),
                  Divider(height: 1, color: Colors.grey.shade400),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
