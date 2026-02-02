import 'package:flutter/material.dart';
import 'package:portafolio_app/constants/colors.dart';
import 'package:portafolio_app/widgets/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  const HeaderMobile({
    super.key,
    this.onLogoTap,
    this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: CustomColor.scaffoldBg.withOpacity(0.95),
        border: Border(
          bottom: BorderSide(
            color: CustomColor.bgLight1,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          SiteLogo(onTap: onLogoTap),
          const Spacer(),
          IconButton(
            onPressed: onMenuTap,
            icon: const Icon(
              Icons.menu,
              color: CustomColor.whitePrimary,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}