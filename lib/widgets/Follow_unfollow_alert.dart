import 'package:flutter/material.dart';

class FollowUnfollowAlert {
  static void show({required BuildContext context, required bool isFollowed}) {
    final message =
        isFollowed
            ? 'Thanks for liking my portfolio! 💚'
            : "You Don't like my portfolio 😢";
    final bgColor = isFollowed ? Colors.green.shade100 : Colors.red.shade100;
    final emoji = isFollowed ? '💚' : '😢';

    final overlay = OverlayEntry(
      builder:
          (context) => Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Material(
              color: Colors.transparent,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(emoji, style: TextStyle(fontSize: 24)),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );

    Overlay.of(context).insert(overlay);

    // Auto remove after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      overlay.remove();
    });
  }
}
