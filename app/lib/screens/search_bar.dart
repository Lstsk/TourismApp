import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/screens/search_page.dart';
class Searchbar extends StatelessWidget {
  const Searchbar({super.key});


  Widget searchButton(BuildContext context) {
    return Container(
            margin: const EdgeInsets.all(28),
            decoration:  BoxDecoration(
              color: const Color.fromRGBO(209, 209, 209, 4000),
              borderRadius: BorderRadius.circular(8)
            ),
            width: double.infinity,
            child:  TextButton.icon(
              style: const ButtonStyle(
                alignment: Alignment.centerLeft, 
                ),
              icon: Container(
                margin: const EdgeInsets.only(left: 10),
                child:const FaIcon(FontAwesomeIcons.magnifyingGlass, size: 22,)),
              label: const Text("What's in your mind?",
              style: TextStyle(
                color: Colors.black26,
                fontSize: 17
              ),
                ),

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPage())
                );
              }
              
                )
            );
      
  }

  
  // Widget search() {
  //   return Container(
  //           padding: const EdgeInsets.all(32),
  //           child:  TextField(
  //             decoration: InputDecoration(
  //               filled:true,
  //               hintText: "Yo lo",
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(8.0),
  //                 borderSide: BorderSide.none,
  //               ),
  //               prefixIcon:  Container(
  //                 padding: const EdgeInsets.fromLTRB(10, 12, 0, 0),
  //                 child: const FaIcon(FontAwesomeIcons.magnifyingGlass, size: 22,),
  //               )
                
  //               ),
  //           ),
  //         );
  // }


  @override
  Widget build(BuildContext context) {
      return searchButton(context);
  }
}