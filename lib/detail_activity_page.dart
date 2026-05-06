import 'package:flutter/material.dart';

class DetailActivityPage extends StatelessWidget {
  final String activity;

  DetailActivityPage({required this.activity});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Aktivitas")),
      body: Center(
        child: Text(
          activity,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
