import 'package:flutter/material.dart';
import 'package:instantpredictor/res/constants/routes/app_pages.dart';
import 'package:instantpredictor/res/constants/routes/approutes.dart';
import 'package:instantpredictor/viewmodel/registration_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RegistrationViewModel(),
        ),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: AppPages.routes,
        initialRoute: Approutes.initial,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
      ),
    );
  }
}
