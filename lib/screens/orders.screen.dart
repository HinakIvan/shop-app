import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart' show Orders;
import 'package:shop_app/widgets/app_drawer.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
static const link = 'order_screen';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, i) => OrderItem(orderData.orders[i]),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
