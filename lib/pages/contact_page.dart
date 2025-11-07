import 'package:flutter/material.dart';
import 'package:travel_blogger/pages/responsive.dart';
import '../widgets/Text_widget.dart';

class ContactPage extends StatelessWidget {
  final bool enableScroll;

  const ContactPage({Key? key, this.enableScroll = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = getWidth(context) < 600;
    final scrollPhysics = enableScroll
        ? const BouncingScrollPhysics()
        : const NeverScrollableScrollPhysics();
    
    return SingleChildScrollView(
      primary: enableScroll,
      physics: scrollPhysics,
      padding: EdgeInsets.fromLTRB(
        getResponsive(context) * 20,
        getResponsive(context) * 20,
        getResponsive(context) * 20,
        getResponsive(context) * 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                TextWidget(
                  Text: 'Get In Touch',
                  textsize: isMobile ? getResponsive(context) * 28 : getResponsive(context) * 36,
                  fw: FontWeight.w900,
                  textColour: Colors.black87,
                ),
                SizedBox(height: 8),
                Container(
                  width: 100,
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF0F766E), Color(0xFF0891B2), Color(0xFF1E40AF)],
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(height: getHeight(context) * 0.03),
                TextWidget(
                  Text: 'Let\'s work together on your next project',
                  textsize: isMobile ? getResponsive(context) * 16 : getResponsive(context) * 18,
                  fw: FontWeight.w300,
                  textColour: Colors.black54,
                  Alignment: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: getHeight(context) * 0.05),
          // Contact Cards
          _buildContactCard(
            context,
            Icons.email,
            'Email',
            'alifb3101@example.com',
            'Send me an email',
            Color(0xFF0891B2),
            [Color(0xFF0891B2), Color(0xFF06B6D4)],
          ),
          SizedBox(height: 16),
          _buildContactCard(
            context,
            Icons.phone,
            'Phone',
            '+91 9909085071',
            'Call me anytime',
            Color(0xFF0F766E),
            [Color(0xFF0F766E), Color(0xFF14B8A6)],
          ),
          SizedBox(height: 16),
          _buildContactCard(
            context,
            Icons.location_on,
            'Location',
            'WTT, Sanand Circle',
            'Visit my location',
            Color(0xFF1E40AF),
            [Color(0xFF1E40AF), Color(0xFF3B82F6)],
          ),
          SizedBox(height: getHeight(context) * 0.04),
          // Contact Form
          Container(
            padding: EdgeInsets.all(isMobile ? 20 : 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  Text: 'Send Message',
                  textsize: isMobile ? getResponsive(context) * 24 : getResponsive(context) * 28,
                  fw: FontWeight.bold,
                  textColour: Colors.black87,
                  Alignment: TextAlign.left,
                ),
                SizedBox(height: 24),
                _buildTextField(context, 'Name', Icons.person),
                SizedBox(height: 16),
                _buildTextField(context, 'Email', Icons.email),
                SizedBox(height: 16),
                _buildTextField(context, 'Message', Icons.message, maxLines: 5),
                SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: getHeight(context) * 0.06,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF0F766E), Color(0xFF0891B2), Color(0xFF1E40AF)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF0891B2).withOpacity(0.4),
                        blurRadius: 15,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Message sent successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Center(
                        child: TextWidget(
                          Text: 'Send Message',
                          textsize: isMobile ? getResponsive(context) * 16 : getResponsive(context) * 18,
                          fw: FontWeight.bold,
                          textColour: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context,
    IconData icon,
    String title,
    String value,
    String subtitle,
    Color color,
    List<Color> gradientColors,
  ) {
    final isMobile = getWidth(context) < 600;
    
    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: isMobile ? 28 : 32),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  Text: title,
                  textsize: isMobile ? getResponsive(context) * 14 : getResponsive(context) * 16,
                  fw: FontWeight.w600,
                  textColour: Colors.white,
                  Alignment: TextAlign.left,
                ),
                SizedBox(height: 4),
                TextWidget(
                  Text: value,
                  textsize: isMobile ? getResponsive(context) * 16 : getResponsive(context) * 18,
                  fw: FontWeight.bold,
                  textColour: Colors.white,
                  Alignment: TextAlign.left,
                ),
                SizedBox(height: 2),
                TextWidget(
                  Text: subtitle,
                  textsize: isMobile ? getResponsive(context) * 12 : getResponsive(context) * 14,
                  fw: FontWeight.w300,
                  textColour: Colors.white.withOpacity(0.9),
                  Alignment: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String hint, IconData icon, {int maxLines = 1}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.grey[600]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[100],
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: maxLines > 1 ? 20 : 16),
        ),
      ),
    );
  }
}