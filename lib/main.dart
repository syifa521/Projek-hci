import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:basomed/pages/introduction_page.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Book Basomed',
      theme: ThemeData(
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: const IntroductionPage(),
    );
  }
}
