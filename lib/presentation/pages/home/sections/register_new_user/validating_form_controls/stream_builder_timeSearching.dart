
import 'package:enreda_app/models/timeSearching.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../services/database.dart';
import '../../../../../../values/values.dart';
import '../../../../../layout/adaptive.dart';

Widget streamBuilder_Dropdown_TimeSearching (BuildContext context, TimeSearching? selectedTimeSearching,  functionToWriteBackThings ) {
  final database = Provider.of<Database>(context, listen: false);
  TextTheme textTheme = Theme.of(context).textTheme;
  double fontSize = responsiveSize(context, 14, 18, md: 15);
  return StreamBuilder<List<TimeSearching>>(
      stream: database.timeSearchingStream(),
      builder: (context, snapshotTimeSearching){

        List<DropdownMenuItem<TimeSearching>> timeSearchingItems = [];
        if (snapshotTimeSearching.hasData) {
          timeSearchingItems = snapshotTimeSearching.data!.map((TimeSearching timeSearching) =>
              DropdownMenuItem<TimeSearching>(
                value: timeSearching,
                child: Text(timeSearching.label),
              ))
              .toList();
        }

        return DropdownButtonFormField<TimeSearching>(
          hint: Text(StringConst.FORM_TIME_SEARCHING),
          isExpanded: true,
          isDense: false,
          value: selectedTimeSearching,
          items: timeSearchingItems,
          validator: (value) => selectedTimeSearching != null ? null : StringConst.FORM_MOTIVATION_ERROR,
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