
import 'package:enreda_app/models/dedication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../services/database.dart';
import '../../../../../../values/values.dart';
import '../../../../../layout/adaptive.dart';

Widget streamBuilder_Dropdown_Dedication (BuildContext context, Dedication? selectedDedication,  functionToWriteBackThings ) {
  final database = Provider.of<Database>(context, listen: false);
  TextTheme textTheme = Theme.of(context).textTheme;
  double fontSize = responsiveSize(context, 14, 18, md: 15);
  return StreamBuilder<List<Dedication>>(
      stream: database.dedicationStream(),
      builder: (context, snapshotDedications){

        List<DropdownMenuItem<Dedication>> dedicationItems = [];
        if (snapshotDedications.hasData) {
          dedicationItems = snapshotDedications.data!.map((Dedication dedication) =>
              DropdownMenuItem<Dedication>(
                value: dedication,
                child: Text(dedication.label),
              ))
              .toList();
        }

        return DropdownButtonFormField<Dedication>(
          hint: Text(StringConst.FORM_DEDICATION),
          isExpanded: true,
          isDense: false,
          value: selectedDedication,
          items: dedicationItems,
          validator: (value) => selectedDedication != null ? null : StringConst.FORM_MOTIVATION_ERROR,
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