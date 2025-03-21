
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../models/gender.dart';
import '../../../../../../services/database.dart';
import '../../../../../../values/values.dart';
import '../../../../../layout/adaptive.dart';

Widget streamBuilder_Dropdown_Genders (BuildContext context, Gender? selectedGender,  functionToWriteBackThings ) {
  final database = Provider.of<Database>(context, listen: false);
  TextTheme textTheme = Theme.of(context).textTheme;
  double fontSize = responsiveSize(context, 14, 18, md: 15);
  return StreamBuilder<List<Gender>>(
      stream: database.genderStream(),
      builder: (context, snapshotGenders){

        List<DropdownMenuItem<Gender>> genderItems = [];
        if(snapshotGenders.hasData) {
          genderItems = snapshotGenders.data!.map((Gender gender) =>
              DropdownMenuItem<Gender>(
                value: gender,
                child: Text(gender.name),
              ))
              .toList();
        }

        return DropdownButtonFormField<Gender>(
          hint: Text(StringConst.FORM_GENDER),
          isExpanded: true,
          value: selectedGender,
          items: genderItems,
          validator: (value) => selectedGender != null ? null : StringConst.FORM_GENDER_ERROR,
          onChanged: (value) => functionToWriteBackThings(value),
          iconDisabledColor: AppColors.greyDark,
          iconEnabledColor: AppColors.turquoise,
          decoration: InputDecoration(
            labelStyle: textTheme.bodyText1?.copyWith(
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
          style: textTheme.bodyText1?.copyWith(
            height: 1.5,
            fontWeight: FontWeight.w700,
            color: AppColors.greyDark,
            fontSize: fontSize,
          ),
        );
      });
}