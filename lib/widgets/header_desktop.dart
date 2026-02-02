import 'package:flutter/material.dart';
import 'package:portafolio_app/constants/colors.dart';
import 'package:portafolio_app/constants/nav_items.dart';
import 'package:portafolio_app/widgets/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  final Function(String)? onNavTap;

  const HeaderDesktop({super.key, this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: CustomColor.scaffoldBg.withOpacity(0.95),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CustomColor.bgLight1,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: SiteLogo(),
          ),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: TextButton(
                  onPressed: () {
                    onNavTap?.call(navTitles[i]);
                  },
                  child: Text(
                    navTitles[i],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: CustomColor.whitePrimary,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}