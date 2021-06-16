import 'package:flex_chart_body/app/bodyChart/providers/bodyProvider.dart';
import 'package:flex_chart_body/app/home/myApp.dart';
import 'package:flex_chart_body/app/tongueChart/providers/tonguePartsProvider.dart';
import 'package:flex_chart_body/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BodyPartsProvider>(
          create: (_) => BodyPartsProvider(),
        ),
        ChangeNotifierProvider<TonguePartsProvider>(
          create: (_) => TonguePartsProvider(),
        )
      ],
      child: MaterialApp(
        home: MyApp(),
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            actionsIconTheme: IconThemeData(color: Colors.white),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                UnifiedPracticeColors.kUnifiedPracticePrimaryColor,
              ),
              padding: MaterialStateProperty.all(
                EdgeInsets.all(20),
              ),
            ),
          ),
          primaryColor: UnifiedPracticeColors.kUnifiedPracticePrimaryColor,
          primaryTextTheme: TextTheme(
            headline6: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  );
}
