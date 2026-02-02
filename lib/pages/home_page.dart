import 'package:flutter/material.dart';
import 'package:portafolio_app/constants/colors.dart';
import 'package:portafolio_app/constants/size.dart';
import 'package:portafolio_app/utils/project_utils.dart';
import 'package:portafolio_app/widgets/contact_form_widget.dart';
import 'package:portafolio_app/widgets/drawer_mobile.dart';
import 'package:portafolio_app/widgets/footer_widget.dart';
import 'package:portafolio_app/widgets/header_desktop.dart';
import 'package:portafolio_app/widgets/header_mobile.dart';
import 'package:portafolio_app/widgets/main_desktop.dart';
import 'package:portafolio_app/widgets/main_mobile.dart';
import 'package:portafolio_app/widgets/project_card_widget.dart';
import 'package:portafolio_app/widgets/skills_desktop.dart';
import 'package:portafolio_app/widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late ScrollController _scrollController;
  
  final Map<String, GlobalKey> _sectionKeys = {
    'Home': GlobalKey(),
    'Skills': GlobalKey(),
    'Projects': GlobalKey(),
    'Contact': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String section) {
    final key = _sectionKeys[section];
    if (key == null) return;
    
    // Mayor delay para Contact ya que está lejos
    final delay = section == 'Contact' ? 200 : 100;
    
    Future.delayed(Duration(milliseconds: delay), () {
      if (key.currentContext != null) {
        try {
          Scrollable.ensureVisible(
            key.currentContext!,
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOutCubic,
            alignment: 0.0,
          );
        } catch (e) {
          // Fallback: intentar con addPostFrameCallback
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (key.currentContext != null) {
              try {
                Scrollable.ensureVisible(
                  key.currentContext!,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeInOutCubic,
                  alignment: 0.0,
                );
              } catch (e2) {
                // Final fallback silencioso
              }
            }
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: constraints.maxWidth >= minDesktopWidth
              ? null
              : DrawerMobile(onNavTap: _scrollToSection),
          body: Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    // Home Section
                    
                    Container(
                      key: _sectionKeys['Home'],
                      margin: const EdgeInsets.only(top: 50),
                      child: constraints.maxWidth >= minDesktopWidth
                          ? MainDesktop(onGetInTouchPressed: () => _scrollToSection('Contact'))
                          : MainMobile(onGetInTouchPressed: () => _scrollToSection('Contact')),
                    ),
                    SizedBox(height: constraints.maxWidth >= minDesktopWidth ? 100 : 60),

                    // Skills Section
                    Container(
                      key: _sectionKeys['Skills'],
                      child: constraints.maxWidth >= medDesktopWidth
                          ? SkillsDesktop()
                          : SkillsMobile(),
                    ),
                    SizedBox(height: constraints.maxWidth >= minDesktopWidth ? 100 : 60),

                    // Projects Section
                    Container(
                      key: _sectionKeys['Projects'],
                      child: Column(
                        children: [
                          ProjectCardWidget(
                            projects: workProjectUtils,
                            sectionTitle: 'Work Projects',
                          ),
                          ProjectCardWidget(
                            projects: hobbyProjectUtils,
                            sectionTitle: 'Hobby Projects',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: constraints.maxWidth >= minDesktopWidth ? 100 : 60),

                    // Contact Section
                    Container(
                      key: _sectionKeys['Contact'],
                      child: const ContactFormWidget(),
                    ),

                    // Footer
                    const FooterWidget(),
                  ],
                ),
              ),
              // Sticky Header
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: constraints.maxWidth >= minDesktopWidth
                    ? HeaderDesktop(onNavTap: _scrollToSection)
                    : HeaderMobile(
                        onLogoTap: () => _scrollToSection('Home'),
                        onMenuTap: () {
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}