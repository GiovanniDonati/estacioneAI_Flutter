import 'package:flutter/material.dart';

class PositionPage extends StatefulWidget {
  final String title;
  const PositionPage({super.key, required this.title});

  @override
  State<PositionPage> createState() => _PositionPageState();
}

class _PositionPageState extends State<PositionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title),backgroundColor: Colors.red),
      ));
  }
}