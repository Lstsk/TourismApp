import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/ultils/color.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mycolor,

        // appBar: AppBar(title: Text("Details Page")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        label: Text("Back"),
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        "Banzai Cliff",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "SourceSansPro",
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      )
                    ]),
                SizedBox(
                  height: 253,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 20,
                    ),
                    itemBuilder: (context, index) => Container(
                        width: 335,
                        height: 253,
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
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/banzai${index}.jpg"),
                                fit: BoxFit.fill)),
                        child: const Text("")),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Banzai Cliff Component
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Text("Banzai Cliff",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 35,
                                      fontFamily: "SourceSansPro",
                                      fontWeight: FontWeight.w900))),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 40,
                                color: Colors.yellow,
                              ),
                              Text("5.0",
                                  style: TextStyle(
                                      fontFamily: "SourceSansPro",
                                      fontSize: 30))
                            ],
                          )
                        ],
                      ),
                    ),
                    Text("Saipan, MP", style: TextStyle(color: Colors.black)),
                  ],
                ),

                //Buttons
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, '/map');
                          },
                          icon: Icon(Icons.location_city),
                          label: Text("Location")),
                    ),
                    ElevatedButton.icon(
                        onPressed: () async {
                          Uri phoneno = Uri.parse('tel:911');
                          if (await launchUrl(phoneno)) {
                            //dialer opened
                          } else {
                            //dailer is not opened
                          }
                        },
                        icon: Icon(Icons.phone),
                        label: Text("Phone")),
                  ],
                ),

                //Description
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text("Description",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontFamily: "SourceSansPro",
                                  fontWeight: FontWeight.w900))),
                      Container(
                          child: Text(
                        "Banzai Cliff is a historical site at the northern tip of Saipan island in the Northern Mariana Islands, overlooking the Pacific Ocean. Towards the end of the Battle of Saipan in 1944, hundreds of Japanese civilians and soldiers (of the Imperial Japanese Army) jumped off the cliff to their deaths in the ocean and rocks below, to avoid being captured by the Americans. Not far away, a high cliff named Suicide Cliff overlooks the coastal plain, and was another site of numerous suicides. At Banzai Cliff, some who jumped did not die and were captured by American ships",
                        style: TextStyle(
                            color: Color.fromARGB(255, 106, 106, 106),
                            height: 1.5),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
