
import 'package:enreda_app/models/ability.dart';
import 'package:enreda_app/models/education.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../services/database.dart';
import '../../../../../../values/values.dart';
import '../../../../../layout/adaptive.dart';

Widget streamBuilder_Dropdown_Education (BuildContext context, Education? selectedEducation,  functionToWriteBackThings ) {
  final database = Provider.of<Database>(context, listen: false);
  TextTheme textTheme = Theme.of(context).textTheme;
  double fontSize = responsiveSize(context, 14, 18, md: 15);
  return StreamBuilder<List<Education>>(
      stream: database.educationStream(),
      builder: (context, snapshotEducation){

        List<DropdownMenuItem<Education>> educationItems = [];
        if (snapshotEducation.hasData) {
          educationItems = snapshotEducation.data!.map((Education education) =>
              DropdownMenuItem<Education>(
                value: education,
                child: Text(education.label),
              ))
              .toList();
        }

        return DropdownButtonFormField<Education>(
          hint: Text(StringConst.FORM_EDUCATION),
          isExpanded: true,
          isDense: false,
          value: selectedEducation,
          items: educationItems,
          validator: (value) => selectedEducation != null ? null : StringConst.FORM_MOTIVATION_ERROR,
          onChanged: (value) => functionToWriteBackThings(value),
          iconDisabledColor: AppColors.greyLightTxt,
          iconEnabledColor: AppColors.turquoise,
          decoration: InputDecoration(
            labelStyle: textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: AppColors.greyDark,
              fontWeight: FontWeight.w400,
              fontSize: fontSize,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: AppColors.greyUltraLight,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: AppColors.greyUltraLight,
                width: 1.0,
              ),
            ),
          ),
          style: textTheme.bodyMedium?.copyWith(
            height: 1.5,
            color: AppColors.greyDark,
            fontWeight: FontWeight.w700,
            fontSize: fontSize,
          ),
        );
      });
}