import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profit/controllers/app_controller.dart';
import 'package:flutter_profit/screens/calc_profit_screen.dart';
import 'package:flutter_profit/screens/dashboard_screen.dart';
import "package:intl/intl.dart";

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  var test = new NumberFormat('###.00', 'pt-BR');
  print('-------------------------test--------------------');
  print(test.format(150.39));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          initialRoute: '/',
          routes: {
            '/': (context) => DashboardScreen(),
            '/calc': (context) => CalcProfitScreen(),
          },
        );
      },
      animation: AppController.instance,
    );
  }
}
