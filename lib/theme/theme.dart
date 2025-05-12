import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
    dividerColor: Colors.white10,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
      backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    listTileTheme: ListTileThemeData(iconColor: Colors.white),
    useMaterial3: true,
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        color: const Color.fromARGB(255, 113, 112, 112),
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
    ));
