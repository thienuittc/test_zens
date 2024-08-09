import 'package:flutter/material.dart';
import 'package:test_zens/core/view_models/implements/content_viewmodel.dart';
import 'package:test_zens/core/view_models/interfaces/icontent_viewmodel.dart';
import 'package:test_zens/screens/home_screen.dart';
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
        ChangeNotifierProvider<IContentViewModel>(
          create: (_) => ContentViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'ZenS',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
