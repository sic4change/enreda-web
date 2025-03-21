import 'package:flutter/material.dart';

import '../../../../values/values.dart';
import '../../../layout/adaptive.dart';
import '../../../widgets/content_area.dart';
import '../../../widgets/enreda_info_section.dart';

class TestimonialsSection extends StatelessWidget {
  
  TestimonialsSection({Key? key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = screenWidth * 0.8;
    double contentAreaHeight = screenHeight * 1.0;

    return ContentArea(
      width: contentAreaWidth,
      height: contentAreaHeight,
      child: Row(
        children: [
          Stack(
            children: [
              Card(
                child: EnredaInfoSection1(
                  sectionTitle: StringConst.MY_TESTIMONIALS,
                  title1: StringConst.TESTIMONIALS_SECTION_TITLE,
                  hasTitle2: false,
                  body: StringConst.TESTIMONIALS_1,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
