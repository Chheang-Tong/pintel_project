import 'package:flutter/material.dart';

import '../../feature.dart';

class PayByABA extends StatefulWidget {
  const PayByABA({super.key});
  @override
  State<PayByABA> createState() => _PayByABAState();
}

class _PayByABAState extends State<PayByABA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scan(),
    );
  }
}
