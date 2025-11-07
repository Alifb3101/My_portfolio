import 'package:flutter/material.dart';
import 'package:travel_blogger/widgets/Text_widget.dart';

class DestinationContainer extends StatefulWidget {
  final String image;
  final String title;
  final String info;
  final String when;


  const DestinationContainer({super.key , required this.image , required this.title, required this.info , required this.when});

  @override
  State<DestinationContainer> createState() => _DestinationContainerState();
}

class _DestinationContainerState extends State<DestinationContainer> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white54
        ),
        height: 110,
        width: 250,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage(widget.image) , height: 80,width: 150,fit: BoxFit.fill,),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(Text: widget.title, textsize: 18 , fw: FontWeight.w700,),
                  SizedBox(height: 5,),
                  TextWidget(Text: widget.info, textsize: 15 , fw: FontWeight.w400,),
                 SizedBox(height: 8,),
                 TextWidget(Text: widget.when, textsize: 13 , fw: FontWeight.w200,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
