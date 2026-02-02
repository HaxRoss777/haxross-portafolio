class ProjectUtils {
  final List<String> images;
  final String title;
  final String subtitle;
  final String link;

  ProjectUtils({required this.images, required this.title, required this.subtitle, required this.link});

}

//  hobby projects 

List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    images: [
      'delivery-food.png',
    ],
    title: 'Delivery Food App',
    subtitle: 'Practical Flutter designs for a food delivery application.',
    link: ''
  ),
  ProjectUtils(
    images: [
      'shopping.png',
    ],
    title: 'Shopping App',
    subtitle: 'Practical Flutter designs for a shopping application.',
    link: ''
  ),
  ProjectUtils(
    images: [
      'practice.png',
      'practice (2).png',
      'practice (3).png',
    ],
    title: 'Practice App',
    subtitle: 'Practical Flutter designs for various application interfaces.',
    link: ''
  ),
  ProjectUtils(
    images: [
      'news.png',
      'news (2).png',
    ],
    title: 'News App',
    subtitle: 'News application with multiple categories.',
    link: ''
  ),
];

List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    images: [
      'foodtopia.jpeg',
      'foodtopia1.jpeg',
      'foodtopia2.jpeg',
      'foodtopia3.jpeg',
    ],
    title: 'FoodTopia App',
    subtitle: 'E-Commerce for a small food business.',
    link: 'https://github.com/HaxRoss777/FoodTopia-App.git'
  ),
  ProjectUtils(
    images: [
      'adijorda.png',
      'adijorda (2).png',
      'adijorda (3).png',
    ],
    title: 'Adijorda App',
    subtitle: 'An app in development by adijorda.com',
    link: 'https://github.com/HaxRoss777/Adijorda-App.git'
  ),
  ProjectUtils(
    images: [
      'millorcase.jpg',
    ],
    title: 'MillorCase App',
    subtitle: 'A case management application.',
    link: 'https://github.com/HaxRoss777/MillorCase-App'
  ),
];