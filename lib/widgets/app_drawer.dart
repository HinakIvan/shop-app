import 'package:flutter/material.dart';
import 'package:shop_app/screens/orders.screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import 'package:shop_app/screens/user_products.dart';
import '../screens/orders.screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ), ListTile(
              leading: Icon(Icons.shop),
              title: Text('Shop'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(ProductsOverviewScreen.link);
              }
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.payment),
              title: Text('Orders'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrdersScreen.link);
              }
          ),Divider(),
          ListTile(
              leading: Icon(Icons.edit),
              title: Text('Manage Products'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(UserProductsScreen.link);
              }
          )
        ],
      ),
    );
  }
}
