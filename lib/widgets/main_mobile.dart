import 'package:flutter/material.dart';
import 'package:portafolio_app/constants/colors.dart';

class MainMobile extends StatelessWidget {
  final VoidCallback? onGetInTouchPressed;
  
  const MainMobile({super.key, this.onGetInTouchPressed});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      constraints: const BoxConstraints(minHeight: 700),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile image - Simple and clean (centered)
          Container(
            width: screenWidth * 0.85,
            height: screenWidth * 1.05,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: CustomColor.yellowPrimary.withOpacity(0.32),
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/profile.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      color: CustomColor.bgLight1,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.account_circle,
                        size: 100,
                        color: CustomColor.yellowSecondary,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Text content (centered)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Greeting
              Text(
                "Hi there 👋",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: CustomColor.yellowPrimary,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              // Main title
              Text(
                "I'm Hayron Rosales",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: CustomColor.whitePrimary,
                  height: 1.15,
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(height: 8),
              // Subtitle
              Text(
                "Flutter Developer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: CustomColor.yellowSecondary,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(height: 16),
              // Description
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 520),
                child: Text(
                  "Crafting beautiful, performant mobile and web applications with a focus on clean code and great UX.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: CustomColor.whiteSecondary,
                    height: 1.7,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ],
          ),
          // CTA Button
          SizedBox(
            width: 220,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.yellowPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 0,
              ),
              onPressed: onGetInTouchPressed,
              child: Text(
                "Get in touch",
                style: TextStyle(
                  color: CustomColor.scaffoldBg,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}