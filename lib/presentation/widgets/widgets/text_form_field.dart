import 'package:flutter/material.dart';
import '../../../values/values.dart';
import '../../layout/adaptive.dart';


Widget CustomTextFormFieldName(BuildContext context, String formValue, String labelText, String errorText, functionSetState) {
  TextTheme textTheme = Theme.of(context).textTheme;
  double fontSize = responsiveSize(context, 14, 18, md: 15);
  return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        focusColor: AppColors.turquoise,
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
      initialValue: formValue,
      validator: (value) =>
      value!.isNotEmpty ? null : errorText,
      onSaved: (String? val) => {functionSetState(val)},
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.name,
      style: textTheme.bodyText1?.copyWith(
        height: 1.5,
        color: AppColors.greyDark,
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
      ),
  );
}
