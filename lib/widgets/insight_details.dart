import 'package:flutter/cupertino.dart';

class InsightDetails extends StatefulWidget {
  
  final String Label;
  final String count;
  
   const InsightDetails({super.key, required this.Label, required this.count});

  @override
  State<InsightDetails> createState() => _InsightDetailsState();
}

class _InsightDetailsState extends State<InsightDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.count,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              // fontSize: getResponsiveTextSize(context) * 20,
              fontSize: 20
            ),
          ),
          Text(
            widget.Label,
            textAlign: TextAlign.center,
            style: TextStyle(
              // fontSize: getResponsiveTextSize(context) * 15,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
    );
  }
}
