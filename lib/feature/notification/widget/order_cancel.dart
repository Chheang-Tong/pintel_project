import 'package:flutter/material.dart';

class OrderCancel extends StatefulWidget {
  const OrderCancel({super.key});
  @override
  State<OrderCancel> createState() => _OrderCancelState();
}

class _OrderCancelState extends State<OrderCancel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title:Text('OrderCancel'),
        ),
       );
     }
}