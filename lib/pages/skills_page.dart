import 'package:flutter/material.dart';
import 'package:travel_blogger/pages/responsive.dart';
import 'package:travel_blogger/widgets/skill_card.dart';
import 'package:travel_blogger/widgets/Text_widget.dart';

class SkillsPage extends StatefulWidget {
  final bool enableScroll;

  const SkillsPage({super.key, this.enableScroll = true});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final List<Map<String, dynamic>> skills = const [
    {
      'name': 'Flutter',
      'proficiency': 90.0,
      'icon': Icons.phone_android,
      'color': Color(0xFF0891B2),
      'gradient': [Color(0xFF0891B2), Color(0xFF06B6D4)], // Cyan gradient
    },
    {
      'name': 'Dart',
      'proficiency': 85.0,
      'icon': Icons.code,
      'color': Color(0xFF0F766E),
      'gradient': [Color(0xFF0F766E), Color(0xFF14B8A6)], // Teal gradient
    },
    {
      'name': 'Firebase',
      'proficiency': 80.0,
      'icon': Icons.cloud,
      'color': Color(0xFF7C3AED),
      'gradient': [Color(0xFF7C3AED), Color(0xFF8B5CF6)], // Indigo gradient
    },
    {
      'name': 'UI/UX Design',
      'proficiency': 88.0,
      'icon': Icons.design_services,
      'color': Color(0xFF1E40AF),
      'gradient': [Color(0xFF1E40AF), Color(0xFF3B82F6)], // Navy to Blue
    },
    {
      'name': 'JavaScript',
      'proficiency': 75.0,
      'icon': Icons.web,
      'color': Color(0xFF0D9488),
      'gradient': [Color(0xFF0D9488), Color(0xFF2DD4BF)], // Teal gradient
    },
    {
      'name': 'Node.js',
      'proficiency': 70.0,
      'icon': Icons.settings,
      'color': Color(0xFF6366F1),
      'gradient': [Color(0xFF6366F1), Color(0xFF818CF8)], // Indigo gradient
    },
    {
      'name': 'Python',
      'proficiency': 82.0,
      'icon': Icons.code,
      'color': Color(0xFF1E40AF),
      'gradient': [Color(0xFF1E40AF), Color(0xFF2563EB)], // Navy gradient
    },
    {
      'name': 'Git',
      'proficiency': 85.0,
      'icon': Icons.folder,
      'color': Color(0xFF0891B2),
      'gradient': [Color(0xFF0891B2), Color(0xFF22D3EE)], // Cyan gradient
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
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
    final isTablet = getWidth(context) >= 600 && getWidth(context) < 1024;
    final crossAxisCount = isMobile ? 2 : (isTablet ? 3 : 4);

    final scrollPhysics =
        widget.enableScroll
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics();

    return SingleChildScrollView(
      primary: widget.enableScroll,
      physics: scrollPhysics,
      padding: EdgeInsets.fromLTRB(
        getResponsive(context) * 20,
        getResponsive(context) * 10,
        getResponsive(context) * 20,
        getResponsive(context) * 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getHeight(context) * 0.02),
          Center(
            child: Column(
              children: [
                TextWidget(
                  Text: 'Skills & Expertise',
                  textsize:
                      isMobile
                          ? getResponsive(context) * 28
                          : getResponsive(context) * 36,
                  fw: FontWeight.w900,
                  textColour: Colors.black87,
                ),
                Container(
                  width: 100,
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF0F766E),
                        Color(0xFF0891B2),
                        Color(0xFF1E40AF),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(height: getHeight(context) * 0.009),
                TextWidget(
                  Text: 'Technologies I work with to bring ideas to life',
                  textsize:
                      isMobile
                          ? getResponsive(context) * 16
                          : getResponsive(context) * 18,
                  fw: FontWeight.w300,
                  textColour: Colors.black54,
                  Alignment: TextAlign.center,
                ),
              ],
            ),
          ),

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: isMobile ? 12 : 16,
              crossAxisSpacing: isMobile ? 12 : 16,
              childAspectRatio: isMobile ? 0.85 : 0.9,
            ),
            itemCount: skills.length,
            itemBuilder: (context, index) {
              final skill = skills[index];
              final delay = index * 0.1;
              final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Interval(
                    delay.clamp(0.0, 0.8),
                    (delay + 0.2).clamp(0.0, 1.0),
                    curve: Curves.easeOutCubic,
                  ),
                ),
              );
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: animation.value,
                    child: Opacity(
                      opacity: animation.value,
                      child: SkillCard(
                        skillName: skill['name'],
                        proficiency: skill['proficiency'],
                        icon: skill['icon'],
                        color: skill['color'],
                        gradientColors: skill['gradient'],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
