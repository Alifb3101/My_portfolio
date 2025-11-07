import 'package:flutter/material.dart';
import 'package:travel_blogger/pages/responsive.dart';

class icon_btn extends StatefulWidget {
  final String icons;
  final Color bgcolour;
  final LinearGradient colour;
  final VoidCallback? onTap;

   const icon_btn({super.key , required this.icons , required this.bgcolour , required this.colour, this.onTap});

  @override
  State<icon_btn> createState() => _icon_btnState();
}

class _icon_btnState extends State<icon_btn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: WidgetStateMouseCursor.clickable,
      onHover: (value) {

      },
      onTap: widget.onTap,
      child: Container(
        height: getHeight(context) * 0.05,
        width: getWidth(context) * 0.11,
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: widget.colour,
          color: widget.bgcolour,
          borderRadius: BorderRadius.circular(getWidth(context)*0.09/2)

        ),
        child: IconButton(
          onPressed: widget.onTap,
          icon: Image(image: AssetImage(widget.icons)),
          iconSize: getWidth(context) * 0.02,
        ),
      ),
    );
  }
}
