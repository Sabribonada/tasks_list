
import 'package:flutter/material.dart';
import 'package:lista_tareas/app/view/home/home_page.dart';
import 'package:lista_tareas/app/view/splash/splash_page.dart';
import 'package:lista_tareas/app/view/task_list/task_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   const primaryColor = Color(0xFF40B7AD);
   const backgroundColor = Color(0xFFF5F5F5);
   const textColor = Color(0xFF4A4A4A);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor, primaryContainer: textColor),
        scaffoldBackgroundColor: backgroundColor,
        useMaterial3: true,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Poppins',
          bodyColor: textColor,
          displayColor: textColor,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            foregroundColor:Colors.white,
            backgroundColor: primaryColor
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 35),
              padding: const EdgeInsets.symmetric(vertical: 12),
              foregroundColor: Colors.white,
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              textStyle:Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 18
              ),
            ),
        ),
      ),
      home: SplashPage(),
    );
  }
}
