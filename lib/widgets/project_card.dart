import 'package:flutter/material.dart';
import 'package:travel_blogger/pages/responsive.dart';
import 'package:travel_blogger/widgets/Text_widget.dart';
import 'package:travel_blogger/widgets/project_preview_dialog.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String? githubUrl;
  final String? liveUrl;
  final Color cardColor;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    this.githubUrl,
    this.liveUrl,
    required this.cardColor,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
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
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              margin: EdgeInsets.all(isMobile ? 8 : 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: widget.cardColor.withOpacity(_isHovered ? 0.3 : 0.1),
                    blurRadius: _isHovered ? 25 : 15,
                    offset: Offset(0, _isHovered ? 12 : 6),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    ProjectPreviewDialog.show(
                      context: context,
                      title: widget.title,
                      description: widget.description,
                      imageUrl: widget.imageUrl,
                      technologies: widget.technologies,
                      githubUrl: widget.githubUrl,
                      liveUrl: widget.liveUrl,
                      primaryColor: widget.cardColor,
                    );
                  },
                  borderRadius: BorderRadius.circular(24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image Section
                        Container(
                          height: isMobile ? getHeight(context) * 0.2 : getHeight(context) * 0.25,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                widget.cardColor,
                                widget.cardColor.withOpacity(0.7),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Icon(
                                  Icons.code,
                                  size: isMobile ? 60 : 80,
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              if (_isHovered)
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black.withOpacity(0.2),
                                          Colors.transparent,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white.withOpacity(0.5),
                                            width: 2,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.visibility,
                                          color: Colors.white,
                                          size: isMobile ? 32 : 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                    // Content Section
                    Padding(
                      padding: EdgeInsets.all(isMobile ? 16 : 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            Text: widget.title,
                            textsize: isMobile ? getResponsive(context) * 20 : getResponsive(context) * 24,
                            fw: FontWeight.bold,
                            textColour: Colors.black87,
                            Alignment: TextAlign.left,
                          ),
                          SizedBox(height: isMobile ? 8 : 12),
                          TextWidget(
                            Text: widget.description,
                            textsize: isMobile ? getResponsive(context) * 14 : getResponsive(context) * 16,
                            fw: FontWeight.w400,
                            textColour: Colors.black54,
                            Alignment: TextAlign.left,
                          ),
                          SizedBox(height: isMobile ? 12 : 16),
                          // Technologies
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: widget.technologies.map((tech) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 12 : 16,
                                  vertical: isMobile ? 6 : 8,
                                ),
                                decoration: BoxDecoration(
                                  color: widget.cardColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: widget.cardColor.withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: TextWidget(
                                  Text: tech,
                                  textsize: isMobile ? getResponsive(context) * 11 : getResponsive(context) * 12,
                                  fw: FontWeight.w600,
                                  textColour: widget.cardColor,
                                  Alignment: TextAlign.center,
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ), // Column
              ), // ClipRRect
            ), // InkWell
          ), // Material
        ), // Container
          );
        },
      ),
    );
  }
}

