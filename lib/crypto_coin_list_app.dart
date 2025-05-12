import 'package:crypto_coin_list/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:crypto_coin_list/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto App',
      theme: darkTheme,
      routes: routes,
    );
  }
}
