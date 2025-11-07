import 'package:flutter/material.dart';
import 'package:travel_blogger/pages/responsive.dart';
import 'package:travel_blogger/widgets/project_card.dart';
import 'package:travel_blogger/widgets/Text_widget.dart';

class ProjectsPage extends StatefulWidget {
  final bool enableScroll;

  const ProjectsPage({super.key, this.enableScroll = true});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final List<Map<String, dynamic>> projects = const [
    {
      'title': 'Food Ordering App',
      'description':
          'End-to-end food ordering experience with real-time menu sync, cart persistence, and secure checkout flows powered by Hive storage and BLoC state management.',
      'technologies': ['Flutter', 'BLoC', 'Hive', 'REST APIs'],
      'color': Color(0xFF0F766E),
      'githubUrl': 'https://github.com/Alifb3101/Food_app',
      'liveUrl': null,
    },
    {
      'title': 'Recipee Book',
      'description':
          'Dynamic recipe discovery app that fetches curated dishes with Retrofit + Dio, supports offline favorites, and showcases ingredient-wise nutrition details.',
      'technologies': ['Flutter', 'Retrofit', 'Dio', 'Hive'],
      'color': Color(0xFF1E40AF),
      'githubUrl': 'https://github.com/Alifb3101/recipebook-Aliasgar-.git',
      'liveUrl': null,
    },
    {
      'title': 'AI Meal Finder',
      'description':
          'Personal meal planning assistant that leverages Google Gemini to generate tailored recipes, grocery lists, and nutritional tips based on user prompts.',
      'technologies': ['Flutter', 'Gemini AI', 'Firebase Auth'],
      'color': Color(0xFF7C3AED),
      'githubUrl': 'https://github.com/Alifb3101/ai_meal_finder.git',
      'liveUrl': null,
    },
    {
      'title': 'Tic-Tac Game',
      'description':
          'Modern take on tic-tac-toe with custom themes, AI opponent modes, and clean BLoC-driven architecture for responsive gameplay.',
      'technologies': ['Flutter', 'BLoC', 'Animations'],
      'color': Color(0xFF0891B2),
      'githubUrl': 'https://github.com/Alifb3101/tic_tac_game.git',
      'liveUrl': null,
    },
    {
      'title': 'UPI Credit/Debit Log',
      'description':
          'Personal finance tracker that captures UPI transactions, auto-categorises expenses, and syncs secure local data stores via Riverpod and Hive.',
      'technologies': ['Flutter', 'Riverpod', 'Hive', 'Firebase'],
      'color': Color(0xFF0D9488),
      'githubUrl':
          'https://github.com/Alifb3101/flutter_upi_credit_debit_log_app.git',
      'liveUrl': null,
    },
    {
      'title': 'Railway Monitoring System',
      'description':
          'Web-based control panel for monitoring train schedules, generating alerts, and managing depot tasks built with a classic LAMP stack.',
      'technologies': ['HTML', 'CSS', 'JavaScript', 'PHP', 'MySQL'],
      'color': Color(0xFF6366F1),
      'githubUrl': 'https://github.com/Alifb3101/Railway_system.git',
      'liveUrl': null,
    },
    {
      'title': 'My Co – CHPL',
      'description':
          'Production Flutter app for CHPL featuring employee workflows, claims tracking, and secure integrations built with clean architecture best practices.',
      'technologies': [
        'Flutter',
        'Firebase',
        'BLoC',
        'Retrofit',
        'Clean Architecture',
      ],
      'color': Color(0xFFEF4444),
      'githubUrl': null,
      'liveUrl':
          'https://play.google.com/store/apps/details?id=com.mycompany.fhpl&hl=en_IN',
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
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
                  Text: 'My Projects',
                  textsize:
                      isMobile
                          ? getResponsive(context) * 28
                          : getResponsive(context) * 36,
                  fw: FontWeight.w900,
                  textColour: Colors.black87,
                ),
                SizedBox(height: 8),
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
                  Text: 'Showcasing my work and creative solutions',
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
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              final delay = index * 0.15;
              final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Interval(
                    delay.clamp(0.0, 0.8),
                    (delay + 0.3).clamp(0.0, 1.0),
                    curve: Curves.easeOutCubic,
                  ),
                ),
              );
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, 50 * (1 - animation.value)),
                    child: Opacity(
                      opacity: animation.value,
                      child: ProjectCard(
                        title: project['title'],
                        description: project['description'],
                        imageUrl: '',
                        technologies: List<String>.from(
                          project['technologies'],
                        ),
                        githubUrl: project['githubUrl'],
                        liveUrl: project['liveUrl'],
                        cardColor: project['color'],
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
