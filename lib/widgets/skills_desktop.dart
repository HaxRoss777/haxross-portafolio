import 'package:flutter/material.dart';
import 'package:portafolio_app/constants/colors.dart';
import 'package:portafolio_app/constants/skills_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      height: 310,
      width: screenWidth,
      color: CustomColor.bgLight1,
      padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // title
          Text(
            'What I can do',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary
            ),
            textAlign: TextAlign.center,
          ),

          // platform and skills
          SizedBox(height: 50,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // plataforms
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 450
                  ),
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      for(int i=0; i<platformItems.length; i++)
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: CustomColor.bgLight2,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                          leading: Image.asset(platformItems[i]['img'] , width: 26,),
                          title: Text(platformItems[i]['title']),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 50,),
              //skills
                Flexible(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 500
                    ),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
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
                  ),
                )

            ],
          )
        ],
      ),
    );
}
}