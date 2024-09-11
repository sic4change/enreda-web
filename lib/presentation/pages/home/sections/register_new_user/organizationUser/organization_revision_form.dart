import 'package:flutter/material.dart';
import '../../../../../../values/values.dart';
import '../../../../../layout/adaptive.dart';
import '../../../../../widgets/widgets/expanded_row.dart';

Widget OrganizationRevisionForm(
    BuildContext context,
    String _name,
    String _firstName,
    String _email,
    String _phone,
    String countryName,
    String provinceName,
    String cityName,
    String _postalCode,
    String natureName,
    String scopeName,
    String sizeOrgName,
    ){
  TextTheme textTheme = Theme.of(context).textTheme;
  double fontSize = responsiveSize(context, 14, 18, md: 15);
  return Column(
    children: [
      CustomExpandedRow(title: StringConst.FORM_ORGANIZATION, text: _name,),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      CustomExpandedRow(title: StringConst.FORM_PHONE, text: _phone,),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      CustomExpandedRow(title: StringConst.FORM_EMAIL, text: _email,),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      CustomExpandedRow(title: StringConst.FORM_CONTACT, text: _firstName,),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      CustomExpandedRow(title: StringConst.FORM_COUNTRY, text: countryName,),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      CustomExpandedRow(title: StringConst.FORM_PROVINCE, text: provinceName,),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      CustomExpandedRow(title: StringConst.FORM_CITY, text: cityName,),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      CustomExpandedRow(title: StringConst.FORM_POSTAL_CODE, text: _postalCode,),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      CustomExpandedRow(title: StringConst.FORM_NATURE, text: natureName,),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      CustomExpandedRow(title: StringConst.FORM_SCOPE, text: scopeName,),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      CustomExpandedRow(title: StringConst.FORM_SIZE, text: sizeOrgName,),
      SizedBox(height: Borders.kDefaultPaddingDouble),
      Text(
        StringConst.FORM_ACCEPTANCE,
        style: textTheme.bodyMedium?.copyWith(
          height: 1.5,
          color: AppColors.greyDark,
          fontWeight: FontWeight.w700,
          fontSize: fontSize,
        ), ),
      SizedBox(height: Borders.kDefaultPaddingDouble),
    ],
  );
}