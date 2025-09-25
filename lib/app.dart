import 'package:dark_mode_toggle/ui/features/presentation/home/controllers/app_controller.dart';
import 'package:dark_mode_toggle/ui/features/presentation/home/screens/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: AppController.instance.isDartTheme ? Brightness.dark : Brightness.light,
            ),
          ),
          home: const HomePage(title: 'Dark Mode Toggle'),
        );
      },
    );
  }
}
