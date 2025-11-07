import 'package:flutter/cupertino.dart';
import 'package:travel_blogger/pages/responsive.dart';

import 'Text_widget.dart';

class btn_widget extends StatefulWidget {
  final String Text ;
  final Color bgcolour;
  const btn_widget({super.key, required this.Text ,required this.bgcolour });

  @override
  State<btn_widget> createState() => _insights_rowState();
}

class _insights_rowState extends State<btn_widget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: getHeight(context) * 0.045,
            width: getWidth(context) * 0.2,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.bgcolour,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: widget.bgcolour.withOpacity(0.4),
                    offset:  Offset(0, 4),
                    blurRadius: 10,
                  ),
                ]
            ),

            child: TextWidget(Text: widget.Text, textsize: getResponsive(context) * 15, textColour: CupertinoColors.white, fw: FontWeight.w900,)),
      ],
    );
  }
}
