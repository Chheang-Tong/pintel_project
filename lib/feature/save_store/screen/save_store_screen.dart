import 'package:flutter/material.dart';

class SaveStoreScreen extends StatefulWidget {
  const SaveStoreScreen({super.key});
  @override
  State<SaveStoreScreen> createState() => _SaveStoreScreenState();
}

class _SaveStoreScreenState extends State<SaveStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title:Text('SaveStoreScreen'),
        ),
       );
     }
}