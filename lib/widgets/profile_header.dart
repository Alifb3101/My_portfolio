import 'package:flutter/material.dart';
import 'dart:math';
import 'package:travel_blogger/pages/responsive.dart';
import 'package:travel_blogger/widgets/profile_image.dart';

import 'Text_widget.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _welcomeController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  final List<String> _welcomeTexts = [
    "Welcome to my Portfolio",
    "I'm a Mobile & Web Developer",
    "Creating Digital Solutions",
    "like My Portfolio",
  ];
  int _currentTextIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _welcomeController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(parent: _welcomeController, curve: Curves.easeOutCubic),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _welcomeController, curve: Curves.easeInOut),
    );

    _controller.forward();
    _startWelcomeAnimation();
  }

  void _startWelcomeAnimation() {
    _welcomeController.forward().then((_) {
      Future.delayed(Duration(milliseconds: 2000), () {
        if (mounted) {
          setState(() {
            _currentTextIndex = (_currentTextIndex + 1) % _welcomeTexts.length;
            _welcomeController.reset();
            _startWelcomeAnimation();
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _welcomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          child: Container(
            height: getHeight(context) * 0.25,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.transparent),
            child: Stack(
              children: [
                // Animated background with pattern
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return CustomPaint(
                        painter: _PortfolioPatternPainter(
                          animation: _controller,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF0F766E),
                                Color(0xFF0891B2),
                                Color(0xFF1E40AF),
                                Color(0xFF6366F1),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Subtle overlay pattern
                Positioned.fill(
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 800),
                    opacity: _controller.value * 0.15,
                    child: CustomPaint(painter: _OverlayPatternPainter()),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 16,
          child: Icon(Icons.arrow_back, color: Colors.white, size: 28),
        ),
        Positioned(
          bottom: -40,
          left: 0,
          right: 0,
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _welcomeController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, -_slideAnimation.value),
                    child: Opacity(
                      opacity: _fadeAnimation.value,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          _welcomeTexts[_currentTextIndex],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: getResponsive(context) * 70,
                      backgroundColor: Colors.white,
                      child: ProfileImage(
                        imagePath: 'assets/ali2.jpg',
                        rad: getResponsive(context) * 65,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 15,
          right: 15,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(_controller),
            child: Container(
              width: getWidth(context) * 0.28,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0891B2), Color(0xFF1E40AF)],
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF0891B2).withOpacity(0.4),
                    blurRadius: 15,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_outline, color: Colors.white, size: 20),
                  TextWidget(
                    Text: "Portfolio",
                    textsize: 16,
                    fw: FontWeight.w600,
                    textColour: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PortfolioPatternPainter extends CustomPainter {
  final Animation<double> animation;

  _PortfolioPatternPainter({required this.animation})
    : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white.withOpacity(0.1)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5;

    // Draw animated grid pattern
    final gridSize = 40.0;
    final offset = animation.value * gridSize;

    for (double x = -offset; x < size.width + gridSize; x += gridSize) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x + gridSize / 2, size.height),
        paint,
      );
    }

    for (double y = -offset; y < size.height + gridSize; y += gridSize) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y + gridSize / 2),
        paint,
      );
    }

    // Draw animated circles
    final circlePaint =
        Paint()
          ..color = Colors.white.withOpacity(0.05 * animation.value)
          ..style = PaintingStyle.fill;

    for (double x = 0; x < size.width; x += 100) {
      for (double y = 0; y < size.height; y += 100) {
        final radius = 20.0 + (10.0 * animation.value);
        canvas.drawCircle(Offset(x, y), radius, circlePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _PortfolioPatternPainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}

class _OverlayPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white.withOpacity(0.05)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.0;

    // Draw subtle honeycomb pattern
    final hexagonSize = 60.0;
    final sqrt3 = 1.732;

    for (double x = 0; x < size.width + hexagonSize; x += hexagonSize * 1.5) {
      for (
        double y = 0;
        y < size.height + hexagonSize;
        y += hexagonSize * sqrt3
      ) {
        final path = Path();
        for (int i = 0; i < 6; i++) {
          final angle = (60.0 * i) * (3.14159 / 180.0);
          final xPos = x + hexagonSize * cos(angle);
          final yPos = y + hexagonSize * sin(angle);

          if (i == 0) {
            path.moveTo(xPos, yPos);
          } else {
            path.lineTo(xPos, yPos);
          }
        }
        path.close();
        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
