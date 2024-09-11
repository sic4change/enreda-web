
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../models/nature.dart';
import '../../../../../../services/database.dart';
import '../../../../../../values/values.dart';
import '../../../../../layout/adaptive.dart';

Widget streamBuilder_Dropdown_Nature (BuildContext context, Nature? selectedNature,  functionToWriteBackThings ) {
  final database = Provider.of<Database>(context, listen: false);
  TextTheme textTheme = Theme.of(context).textTheme;
  double fontSize = responsiveSize(context, 14, 18, md: 15);
  return StreamBuilder<List<Nature>>(
      stream: database.natureStream(),
      builder: (context, snapshotNatures){

        List<DropdownMenuItem<Nature>> natureItems = [];
        if (snapshotNatures.hasData) {
          natureItems = snapshotNatures.data!.map((Nature nature) =>
              DropdownMenuItem<Nature>(
                value: nature,
                child: Text(nature.label),
              ))
              .toList();
        }

        return DropdownButtonFormField<Nature>(
          hint: Text(StringConst.FORM_NATURE),
          isExpanded: true,
          value: selectedNature,
          items: natureItems,
          validator: (value) => selectedNature != null ? null : StringConst.FORM_NATURE_ERROR,
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
            fontWeight: FontWeight.w700,
            color: AppColors.greyDark,
            fontSize: fontSize,
          ),
        );
      });
}