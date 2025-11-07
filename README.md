# ✨ Ali Asgar’s Portfolio (Flutter) 

Welcome to my personal portfolio built entirely with Flutter! This app highlights my journey as a **Mobile & Web Application Developer**, showcasing real client work, AI prototypes, and polished UI/UX crafted for both mobile and large-screen experiences. 🚀

![Hero Preview](assets/ali2.jpg)

## 📌 Highlights

- 🎯 **Pixel-perfect design** with custom animations, gradients, and responsive layouts that adapt beautifully across phone, tablet, and desktop screens.
- 🧠 **Smart content architecture**: projects, skills, contact actions, and social links are data-driven so everything stays maintainable.
- 🧩 **Modular widgets** (`ProjectCard`, `ProfileHeader`, `IconBtn`, etc.) enable rapid iteration and reuse.
- 🌐 **Live integrations**: GitHub repositories, Play Store listing, WhatsApp chat, LinkedIn, and Instagram all open straight from the app.

## 🛠️ Tech Stack

| Layer | Tools |
| --- | --- |
| Framework | Flutter 3.x |
| State & Architecture | Provider-style setState, Clean widget composition |
| UI | Custom animations, gradient theming, responsive helpers |
| Data | Static maps + asset bundles (easy to swap for APIs) |
| Integrations | `url_launcher`, Play Store deep links |

## 📱 Screens & Components

| Section | Description |
| --- | --- |
| **Hero & Insights** | Animated welcome banner, profile image with parallax, and quick stats (projects, clients, experience). |
| **Skills Page** | Grid of skill cards with entry animations, color-coded gradients, and proficiency progress. |
| **Projects Page** | Real-world apps including Food Ordering, AI Meal Finder, Railway Monitoring System, and FHPL (live on Play Store). Each card opens a rich preview dialog with GitHub / live links. |
| **Contact Page** | Branded CTA cards for email, phone, and WhatsApp. |
| **Desktop Layout** | Dedicated layout: side navigation, CTA buttons, animated bio section, and tabbed content area that keeps vertical scrolling intact. |

> 💡 Want to add your own screenshots? Drop PNG/JPG files into `assets/README/` and replace the image path in this README.

## 🚀 Getting Started

```bash
# 1. Fetch dependencies
flutter pub get

# 2. Run on any platform
flutter run -d chrome   # Web/Desktop
flutter run -d macos    # macOS desktop
flutter run             # Auto-detect mobile simulator/device
```

### 🔧 Handy Commands

- `flutter pub run build_runner build` *(if you add code generation later)*
- `flutter analyze` – keep code quality tight
- `flutter test` – coming soon (hook in widget/unit tests)

## 🌍 Project Structure

```
lib/
	pages/
		Home_page.dart        # Responsive shell + desktop layout
		skills_page.dart      # Skills grid & animations
		projects_page.dart    # Real project cards, preview dialogs
		contact_page.dart     # Contact CTAs
	widgets/
		project_card.dart     # Animated project tiles
		project_preview_dialog.dart
		profile_header.dart   # Animated header banner
		icon_btn.dart         # Social button with URL launcher
assets/
	ali2.jpg               # Profile photo
	socialmedia_icon/      # Icon assets used by social chip row
```

## 🔗 Connect With Me

- [LinkedIn](https://www.linkedin.com/in/aliasger-barbarawala-1132211b6/)
- [Instagram](https://www.instagram.com/_ali216?igsh=MWNnYWF0MzRsMHltZw==)
- [GitHub](https://github.com/Alifb3101)
- [WhatsApp](https://wa.me/919909085071)
- [FHPL Play Store App](https://play.google.com/store/apps/details?id=com.mycompany.fhpl&hl=en_IN)

## 🤝 Credits & License

Crafted with ❤️ by **Ali Asgar Barbarawala**. Feel free to fork, learn, and build your own portfolio on top of this Flutter foundation.

> 📬 Have a product idea or want to collaborate? Open an issue or drop me a message via the Contact page in the app.
