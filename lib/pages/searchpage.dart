import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/components/searchBar.dart';
import 'package:my_app/model/data.dart';
import 'package:my_app/ultils/color.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final mylist = Data.fetchFilter('place');
  final myCulinary = Data.fetchFilter("culinary");
  bool search = true;
  // final List<Map> myproducts

  void _runFilter(String enteredKeyword) {
    if (enteredKeyword == "banzai cliff") {}
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: mycolor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 35, 20, 20),
          child: Column(
            children: [
              SearchWidget(
                  text: "ss",
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      if (value.toString() == "banzai cliff") {
                        search = false;
                        print("yessssssss");
                      }
                    });
                  },
                  hintText: "What's in your mind"),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Column(children: [
                  //Label
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Places",
                      style: TextStyle(
                          fontFamily: "SourceSansPro",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),

                  Divider(
                    thickness: 1,
                  ),

                  //Search Content
                  Expanded(
                    child: GridView.builder(
                        padding: EdgeInsets.only(top: 10),
                        // shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: width / 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        itemCount: search ? mylist.length : 1,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/detail');
                              },
                              child: Container(
                                  width: 335,
                                  height: 253,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/${mylist[index].name}.jpg"),
                                          fit: BoxFit.fill)),
                                  child: const Text("")),
                            )),
                  ),
                ]),
              ),
              Divider(),
              Expanded(
                child: Column(children: [
                  //Label
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Culinary",
                      style: TextStyle(
                          fontFamily: "SourceSansPro",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),

                  Divider(
                    thickness: 1,
                  ),

                  //Search Content
                  Expanded(
                    child: GridView.builder(
                        padding: EdgeInsets.only(top: 10),
                        // shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: width / 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        itemCount: myCulinary.length,
                        itemBuilder: (context, index) => Container(
                            width: 335,
                            height: 253,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/${myCulinary[index].name}.jpg"),
                                    fit: BoxFit.fill)),
                            child: const Text(""))),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
