import 'package:flutter/material.dart';
import 'package:newsapp/src/screens/screens.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/theme/theme.dart';
import 'package:provider/provider.dart';

//newsapi: 642c761941314601b682b206af8aacaf
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsService(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'tabspage',
        theme: myTheme,
        routes: {
          'tabspage': (_) => TabsScreen(),
        },
        home: Scaffold(
          body: Center(
            child: Text('Hola mundo'),
          ),
        ),
      ),
    );
  }
}
