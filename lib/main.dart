import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_for_totinsot/provider/providerop.dart';
import 'package:sample_for_totinsot/views/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => ProviderOperation(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      home: const HomePage(),
      ),
    );
  }
}


