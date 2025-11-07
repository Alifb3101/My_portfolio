import 'package:flutter/material.dart';

class trip_card extends StatefulWidget {
  final String image;
  final String title;
   const trip_card({super.key , required this.title , required this.image});

  @override
  State<trip_card> createState() => _trip_cardState();
}

class _trip_cardState extends State<trip_card> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(widget.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          alignment: Alignment.bottomLeft,
          padding:  EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black54],
            ),
          ),
          child: Text(
            widget.title,
            style:  TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
    )
        )
    );
  }
}
