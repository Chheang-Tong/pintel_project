import 'package:flutter/material.dart';

class OrderPending extends StatefulWidget {
  const OrderPending({super.key});
  @override
  State<OrderPending> createState() => _OrderPendingState();
}

class _OrderPendingState extends State<OrderPending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title:Text('OrderPending'),
        ),
       );
     }
}