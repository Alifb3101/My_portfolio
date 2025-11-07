import 'package:flutter/material.dart';
import 'package:travel_blogger/widgets/Text_widget.dart';

import '../widgets/destination_container.dart';

class destination_page extends StatefulWidget {
  const destination_page({super.key});

  @override
  State<destination_page> createState() => _destination_pageState();
}

class _destination_pageState extends State<destination_page> {
  List<Map<String, String>> Destinationplaces = [
    {
      "image": "assets/upcoming_destination/brazil.jpeg",
      "place": "Brazil",
      "activity": "Exploring Brazil",
      "month": "july",
    },
    {
      "image": "assets/upcoming_destination/canada.jpeg",
      "place": "Canada",
      "activity": "Exploring Canada",
      "month": "Auguest",
    },
    {
      "image": "assets/upcoming_destination/maldives.jpeg",
      "place": "Maldives",
      "activity": "Exploring Maldives",
      "month": "september",
    },
    {
      "image": "assets/upcoming_destination/new zeland.jpeg",
      "place": "New Zeland",
      "activity": "Exploring New Zeland",
      "month": "Octomber",
    },
    {
      "image": "assets/upcoming_destination/paris.jpg",
      "place": "Paris",
      "activity": "Exploring paris",
      "month": "November",
    },
    {
      "image": "assets/upcoming_destination/vietnam.jpeg",
      "place": "Vietnam",
      "activity": "Exploring Vietnam",
      "month": "December",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
              height: 30,
              width: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // gradient: LinearGradient(colors: [Color(0xFFDDEEFF), Color(0xFFFFFFFF)]),
              ),
              child: TextWidget(Text: "MY Upcoming Destinations :-", textsize: 18 , fw: FontWeight.bold,)),
        ),
        Expanded(
          child: Container(
            color: Colors.white12,
            child: ListView.builder(
              itemCount: Destinationplaces.length,
              itemBuilder: (context, index) {
                final item = Destinationplaces[index];
                return DestinationContainer(
                  image: "${item['image']}",
                  title: "${item['place']}",
                  info: "${item['activity']}",
                  when: "In ${item['month']} Month ",
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
