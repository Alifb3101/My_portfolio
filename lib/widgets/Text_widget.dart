import 'package:flutter/cupertino.dart';

class TextWidget extends StatefulWidget {
  final String Text;
  final FontWeight fw;
  final double textsize;
  final Color textColour;
  final TextAlign Alignment;

  const TextWidget({super.key , required this.Text , this.fw = FontWeight.normal , required this.textsize , this.textColour = CupertinoColors.black , this.Alignment = TextAlign.center});

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.Text , textAlign: widget.Alignment, style: TextStyle(fontWeight: widget.fw , fontSize: widget.textsize, color: widget.textColour ),
    );
  }
}
