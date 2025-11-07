import 'package:flutter/material.dart';
import 'package:travel_blogger/pages/responsive.dart';
import 'package:travel_blogger/widgets/Text_widget.dart';

class SkillCard extends StatefulWidget {
  final String skillName;
  final double proficiency;
  final IconData icon;
  final Color color;
  final List<Color> gradientColors;

  const SkillCard({
    super.key,
    required this.skillName,
    required this.proficiency,
    required this.icon,
    required this.color,
    required this.gradientColors,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: widget.proficiency).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = getWidth(context) < 600;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: EdgeInsets.all(isMobile ? 8 : 12),
        padding: EdgeInsets.all(isMobile ? 16 : 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: widget.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: widget.color.withOpacity(_isHovered ? 0.4 : 0.2),
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        ),
        transform: Matrix4.identity()
          ..scale(_isHovered ? 1.05 : 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(isMobile ? 12 : 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.icon,
                size: isMobile ? 32 : 40,
                color: Colors.white,
              ),
            ),
            SizedBox(height: isMobile ? 12 : 16),
            TextWidget(
              Text: widget.skillName,
              textsize: isMobile ? getResponsive(context) * 16 : getResponsive(context) * 18,
              fw: FontWeight.bold,
              textColour: Colors.white,
            ),
            SizedBox(height: isMobile ? 8 : 12),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  height: isMobile ? 8 : 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: _animation.value / 100,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.white.withOpacity(0.8)],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: isMobile ? 4 : 6),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return TextWidget(
                  Text: '${_animation.value.toInt()}%',
                  textsize: isMobile ? getResponsive(context) * 12 : getResponsive(context) * 14,
                  fw: FontWeight.w600,
                  textColour: Colors.white,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

