import 'package:flutter/material.dart';
import 'package:portafolio_app/constants/colors.dart';
import 'package:portafolio_app/constants/skills_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 500
      ),
      child: Column(
        children: [
          Text(
            'What I can do',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary
            ),
            textAlign: TextAlign.center,
          ),
          // platform and skills
          const SizedBox(height: 50,),
          for(int i=0; i<platformItems.length; i++)
          Container(
            margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: CustomColor.bgLight2,
              borderRadius: BorderRadius.circular(5)
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(platformItems[i]['img'], width: 26),
                  SizedBox(width: 12), 
                  Text(platformItems[i]['title']),
                ],
              ),
            ),
          ),
          SizedBox(height: 50,),
          // skills 
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              for(int i=0; i<skillItems.length; i++)
              Chip(
                backgroundColor: CustomColor.bgLight2,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                label: Text(skillItems[i]['title']),
                avatar: Image.asset(skillItems[i]['img']),
                )
            ],
          ),
        ],
      ),
    );
}
}