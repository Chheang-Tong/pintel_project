import 'package:flutter/material.dart';

class OrderShipping extends StatefulWidget {
  const OrderShipping({super.key});
  @override
  State<OrderShipping> createState() => _OrderShippingState();
}

class _OrderShippingState extends State<OrderShipping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title:Text('OrderShipping'),
        ),
       );
     }
}