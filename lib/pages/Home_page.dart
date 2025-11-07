import 'package:flutter/material.dart';
import 'package:travel_blogger/pages/responsive.dart';
import 'package:travel_blogger/widgets/btn_widget.dart';
import 'package:travel_blogger/widgets/profile_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/Alert_box.dart';
import '../widgets/Follow_unfollow_alert.dart';
import '../widgets/Text_widget.dart';
import '../widgets/icon_btn.dart';
import '../widgets/insight_details.dart';
import '../widgets/profile_header.dart';
import 'contact_page.dart';
import 'skills_page.dart';
import 'projects_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isselect = false;
  final List<Map<String, dynamic>> _socialProfiles = [
    {
      'asset': 'assets/socialmedia_icon/img2.png',
      'bgColor': Colors.blue,
      'gradientColors': [const Color(0xFFDDEEFF), const Color(0xFFFFFFFF)],
      'tooltip': 'LinkedIn',
      'url': 'https://www.linkedin.com/in/aliasger-barbarawala-1132211b6/',
    },
    {
      'asset': 'assets/socialmedia_icon/img3.png',
      'bgColor': Colors.pinkAccent,
      'gradientColors': [const Color(0xFFFDEFF9), const Color(0xFFFFEAF0)],
      'tooltip': 'Instagram',
      'url': 'https://www.instagram.com/_ali216?igsh=MWNnYWF0MzRsMHltZw==',
    },
    {
      'asset': 'assets/socialmedia_icon/img4.png',
      'bgColor': Colors.black87,
      'gradientColors': [const Color(0xFFFAFAFA), const Color(0xFFF0F0F0)],
      'tooltip': 'GitHub',
      'url': 'https://github.com/Alifb3101',
    },
    {
      'asset': 'assets/socialmedia_icon/social.png',
      'bgColor': Colors.green,
      'gradientColors': [const Color(0xFFD9F99D), const Color(0xFFBBF7D0)],
      'tooltip': 'WhatsApp',
      'url': 'https://wa.me/919909085071',
    },
  ];

  void toggle() {
    setState(() {
      isselect = !isselect;
      FollowUnfollowAlert.show(context: context, isFollowed: isselect);
    });
  }

  Future<void> _launchExternalLink(String url) async {
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

    final success = await launchUrl(uri, mode: LaunchMode.platformDefault);
    if (!success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not open link'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = getWidth(context);
    if (width >= 1025) {
      return _buildDesktopView(context);
    }
    return _buildMobileTabletView(context);
  }

  Widget _buildMobileTabletView(BuildContext context) {
    final isMobile = getWidth(context) < 600;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: NestedScrollView(
          headerSliverBuilder:
              (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeaderSection(),
                      SizedBox(height: getHeight(context) * 0.06),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getResponsive(context) * 20,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    Text: "Aliasgar",
                                    textsize:
                                        isMobile
                                            ? getResponsive(context) * 28
                                            : getResponsive(context) * 36,
                                    fw: FontWeight.w900,
                                  ),
                                  const SizedBox(height: 4),
                                  TextWidget(
                                    Text:
                                        "Mobile Application Developer & Web Developer",
                                    textsize:
                                        isMobile
                                            ? getResponsive(context) * 14
                                            : getResponsive(context) * 16,
                                    fw: FontWeight.w400,
                                    textColour: Colors.black54,
                                    Alignment: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                            if (!isMobile) ...[
                              SizedBox(width: getWidth(context) * 0.02),
                              InkWell(
                                onTap: toggle,
                                child: btn_widget(
                                  Text: isselect ? 'liked' : 'like5',
                                  bgcolour:
                                      isselect
                                          ? const Color(0xFF0891B2)
                                          : const Color(0xFF0F766E),
                                ),
                              ),
                              SizedBox(width: getWidth(context) * 0.02),
                              InkWell(
                                onTap: () => ContactUsDialog.show(context),
                                child: btn_widget(
                                  Text: 'Contact',
                                  bgcolour: const Color(0xFF1E40AF),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      if (isMobile) ...[
                        SizedBox(height: getHeight(context) * 0.02),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getResponsive(context) * 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: toggle,
                                child: btn_widget(
                                  Text: isselect ? 'Liked' : 'Like',
                                  bgcolour:
                                      isselect ? Colors.redAccent : Colors.blue,
                                ),
                              ),
                              InkWell(
                                onTap: () => ContactUsDialog.show(context),
                                child: btn_widget(
                                  Text: 'Contact',
                                  bgcolour: Colors.deepPurple,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      SizedBox(height: getHeight(context) * 0.02),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getResponsive(context) * 20,
                        ),
                        child: TextWidget(
                          Text:
                              "Passionate developer creating innovative mobile and web solutions. I love building beautiful, functional applications that make a difference.",
                          textsize:
                              isMobile
                                  ? getResponsive(context) * 15
                                  : getResponsive(context) * 18,
                          fw: FontWeight.w300,
                          Alignment: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getResponsive(context) * 20,
                          vertical: getResponsive(context) * 22,
                        ),
                        child: Container(
                          height: getHeight(context) * 0.09,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF0F766E),
                                Color(0xFF0891B2),
                                Color(0xFF1E40AF),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF0891B2).withOpacity(0.3),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: InsightDetails(
                                    Label: "Projects",
                                    count: "10+",
                                  ),
                                ),
                                Expanded(
                                  child: InsightDetails(
                                    Label: "Clients",
                                    count: "30+",
                                  ),
                                ),
                                Expanded(
                                  child: InsightDetails(
                                    Label: "Experience",
                                    count: "1+",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children:
                                _socialProfiles.map((profile) {
                                  final gradientColors = List<Color>.from(
                                    profile['gradientColors'] as List,
                                  );
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: icon_btn(
                                      icons: profile['asset'] as String,
                                      bgcolour: profile['bgColor'] as Color,
                                      colour: LinearGradient(
                                        colors: gradientColors,
                                      ),
                                      onTap:
                                          () => _launchExternalLink(
                                            profile['url'] as String,
                                          ),
                                    ),
                                  );
                                }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, -2),
                            ),
                          ],
                        ),
                        child: TabBar(
                          unselectedLabelColor: Colors.black54,
                          indicatorWeight: 3,
                          labelStyle: TextStyle(
                            fontSize:
                                isMobile
                                    ? getResponsive(context) * 16
                                    : getResponsive(context) * 18,
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontSize:
                                isMobile
                                    ? getResponsive(context) * 16
                                    : getResponsive(context) * 18,
                            fontWeight: FontWeight.w500,
                          ),
                          indicatorColor: const Color(0xFF0891B2),
                          labelColor: const Color(0xFF0891B2),
                          tabs: const [
                            Tab(text: "Skills"),
                            Tab(text: "Projects"),
                            Tab(text: "Contact"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
          body: TabBarView(
            children: const [SkillsPage(), ProjectsPage(), ContactPage()],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopView(BuildContext context) {
    final socialLinks = _socialProfiles;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 48),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(48),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(36),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 40,
                          offset: const Offset(0, 24),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE0F2F1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(
                                      Icons.brightness_5,
                                      color: Color(0xFF0F766E),
                                      size: 18,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Available for freelance collaborations',
                                      style: TextStyle(
                                        color: Color(0xFF0F766E),
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 28),
                              const Text(
                                'AliAsgar',
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black87,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                'Mobile Application Developer & Web Developer',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              const SizedBox(height: 24),
                              const Text(
                                'I design and build seamless digital experiences across platforms. Blending clean design with robust engineering, I partner with teams to deliver products that are fast, scalable, and delightful to use.',
                                style: TextStyle(
                                  fontSize: 18,
                                  height: 1.6,
                                  color: Color(0xFF475569),
                                ),
                              ),
                              const SizedBox(height: 32),
                              Wrap(
                                spacing: 16,
                                runSpacing: 12,
                                children: [
                                  _buildDesktopCapabilityChip(
                                    'Flutter mobile & web apps',
                                  ),
                                  _buildDesktopCapabilityChip(
                                    'Firebase & Supabase backend',
                                  ),
                                  _buildDesktopCapabilityChip(
                                    'UI/UX prototyping',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 32),
                              Wrap(
                                spacing: 16,
                                runSpacing: 16,
                                children: [
                                  _buildDesktopActionButton(
                                    label: isselect ? 'Followed' : 'Follow',
                                    gradient:
                                        isselect
                                            ? const [
                                              Color(0xFF0891B2),
                                              Color(0xFF0284C7),
                                            ]
                                            : const [
                                              Color(0xFF0F766E),
                                              Color(0xFF0E7490),
                                            ],
                                    onTap: toggle,
                                  ),
                                  _buildDesktopActionButton(
                                    label: 'Contact',
                                    gradient: const [
                                      Color(0xFF1E40AF),
                                      Color(0xFF312E81),
                                    ],
                                    onTap: () => ContactUsDialog.show(context),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 36),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 28,
                                  vertical: 24,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8FAFC),
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: const Color(0xFFE2E8F0),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: _buildDesktopInsight(
                                        label: 'Projects',
                                        value: '10+',
                                      ),
                                    ),
                                    _buildDesktopInsightDivider(),
                                    Expanded(
                                      child: _buildDesktopInsight(
                                        label: 'Clients',
                                        value: '30+',
                                      ),
                                    ),
                                    _buildDesktopInsightDivider(),
                                    Expanded(
                                      child: _buildDesktopInsight(
                                        label: 'Experience',
                                        value: '1+ years',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 28),
                              Wrap(
                                spacing: 16,
                                runSpacing: 16,
                                children: [
                                  for (final link in socialLinks)
                                    _buildDesktopSocialButton(
                                      asset: link['asset'] as String,
                                      tooltip: link['tooltip'] as String,
                                      colors: List<Color>.from(
                                        link['gradientColors'] as List,
                                      ),
                                      url: link['url'] as String,
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 48),
                        Expanded(
                          flex: 4,
                          child: _buildDesktopProfileShowcase(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 26,
                          offset: const Offset(0, 20),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        TabBar(
                          indicator: const UnderlineTabIndicator(
                            borderSide: BorderSide(
                              width: 4,
                              color: Color(0xFF0891B2),
                            ),
                            insets: EdgeInsets.symmetric(horizontal: 64),
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: const Color(0xFF0891B2),
                          unselectedLabelColor: Colors.black54,
                          labelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                          ),
                          unselectedLabelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          tabs: const [
                            Tab(text: 'Skills'),
                            Tab(text: 'Projects'),
                            Tab(text: 'Contact'),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Builder(
                          builder: (context) {
                            final controller = DefaultTabController.of(context);
                            return AnimatedBuilder(
                              animation: controller.animation!,
                              builder: (context, _) {
                                final index = controller.index;
                                Widget current;
                                switch (index) {
                                  case 0:
                                    current = const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 32,
                                        vertical: 8,
                                      ),
                                      child: SkillsPage(enableScroll: false),
                                    );
                                    break;
                                  case 1:
                                    current = const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 32,
                                        vertical: 8,
                                      ),
                                      child: ProjectsPage(enableScroll: false),
                                    );
                                    break;
                                  case 2:
                                  default:
                                    current = const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 32,
                                        vertical: 8,
                                      ),
                                      child: ContactPage(enableScroll: false),
                                    );
                                    break;
                                }

                                return AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  transitionBuilder:
                                      (child, animation) => FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      ),
                                  child: KeyedSubtree(
                                    key: ValueKey<int>(index),
                                    child: current,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopCapabilityChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF475569),
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  Widget _buildDesktopActionButton({
    required String label,
    required List<Color> gradient,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: gradient.last.withOpacity(0.35),
              blurRadius: 24,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopInsight({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF6B7280),
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopInsightDivider() {
    return Container(
      width: 1,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      color: const Color(0xFFE2E8F0),
    );
  }

  Widget _buildDesktopSocialButton({
    required String asset,
    required String tooltip,
    required List<Color> colors,
    required String url,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: () => _launchExternalLink(url),
        borderRadius: BorderRadius.circular(18),
        child: Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: colors.last.withOpacity(0.25),
                blurRadius: 20,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              asset,
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopProfileShowcase() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F766E), Color(0xFF1E40AF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1E3A8A).withOpacity(0.3),
            blurRadius: 40,
            offset: const Offset(0, 24),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 35,
                  offset: const Offset(0, 18),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 120,
              backgroundColor: Colors.white,
              child: ProfileImage(
                imagePath: 'assets/ali2.jpg',
                rad: 114,
                bgcolour: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 28),
          const Text(
            'Let\'s build something memorable',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Crafting performant Flutter experiences with a product mindset. From concept to launch, I help teams ship features that users love.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
          ),
          const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.circle, color: Colors.lightGreenAccent, size: 12),
                SizedBox(width: 10),
                Text(
                  'Currently In CHPL',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
