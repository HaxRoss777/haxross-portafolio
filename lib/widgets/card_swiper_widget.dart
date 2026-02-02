import 'package:flutter/material.dart';
import 'package:portafolio_app/utils/project_utils.dart';

class CardSwiperWidget extends StatelessWidget {
  const CardSwiperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        for(int i=0; i<workProjectUtils.length; i++)
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/projects/${workProjectUtils[i].images[0]}',
                fit: BoxFit.cover,
              ),
            ),
          ),
      ],
    );
  }
}