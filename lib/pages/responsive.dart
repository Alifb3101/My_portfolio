import 'package:flutter/widgets.dart';

double getHeight(context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(context) {
  return MediaQuery.of(context).size.width;
}

double getResponsive(context) {
  return MediaQuery.of(context).size.height * 0.001;
}

double getResponsiveTextSize(context) {
  return 0.8;
}

// Enhanced responsive utilities
bool isMobile(BuildContext context) {
  return getWidth(context) < 600;
}

bool isTablet(BuildContext context) {
  final width = getWidth(context);
  return width >= 600 && width < 1024;
}

bool isDesktop(BuildContext context) {
  return getWidth(context) >= 1024;
}

double getResponsivePadding(BuildContext context) {
  if (isMobile(context)) {
    return 16.0;
  } else if (isTablet(context)) {
    return 24.0;
  } else {
    return 32.0;
  }
}

double getResponsiveFontSize(BuildContext context, double baseSize) {
  if (isMobile(context)) {
    return baseSize * 0.85;
  } else if (isTablet(context)) {
    return baseSize * 0.95;
  } else {
    return baseSize;
  }
}

int getResponsiveGridCount(BuildContext context) {
  if (isMobile(context)) {
    return 2;
  } else if (isTablet(context)) {
    return 3;
  } else {
    return 4;
  }
}
