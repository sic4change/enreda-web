
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../models/size.dart';
import '../../../../../../services/database.dart';
import '../../../../../../values/values.dart';
import '../../../../../layout/adaptive.dart';

Widget streamBuilderForSizeOrg (BuildContext context, SizeOrg? selectedSizeOrg,  functionToWriteBackThings ) {
  final database = Provider.of<Database>(context, listen: false);
  TextTheme textTheme = Theme.of(context).textTheme;
  double fontSize = responsiveSize(context, 14, 18, md: 15);
  return StreamBuilder<List<SizeOrg>>(
      stream: database.sizeStream(),
      builder: (context, snapshotSizes){

        List<DropdownMenuItem<SizeOrg>> sizeOrgItems = [];
        if(snapshotSizes.hasData) {
          sizeOrgItems = snapshotSizes.data!.map((SizeOrg sizeOrg) =>
              DropdownMenuItem<SizeOrg>(
                value: sizeOrg,
                child: Text(sizeOrg.label),
              ))
              .toList();
        }

        return DropdownButtonFormField<SizeOrg>(
          hint: Text(StringConst.FORM_SIZE),
          isExpanded: true,
          value: selectedSizeOrg,
          items: sizeOrgItems,
          validator: (value) => selectedSizeOrg != null ? null : StringConst.FORM_SIZE_ERROR,
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