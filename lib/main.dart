import 'package:flutter/material.dart';
import 'package:my_app/pages/details.dart';
import 'package:my_app/pages/homepage.dart';
import 'package:my_app/pages/mappage.dart';
import 'package:my_app/pages/searchpage.dart';
import 'package:my_app/ultils/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Map routes = {
    "/": (context) => const HomePage(),
    "/search": (context) => const SearchPage(),
    "/detail": (context) => const Details(),
    '/map': (context) => const MyMap()
  };

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        final String? name = settings.name;
        final Function? pageContentBuilder = routes[name];

        if (pageContentBuilder != null) {
          if (settings.arguments != null) {
            final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context, arguments: settings.arguments),
            );
            return route;
          } else {
            final Route route = MaterialPageRoute(
                builder: (context) => pageContentBuilder(context));
            return route;
          }
        }
        return null;
      },
    );
  }
}
