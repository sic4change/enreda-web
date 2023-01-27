
import 'package:enreda_app/models/timeSpentWeekly.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../services/database.dart';
import '../../../../../../values/values.dart';
import '../../../../../layout/adaptive.dart';

Widget streamBuilder_Dropdown_TimeSpentWeekly (BuildContext context, TimeSpentWeekly? selectedTimeSpentWeekly,  functionToWriteBackThings ) {
  final database = Provider.of<Database>(context, listen: false);
  TextTheme textTheme = Theme.of(context).textTheme;
  double fontSize = responsiveSize(context, 14, 18, md: 15);
  return StreamBuilder<List<TimeSpentWeekly>>(
      stream: database.timeSpentWeeklyStream(),
      builder: (context, snapshotTimeSpentWeeklyStream){

        List<DropdownMenuItem<TimeSpentWeekly>> timeSpentWeeklyItems = [];
        if (snapshotTimeSpentWeeklyStream.hasData) {
          timeSpentWeeklyItems = snapshotTimeSpentWeeklyStream.data!.map((TimeSpentWeekly timeSpentWeekly) =>
              DropdownMenuItem<TimeSpentWeekly>(
                value: timeSpentWeekly,
                child: Text(timeSpentWeekly.label),
              ))
              .toList();
        }

        return DropdownButtonFormField<TimeSpentWeekly>(
          hint: Text(StringConst.FORM_TIME_SPENT_WEEKLY),
          isExpanded: true,
          isDense: false,
          value: selectedTimeSpentWeekly,
          items: timeSpentWeeklyItems,
          validator: (value) => selectedTimeSpentWeekly != null ? null : StringConst.FORM_MOTIVATION_ERROR,
          onChanged: (value) => functionToWriteBackThings(value),
          iconDisabledColor: AppColors.greyLightTxt,
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
            color: AppColors.greyDark,
            fontWeight: FontWeight.w700,
            fontSize: fontSize,
          ),
        );
      });
}