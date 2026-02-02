import 'package:flutter/material.dart';
import 'package:portafolio_app/constants/colors.dart';
import 'package:portafolio_app/utils/project_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCardWidget extends StatefulWidget {
  final List<ProjectUtils> projects;
  final String sectionTitle;

  const ProjectCardWidget({
    super.key,
    required this.projects,
    required this.sectionTitle,
  });

  @override
  State<ProjectCardWidget> createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  // Mapa para almacenar el índice de imagen actual para cada proyecto
  final Map<int, int> _currentImageIndex = {};
  // Mapa para rastrear hover state de cada tarjeta
  final Map<int, bool> _hoverState = {};

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
    final isTablet = screenWidth >= 768 && screenWidth < 1200;
    final isDesktop = screenWidth >= 1200;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : isTablet ? 16 : 32,
        vertical: isDesktop ? 60 : 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Título de la sección con descripción
          Text(
            widget.sectionTitle,
            style: TextStyle(
              fontSize: isMobile ? 28 : isTablet ? 32 : 40,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          if (!isMobile)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Explore my latest work and projects',
                style: TextStyle(
                  fontSize: 16,
                  color: CustomColor.whiteSecondary,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          const SizedBox(height: 40),

          // Grid de proyectos
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : isTablet ? 2 : 3,
              crossAxisSpacing: isMobile ? 0 : 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.8,
            ),
            itemCount: widget.projects.length,
            itemBuilder: (context, index) {
              final project = widget.projects[index];
              return _buildProjectCard(project, isMobile);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(ProjectUtils project, bool isMobile) {
    final projectIndex = widget.projects.indexOf(project);
    _hoverState.putIfAbsent(projectIndex, () => false);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          setState(() {
            _hoverState[projectIndex] = true;
          });
        },
        onExit: (_) {
          setState(() {
            _hoverState[projectIndex] = false;
          });
        },
        child: AnimatedScale(
          scale: _hoverState[projectIndex] ?? false ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: (_hoverState[projectIndex] ?? false)
                    ? CustomColor.yellowSecondary
                    : CustomColor.bgLight1,
                width: (_hoverState[projectIndex] ?? false) ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: CustomColor.yellowSecondary.withValues(
                    alpha: (_hoverState[projectIndex] ?? false) ? 0.3 : 0.0,
                  ),
                  blurRadius: (_hoverState[projectIndex] ?? false) ? 12 : 0,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // PageView de imágenes
                  Expanded(
                    flex: 6,
                    child: _buildImageCarousel(project, isMobile),
                  ),

                  // Información del proyecto
                  Expanded(
                    flex: 2,
                    child: _buildProjectInfo(project, isMobile),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageCarousel(ProjectUtils project, bool isMobile) {
    final projectIndex = widget.projects.indexOf(project);
    _currentImageIndex.putIfAbsent(projectIndex, () => 0);
    
    final pageController = PageController();

    return Stack(
      fit: StackFit.expand,
      children: [
        // PageView principal
        PageView.builder(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              _currentImageIndex[projectIndex] = index;
            });
          },
          itemCount: project.images.length,
          itemBuilder: (context, index) {
            return Container(
              color: CustomColor.bgLight2,
              padding: const EdgeInsets.all(8),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Imagen centrada (smartphones)
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Center(
                      child: Image.asset(
                        'assets/projects/${project.images[index]}',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: CustomColor.bgLight2,
                            child: const Center(
                              child: Icon(
                                Icons.image_not_supported_outlined,
                                color: CustomColor.whiteSecondary,
                                size: 50,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Overlay gradiente
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.05),
                          Colors.black.withValues(alpha: 0.15),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        // Botones de navegación (siempre visibles si hay múltiples imágenes)
        if (project.images.length > 1) ...[
          // Botón anterior
          Positioned(
            left: isMobile ? 4 : 8,
            top: 0,
            bottom: 0,
            child: Center(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    if (_currentImageIndex[projectIndex]! > 0) {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Container(
                    width: isMobile ? 32 : 40,
                    height: isMobile ? 32 : 40,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: CustomColor.yellowSecondary,
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: CustomColor.yellowSecondary,
                      size: isMobile ? 12 : 16,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Botón siguiente
          Positioned(
            right: isMobile ? 4 : 8,
            top: 0,
            bottom: 0,
            child: Center(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    if (_currentImageIndex[projectIndex]! < project.images.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Container(
                    width: isMobile ? 32 : 40,
                    height: isMobile ? 32 : 40,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: CustomColor.yellowSecondary,
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: CustomColor.yellowSecondary,
                      size: isMobile ? 12 : 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],

        // Indicador de imagen con dots
        if (project.images.length > 1)
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Indicador numérico
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${_currentImageIndex[projectIndex]! + 1} / ${project.images.length}',
                    style: const TextStyle(
                      color: CustomColor.whitePrimary,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Dots indicadores
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    project.images.length,
                    (index) => GestureDetector(
                      onTap: () {
                        pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentImageIndex[projectIndex] == index ? 24 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: _currentImageIndex[projectIndex] == index
                                ? CustomColor.yellowSecondary
                                : CustomColor.whiteSecondary.withValues(alpha: 0.4),
                            border: Border.all(
                              color: _currentImageIndex[projectIndex] == index
                                  ? CustomColor.yellowSecondary
                                  : CustomColor.whiteSecondary.withValues(alpha: 0.2),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildProjectInfo(ProjectUtils project, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.bgLight2.withValues(alpha: 0.5),
        border: Border(
          top: BorderSide(
            color: CustomColor.bgLight1,
            width: 0.5,
          ),
        ),
      ),
      padding: EdgeInsets.all(isMobile ? 8 : 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Título y Subtítulo
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.title,
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                project.subtitle,
                style: TextStyle(
                  fontSize: isMobile ? 11 : 12,
                  color: CustomColor.whiteSecondary,
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),

          // Botón de GitHub
          Align(
            alignment: Alignment.bottomRight,
            child: Tooltip(
              message: 'Ver en GitHub',
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColor.bgLight1.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => _launchURL(project.link),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/github.png',
                        width: isMobile ? 20 : 24,
                        height: isMobile ? 20 : 24,
                        color: CustomColor.yellowSecondary,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.hub,
                            color: CustomColor.yellowSecondary,
                            size: isMobile ? 20 : 24,
                          );
                        },
                      ),
                    ),
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

