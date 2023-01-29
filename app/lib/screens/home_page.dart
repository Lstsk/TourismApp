import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/screens/search_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePagetState();
}

class _HomePagetState extends State<HomePage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        appBar: AppBar(
          title: const Text("Hellow"),
          
      ),
    body: const Searchbar(),
    bottomNavigationBar: Container(
      padding: const EdgeInsets.all(20),
      child:BottomNavigationBar(
      unselectedFontSize: 14,
      currentIndex: _currentIndex,
      fixedColor: Colors.black,
      type:BottomNavigationBarType.fixed,
      items: [
         BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: const FaIcon(FontAwesomeIcons.house)
          ),
          label:"Home"
          ),

          BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: const FaIcon(FontAwesomeIcons.magnifyingGlass)
          ),
          label:"Search"
          ),

          BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: const FaIcon(FontAwesomeIcons.magnifyingGlass)

          ),
          label:"text"
          ),

          BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: const FaIcon(FontAwesomeIcons.magnifyingGlass)
          ),
          label:"text"
          ),

  
         ],
         onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
         },
        ),
      )
      )
    );
  }
  }


// class HomePage extends StatelessWidget {
//   const HomePage({super.key});


//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
        
//         appBar: AppBar(
//           title: const Text("Hellow"),
          
//       ),
//     body: const Searchbar(),
//     bottomNavigationBar: BottomNavigationBar(
//       currentIndex: _currentIndex,
//       fixedColor: Colors.black,
//       items: const [
//         BottomNavigationBarItem(
//           icon: FaIcon(FontAwesomeIcons.house),
//           label:"hello"
//           ),

//           BottomNavigationBarItem(
//           icon: Icon(Icons.search),
//           label:"text"
//           ),

//           BottomNavigationBarItem(
//           icon: Icon(Icons.search),
//           label:"text"
//           ),

//           BottomNavigationBarItem(
//           icon: Icon(Icons.search),
//           label:"text"
//           ),

  
//          ],
//          onTap: (index) {
//           setState(() {

//           })
//          },
//         ),
//       )
//     );
//   }
// }