import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profit/components/time_card.dart';
import 'package:flutter_profit/components/value_card.dart';

class CalcProfitScreen extends StatefulWidget {
  @override
  _CalcProfitScreenState createState() => _CalcProfitScreenState();
}

class _CalcProfitScreenState extends State<CalcProfitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueCard(
                value: 1000,
                maxValue: 5000,
                title: 'Insira o valor inicial',
                height: 180,
                mode: 'edit'),
            ValueCard(
                value: 100,
                maxValue: 5000,
                title: 'Insira o valor dos aportes',
                height: 180,
                mode: 'edit'),
            TimeCard(
              value: 1,
              maxValue: 200,
              title: 'Qual o prazo?',
            ),
          ],
        ),
      ),
    );
  }
}

AppBar customAppBar() {
  return AppBar(
    title: Text('Calculadora'),
  );
}

Drawer buildDrawer(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Text('Calc'),
          decoration: BoxDecoration(
            color: Colors.black12,
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text('Dashboard'),
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text('Calculadora'),
          onTap: () {
            Navigator.pushNamed(context, '/calc');
          },
        ),
      ],
    ),
  );
}
