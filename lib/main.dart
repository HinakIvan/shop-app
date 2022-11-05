import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/screens/orders.screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/user_products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(create: (context)=>Orders())
      ],
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductsOverviewScreen(),
        initialRoute: ProductsOverviewScreen.link,
        routes: {
          ProductsOverviewScreen.link: (context) => ProductsOverviewScreen(),
          ProductDetailScreen.link: (context) => ProductDetailScreen(),
          CartScreen.link:(ctx)=>CartScreen(),
          OrdersScreen.link:(context)=>OrdersScreen(),
          UserProductsScreen.link:(context)=>UserProductsScreen(),
          EditProductScreen.link:(context)=>EditProductScreen()
        },
      ),
    );
  }
}
