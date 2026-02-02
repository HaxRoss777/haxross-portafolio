import 'package:flutter/material.dart';
import 'package:portafolio_app/constants/colors.dart';

class MainDesktop extends StatelessWidget {
  final VoidCallback? onGetInTouchPressed;
  
  const MainDesktop({super.key, this.onGetInTouchPressed});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      height: screenHeight / 1.15,
      constraints: const BoxConstraints(minHeight: 450),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left side - Text content (centered)
          Expanded(
            flex: 45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Greeting
                Text(
                  "Hi there 👋",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: CustomColor.yellowPrimary,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                // Main title
                Text(
                  "I'm Hayron Rosales",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 54,
                    fontWeight: FontWeight.w900,
                    color: CustomColor.whitePrimary,
                    height: 1.15,
                    letterSpacing: -1.2,
                  ),
                ),
                const SizedBox(height: 12),
                // Subtitle
                Text(
                  "Flutter Developer & UI Enthusiast",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.yellowSecondary,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 28),
                // Description
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 520),
                  child: Text(
                    "Crafting beautiful, performant mobile and web applications. Specialized in Flutter development with a passion for clean code and user experience.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: CustomColor.whiteSecondary,
                      height: 1.8,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                // CTA Button
                SizedBox(
                  height: 60,
                  width: 240,
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
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Right side - Profile image (centered)
          Expanded(
            flex: 45,
            child: Center(
              child: Container(
                width: 440,
                height: 560,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: CustomColor.yellowPrimary.withOpacity(0.32),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Image.asset(
                    'assets/profile.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          color: CustomColor.bgLight1,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.account_circle,
                            size: 140,
                            color: CustomColor.yellowSecondary,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}