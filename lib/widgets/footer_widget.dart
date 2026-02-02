import 'package:flutter/material.dart';
import 'package:portafolio_app/constants/colors.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: CustomColor.bgLight1,
        border: Border(
          top: BorderSide(
            color: CustomColor.bgLight2,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            '© 2026 Hayron Rosales. All rights reserved.',
            style: TextStyle(
              fontSize: 13,
              color: CustomColor.whiteSecondary,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(Icons.language, 'Portfolio', 'https://portfolio.com'),
              const SizedBox(width: 20),
              _buildSocialIcon(Icons.hub, 'GitHub', 'https://github.com'),
              const SizedBox(width: 20),
              _buildSocialIcon(Icons.mail, 'Email', 'mailto:email@example.com'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String label, String url) {
    return Tooltip(
      message: label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: CustomColor.bgLight2,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: CustomColor.yellowSecondary.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: Icon(
            icon,
            color: CustomColor.yellowSecondary,
            size: 18,
          ),
        ),
      ),
    );
  }
}
