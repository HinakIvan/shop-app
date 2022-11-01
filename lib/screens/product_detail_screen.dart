//тип страницы с информацией о продукте
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String link = 'detail_screen';

  @override
  Widget build(BuildContext ctx) {
    final productId = ModalRoute.of(ctx)?.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(ctx, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(
              loadedProduct.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '\$${loadedProduct.price}',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              loadedProduct.description,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          )
        ]),
      ),
    );
  }
}
