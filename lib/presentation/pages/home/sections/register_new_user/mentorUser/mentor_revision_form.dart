import 'package:flutter/material.dart';
import '../../../../../../values/values.dart';
import '../../../../../layout/adaptive.dart';
import '../../../../../widgets/widgets/expanded_row.dart';

Widget MentorRevisionForm(
    BuildContext context,
    String _name,
    String _surname,
    String _email,
    String _phone,
    String countryName,
    String provinceName,
    String cityName,
    String _postalCode,
    ){
  TextTheme textTheme = Theme.of(context).textTheme;
  double fontSize = responsiveSize(context, 14, 18, md: 15);
  return Column(
    children: [
      CustomExpandedRow(title: StringConst.FORM_NAME, text: _name),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      CustomExpandedRow(title: StringConst.FORM_LASTNAME, text: _surname),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      CustomExpandedRow(title: StringConst.FORM_PHONE, text: _phone),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      CustomExpandedRow(title: StringConst.FORM_EMAIL, text: _email),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      CustomExpandedRow(title: StringConst.FORM_COUNTRY, text: countryName),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      CustomExpandedRow(title: StringConst.FORM_PROVINCE, text: provinceName),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      CustomExpandedRow(title: StringConst.FORM_CITY, text: cityName),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      CustomExpandedRow(title: StringConst.FORM_POSTAL_CODE, text: _postalCode),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      Text(
        StringConst.FORM_ACCEPTANCE,
        style: textTheme.bodyMedium?.copyWith(
          height: 1.5,
          color: AppColors.greyDark,
          fontWeight: FontWeight.w700,
          fontSize: fontSize,
        ),
      ),
      SizedBox(height: Borders.kDefaultPaddingDouble),
    ],
  );
}