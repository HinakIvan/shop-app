//отображение списка продуктов
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/badge.dart';
import '../providers/cart.dart';
import '../providers/products.dart';
import '../widgets/product_grid.dart';
import 'package:http/http.dart'as http;

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  static const String link = 'welcom_screen';

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isInit =true;
  var _isLoading = false;



@override
  didChangeDependencies(){
    if(_isInit){setState((){
      _isLoading=true;});
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {_isLoading=false;});

    }
    _isInit=false;
    super.didChangeDependencies();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (FilterOptions selectedvalue) {
                setState(() {
                  if (selectedvalue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Only Favorites'),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text('Show All'),
                      value: FilterOptions.All,
                    )
                  ]),
          Consumer<Cart>(builder:(_,cartData,ch)=> Badge(
              child: ch ?? Container() ,
              value: cartData.itemCount.toString(),),child: IconButton(
    icon: Icon(Icons.shopping_cart),
    onPressed: () {Navigator.of(context).pushNamed(CartScreen.link);},
    ),
          )],
      ),
      drawer: AppDrawer(),
      body:_isLoading?Center(child: CircularProgressIndicator(),) : ProductsGrid(_showOnlyFavorites),
    );
  }
}
