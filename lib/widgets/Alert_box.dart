import 'package:flutter/material.dart';
import 'package:travel_blogger/widgets/Text_widget.dart';

class ContactUsDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.white,
        child: Padding(
          padding:  EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
               SizedBox(height: 20),

              _buildContactItem(Icons.phone, 'Phone', '9909085071'),
               SizedBox(height: 10),

              _buildContactItem(Icons.email, 'Email', 'alifb3101@example.com'),
               SizedBox(height: 10),

              _buildContactItem(Icons.location_on, 'Address', 'WTT , Sanand Circle'),
               SizedBox(height: 20),

              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child:  TextWidget(Text: "Close", textsize: 15 , fw: FontWeight.w800, textColour: Colors.white,),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildContactItem(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.teal),
         SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}