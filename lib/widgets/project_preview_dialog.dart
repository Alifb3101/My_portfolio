import 'package:flutter/material.dart';
import 'package:travel_blogger/pages/responsive.dart';
import 'package:travel_blogger/widgets/Text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPreviewDialog extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String? githubUrl;
  final String? liveUrl;
  final Color primaryColor;

  const ProjectPreviewDialog({
     super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    this.githubUrl,
    this.liveUrl,
    required this.primaryColor,
  });

  static void show({
    required BuildContext context,
    required String title,
    required String description,
    required String imageUrl,
    required List<String> technologies,
    String? githubUrl,
    String? liveUrl,
    required Color primaryColor,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.7),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) {
        return ProjectPreviewDialog(
          title: title,
          description: description,
          imageUrl: imageUrl,
          technologies: technologies,
          githubUrl: githubUrl,
          liveUrl: liveUrl,
          primaryColor: primaryColor,
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            ),
            child: child,
          ),
        );
      },
    );
  }

  @override
  State<ProjectPreviewDialog> createState() => _ProjectPreviewDialogState();
}

class _ProjectPreviewDialogState extends State<ProjectPreviewDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
      ),
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
    
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(isMobile ? 16 : 24),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _slideAnimation.value),
            child: Opacity(
              opacity: _fadeAnimation.value,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: isMobile ? double.infinity : 700,
                  maxHeight: getHeight(context) * 0.9,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: widget.primaryColor.withOpacity(0.3),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header with gradient
                      Container(
                        height: getHeight(context) * 0.25,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              widget.primaryColor,
                              widget.primaryColor.withOpacity(0.7),
                              widget.primaryColor.withOpacity(0.5),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: widget.primaryColor.withOpacity(0.4),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            // Pattern overlay
                            Positioned.fill(
                              child: CustomPaint(
                                painter: _ProjectPatternPainter(
                                  color: Colors.white.withOpacity(0.1),
                                ),
                              ),
                            ),
                            // Close button
                            Positioned(
                              top: 16,
                              right: 16,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () => Navigator.of(context).pop(),
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Project icon
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.code,
                                  color: Colors.white,
                                  size: 60,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Content
                      Flexible(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(isMobile ? 20 : 28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              TextWidget(
                                Text: widget.title,
                                textsize: isMobile ? getResponsive(context) * 28 : getResponsive(context) * 32,
                                fw: FontWeight.w900,
                                textColour: Colors.black87,
                                Alignment: TextAlign.left,
                              ),
                              SizedBox(height: getHeight(context) * 0.02),
                              // Description
                              TextWidget(
                                Text: widget.description,
                                textsize: isMobile ? getResponsive(context) * 16 : getResponsive(context) * 18,
                                fw: FontWeight.w400,
                                textColour: Colors.black54,
                                Alignment: TextAlign.left,
                              ),
                              SizedBox(height: getHeight(context) * 0.03),
                              // Technologies
                              TextWidget(
                                Text: 'Technologies Used',
                                textsize: isMobile ? getResponsive(context) * 18 : getResponsive(context) * 20,
                                fw: FontWeight.bold,
                                textColour: Colors.black87,
                                Alignment: TextAlign.left,
                              ),
                              SizedBox(height: 12),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: widget.technologies.map((tech) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isMobile ? 16 : 20,
                                      vertical: isMobile ? 10 : 12,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          widget.primaryColor.withOpacity(0.1),
                                          widget.primaryColor.withOpacity(0.05),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: widget.primaryColor.withOpacity(0.3),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: TextWidget(
                                      Text: tech,
                                      textsize: isMobile ? getResponsive(context) * 13 : getResponsive(context) * 14,
                                      fw: FontWeight.w600,
                                      textColour: widget.primaryColor,
                                      Alignment: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(height: getHeight(context) * 0.04),
                              // Action buttons
                              Row(
                                children: [
                                  if (widget.githubUrl != null) ...[
                                    Expanded(
                                      child: _buildActionButton(
                                        context,
                                        'GitHub',
                                        Icons.code,
                                        widget.githubUrl!,
                                        Colors.black87,
                                        isMobile,
                                      ),
                                    ),
                                    if (widget.liveUrl != null) SizedBox(width: 12),
                                  ],
                                  if (widget.liveUrl != null)
                                    Expanded(
                                      child: _buildActionButton(
                                        context,
                                        'Live Demo',
                                        Icons.launch,
                                        widget.liveUrl!,
                                        widget.primaryColor,
                                        isMobile,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String label,
    IconData icon,
    String url,
    Color color,
    bool isMobile,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          final uri = Uri.tryParse(url);
          if (uri == null) {
            if (!mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Invalid link'),
                backgroundColor: Colors.redAccent,
              ),
            );
            return;
          }

          final launched = await launchUrl(
            uri,
            mode: LaunchMode.platformDefault,
          );

          if (!launched && mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Could not open $label'),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 14 : 16,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color,
                color.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: isMobile ? 20 : 22),
              SizedBox(width: 8),
              TextWidget(
                Text: label,
                textsize: isMobile ? getResponsive(context) * 14 : getResponsive(context) * 16,
                fw: FontWeight.bold,
                textColour: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectPatternPainter extends CustomPainter {
  final Color color;

  _ProjectPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Draw diagonal lines
    for (double i = -size.height; i < size.width + size.height; i += 30) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

