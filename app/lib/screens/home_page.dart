import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget searchBar() {
    return Container(
      padding: const EdgeInsets.all(32),
      child:  TextField(
        decoration: InputDecoration(
          hintText: "Yo lo",
          border:  const OutlineInputBorder(),
          prefixIcon:  Container(
            padding: const EdgeInsets.fromLTRB(2, 5, 0, 0),
            child: const FaIcon(FontAwesomeIcons.magnifyingGlass, size: 25,),
          )
          
          ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        appBar: AppBar(
          title: const Text("Hellow"),
      ),
      body: searchBar()
      )
    );
  }
}