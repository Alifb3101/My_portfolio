import 'package:flutter/material.dart';

class ProfileImage extends StatefulWidget {
  final String imagePath;
  final double rad;
  final Color bgcolour;
   const ProfileImage({super.key, required this.imagePath, required this.rad , this.bgcolour= Colors.white});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      // Fallback to icon if image fails to load
      return CircleAvatar(
        radius: widget.rad,
        backgroundColor: widget.bgcolour,
        child: Icon(
          Icons.person,
          size: widget.rad * 1.5,
          color: Colors.grey[400],
        ),
      );
    }

    return CircleAvatar(
      radius: widget.rad,
      backgroundColor: widget.bgcolour,
      child: ClipOval(
        child: Image.asset(
          widget.imagePath,
          fit: BoxFit.cover,
          width: widget.rad * 2,
          height: widget.rad * 2,
          errorBuilder: (context, error, stackTrace) {
            // Set error state and show fallback
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                setState(() {
                  _hasError = true;
                });
              }
            });
            return Icon(
              Icons.person,
              size: widget.rad * 1.5,
              color: Colors.grey[400],
            );
          },
        ),
      ),
    );
  }
}
