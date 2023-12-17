import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_app/model/data.dart';
import 'package:my_app/ultils/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePagetState();
}

class _HomePagetState extends State<HomePage> with TickerProviderStateMixin {
  final List<Map> data = [
    {'id': 1, 'name': "Place", 'isSelected': true, 'icon': Icons.map},
    {'id': 2, 'name': "Culinary", 'isSelected': false, 'icon': Icons.food_bank},
    {'id': 3, 'name': "Hotel", 'isSelected': false, 'icon': Icons.hotel},
    {'id': 4, 'name': "Service", 'isSelected': false, 'icon': Icons.work},
    {'id': 5, 'name': "Activities", 'isSelected': false, 'icon': Icons.person},
  ];

  int priorIndex = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final my_places = Data.fetchFilter(data[currentIndex]['name']);
    // TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
        backgroundColor: mycolor,
        // appBar: AppBar(
        //   title: const Text("Homepage"),
        // ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 35, 0, 20),
            child: SingleChildScrollView(
              child: Column(children: [
                //title
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(bottom: 5),
                  child: const Text("Håfa Adai",
                      style: TextStyle(
                          fontFamily: "FiraSans",
                          fontSize: 35,
                          fontWeight: FontWeight.bold)),
                ),

                Divider(),

                //search bar
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(45),
                          alignment: Alignment.centerLeft),
                      onPressed: () {
                        Navigator.pushNamed(context, "/search");
                      },
                      icon: const Icon(Icons.search,
                          color: Color.fromRGBO(211, 211, 211, 1)),
                      label: const Text(
                        "What's in your mind",
                        style: TextStyle(
                            color: Color.fromRGBO(83, 83, 83, 0.5),
                            fontFamily: 'FiraSans',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),

                //image box
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        Container(
                          width: 1000,
                          height: 200,
                          decoration: BoxDecoration(
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.withOpacity(0.5),
                              //     spreadRadius: 1,
                              //     blurRadius: 7,
                              //     offset:
                              //         Offset(1, 7), // changes position of shadow
                              //   ),
                              // ],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/banzai0.jpg"),
                                  fit: BoxFit.fill)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                                child: Text("Banzai Cliff",
                                    style: TextStyle(
                                        fontFamily: "SourceSansPro",
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 30))),
                            Container(
                                margin: EdgeInsets.fromLTRB(21, 0, 0, 20),
                                child: Text("Saipan MP, USA",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "SourceSansPro",
                                        fontWeight: FontWeight.bold)))
                          ],
                        )
                      ]),
                ),

                // SizedBox(
                //   height: 253,
                //   child: ListView.separated(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 2,
                //     separatorBuilder: (context, index) => const SizedBox(
                //       width: 20,
                //     ),
                //     itemBuilder: (context, index) => Container(
                //         width: 335,
                //         height: 253,
                //         decoration: BoxDecoration(
                //             // boxShadow: [
                //             //   BoxShadow(
                //             //     color: Colors.grey.withOpacity(0.5),
                //             //     spreadRadius: 1,
                //             //     blurRadius: 7,
                //             //     offset:
                //             //         Offset(1, 7), // changes position of shadow
                //             //   ),
                //             // ],
                //             borderRadius: BorderRadius.circular(30),
                //             image: const DecorationImage(
                //                 image: AssetImage("assets/images/banzai.jpg"),
                //                 fit: BoxFit.fill)),
                //         child: const Text("")),
                //   ),
                // ),

                const SizedBox(
                  height: 30,
                ),

                //Popular Label
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 15),
                  child: const Text("Popular",
                      style: TextStyle(
                          fontFamily: "SourceSansPro",
                          fontSize: 30,
                          fontWeight: FontWeight.w900)),
                ),

                // Tab Bar
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SizedBox(
                      height: 36,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, index) => Container(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.fromLTRB(3, 0, 8, 0),
                                  backgroundColor: data[index]['isSelected']
                                      ? Colors.blue
                                      : Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                setState(() {
                                  data[priorIndex]['isSelected'] =
                                      !data[priorIndex]['isSelected'];

                                  priorIndex = index;

                                  data[index]['isSelected'] =
                                      !data[index]["isSelected"];

                                  currentIndex = index;
                                });
                              },
                              child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(2, 0, 0, 0),
                                  child: Row(children: [
                                    //Icon
                                    // Icon(Icons.map, color: Colors.indigo
                                    //     // color: Color.fromRGBO(251, 209, 162, 1)
                                    //     // color: Color.fromRGBO(211, 211, 211, 0.5),
                                    //     ),

                                    SizedBox(
                                      width: 5,
                                    ),

                                    //button text
                                    Text(data[index]['name'],
                                        style: TextStyle(
                                            color: data[index]['isSelected']
                                                ? Colors.white
                                                : Colors.black54,
                                            fontFamily: "SourceSansPro",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500))
                                  ]))),
                        ),
                        separatorBuilder: ((context, index) => const SizedBox(
                              width: 28,
                            )),
                      )),
                ),

                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: const Divider(
                    thickness: 2,
                    height: 23,
                  ),
                ),

                //Tab Content
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: MasonryGridView.builder(
                      padding: const EdgeInsets.only(top: 6),
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: my_places.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/detail');
                            },
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                        "assets/images/${my_places[index].name}.jpg")

                                    // Image.network(
                                    //     "https://source.unsplash.com/random/random?sig=$index")

                                    ),
                                Container(
                                    // color: Colors.grey,
                                    padding: EdgeInsets.fromLTRB(6, 4, 4, 4),
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              stringChecker(
                                                  my_places[index].displayname),
                                              style: TextStyle(
                                                  fontFamily: "SourceSansPro",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.indigoAccent),
                                            ),
                                            Text(
                                              "⭐${my_places[index].rating}",
                                            )
                                          ],
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            my_places[index].location,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    212, 212, 212, 1)),
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        );
                      })),
                )
              ]),
            )));
  }
}

String stringChecker(String name) {
  if (name.length > 15) {
    List<String> split_name = name.split(" ");
    String final_word = "${split_name[0]}\n${split_name[1]}";
    return final_word;
  }
  return name;
}

//Container(
              //     child: TabBar(
              //   controller: _tabController,
              //   labelColor: Colors.black,
              //   padding: EdgeInsets.all(0),
              //   labelPadding: const EdgeInsets.all(0),
              //   unselectedLabelColor: Colors.grey,
              //   tabs: [
              //     Tab(
              //         // text: "places",
              //         child: ElevatedButton(
              //       onPressed: null,
              //       style:
              //           ElevatedButton.styleFrom(backgroundColor: Colors.white),
              //       child: const Padding(
              //           padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              //           child: Text("Places")),
              //     )),
              //     Tab(text: "places"),
              //     Tab(text: "places"),
              //     Tab(text: "places"),
              //   ],
              // )),

              // Container(
              //     width: double.maxFinite,
              //     height: 300,
              //     child: TabBarView(
              //       controller: _tabController,
              //       children: [
              //         Text("hello"),
              //         Text("hello"),
              //         Text("hello"),
              //         Text("hello"),
              //       ],
              //     )),