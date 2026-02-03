import 'package:flutter/material.dart';
import 'package:portafolio_app/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  final Map<String, bool> _hoverState = {};

  Future<void> _launchURL(String url) async {
    if (url.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('URL no disponible')),
      );
      return;
    }
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo abrir el enlace')),
        );
      }
    }
  }

 @override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final isMobile = screenWidth < 768;

  return Container(
    padding: EdgeInsets.symmetric(
      vertical: isMobile ? 30 : 40,
      horizontal: isMobile ? 16 : 20,
    ),
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
      crossAxisAlignment: CrossAxisAlignment.center, // centra todo horizontalmente
      children: [
        Text(
          '© 2026 Hayron Rosales. All rights reserved.',
          style: TextStyle(
            fontSize: isMobile ? 11 : 13,
            color: CustomColor.whiteSecondary,
            letterSpacing: 0.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),

        // 🔹 ListTile reemplazado por Row centrado
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.phone,
              color: CustomColor.yellowSecondary,
              size: isMobile ? 16 : 18,
            ),
            const SizedBox(width: 8),
            Text(
              '+5355450107',
              style: TextStyle(
                fontSize: isMobile ? 12 : 14,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton(
              'github',
              Icons.hub,
              'GitHub',
              'https://github.com/HaxRoss777',
              isMobile,
            ),
            SizedBox(width: isMobile ? 16 : 20),
            _buildSocialButton(
              'linkedin',
              Icons.business,
              'LinkedIn',
              'https://www.linkedin.com/in/hax-ross',
              isMobile,
            ),
          ],
        ),
      ],
    ),
  );
}


  Widget _buildSocialButton(
    String key,
    IconData icon,
    String label,
    String url,
    bool isMobile,
  ) {
    _hoverState.putIfAbsent(key, () => false);

    return Tooltip(
      message: label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          setState(() {
            _hoverState[key] = true;
          });
        },
        onExit: (_) {
          setState(() {
            _hoverState[key] = false;
          });
        },
        child: GestureDetector(
          onTap: () => _launchURL(url),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.all(isMobile ? 8 : 10),
            decoration: BoxDecoration(
              color: CustomColor.bgLight2,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _hoverState[key] ?? false
                    ? CustomColor.yellowSecondary
                    : CustomColor.yellowSecondary.withValues(alpha: 0.3),
                width: _hoverState[key] ?? false ? 2 : 1.5,
              ),
              boxShadow: [
                if (_hoverState[key] ?? false)
                  BoxShadow(
                    color: CustomColor.yellowSecondary.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 0),
                  ),
              ],
            ),
            child: Icon(
              icon,
              color: CustomColor.yellowSecondary,
              size: isMobile ? 16 : 18,
            ),
          ),
        ),
      ),
    );
  }
}
