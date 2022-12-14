import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const link = '/user-product';

  Future<void>_refreshProducts(BuildContext context)async{
   await Provider.of<Products>(context,listen: false).fetchAndSetProducts();
  }
  
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {Navigator.of(context).pushNamed(EditProductScreen.link);},
          )
        ],
      ),
      body: RefreshIndicator(onRefresh:()=>_refreshProducts(context) ,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: (_, i) => Column(children: [
              UserProductItem(productsData.items[i].id,
                  productsData.items[i].title, productsData.items[i].imageUrl),
              Divider()
            ]),
            itemCount: productsData.items.length,
          ),
        ),
      ),
    );
  }
}
