import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedx/binding/global_binding.dart';
import 'package:pokedx/ui/detail/detail_screen.dart';
import 'package:pokedx/ui/main/main_screen.dart';
import 'package:pokedx/ui/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GlobalBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Infinite Scroll - Lazy Loading',
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: "/main", page: () => const MainScreen()),
        GetPage(name: "/detail", page: () => const DetailScreen()),
        GetPage(name: "/", page: () => const SplashScreen())
      ],
      initialRoute: "/",
      // home: const SplashScreen(),
    );
  }
}
