import 'package:flutter/material.dart';
import 'package:portafolio_app/constants/colors.dart';

class SiteLogo extends StatefulWidget {
  final VoidCallback? onTap;

  const SiteLogo({super.key, this.onTap});

  @override
  State<SiteLogo> createState() => _SiteLogoState();
}

class _SiteLogoState extends State<SiteLogo> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered
                  ? CustomColor.yellowPrimary
                  : CustomColor.yellowSecondary,
              width: _isHovered ? 2 : 1.5,
            ),
          ),
          child: Text(
            'HR',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
              color: _isHovered
                  ? CustomColor.yellowPrimary
                  : CustomColor.yellowSecondary,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}