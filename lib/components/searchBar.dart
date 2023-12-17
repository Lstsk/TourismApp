import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Row(children: [
      //search bar
      Expanded(
        flex: 5,
        child: Container(
          height: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              icon: Icon(Icons.search, color: style.color),
              suffixIcon: widget.text.isNotEmpty
                  ? GestureDetector(
                      child: const Icon(Icons.close, color: Colors.black54),
                      onTap: () {
                        controller.clear();
                        widget.onChanged('');
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Color.fromRGBO(211, 211, 211, 1)),
              border: InputBorder.none,
            ),
            style: style,
            onChanged: widget.onChanged,
          ),
        ),
      ),

      //return button
      Expanded(
        flex: 1,
        child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel")),
      )
    ]);
  }
}




// import 'package:flutter/material.dart';

// class SearchWidget extends StatefulWidget {
//   final String text;
//   final ValueChanged<String> onChanged;
//   final String hintText;

//   const SearchWidget({
//     Key? key,
//     required this.text,
//     required this.onChanged,
//     required this.hintText,
//   }) : super(key: key);

//   @override
//   _SearchWidgetState createState() => _SearchWidgetState();
// }

// class _SearchWidgetState extends State<SearchWidget> {
//   final controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final styleActive = TextStyle(color: Colors.black);
//     final styleHint = TextStyle(color: Colors.black54);
//     final style = widget.text.isEmpty ? styleHint : styleActive;

//     return Container(
//       width: 400,
//       height: 38,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           icon: Icon(Icons.search, color: style.color),
//           suffixIcon: widget.text.isNotEmpty
//               ? GestureDetector(
//                   child: const Icon(Icons.close, color: Colors.black54),
//                   onTap: () {
//                     controller.clear();
//                     widget.onChanged('');
//                     FocusScope.of(context).requestFocus(FocusNode());
//                   },
//                 )
//               : null,
//           hintText: widget.hintText,
//           hintStyle: TextStyle(color: Color.fromRGBO(211, 211, 211, 1)),
//           border: InputBorder.none,
//         ),
//         style: style,
//         onChanged: widget.onChanged,
//       ),
//     );
//   }
// }
