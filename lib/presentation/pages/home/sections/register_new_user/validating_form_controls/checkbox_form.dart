
import 'package:flutter/material.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../../../values/values.dart';
import '../../../../../layout/adaptive.dart';

Widget CheckboxForm(BuildContext context, _checkFieldKey, bool _isChecked, functionSetState) {
  TextTheme textTheme = Theme.of(context).textTheme;
  double fontSize = responsiveSize(context, 14, 18, md: 15);
  return Form(
    key: _checkFieldKey,
    child: FormField<bool>(
      initialValue: _isChecked,
      builder: (FormFieldState<bool> state) {
        return Column(
          children: <Widget>[
            Flex(
              direction: Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
              children:<Widget> [
                Row(
                  children: [
                    Checkbox(
                        activeColor: AppColors.primaryColor,
                        value: state.value,
                        onChanged: (bool? val) => { functionSetState(val), state.didChange(val)}
                    ),
                    Text(
                      StringConst.FORM_ACCEPT_SENTENCE,
                      style: textTheme.bodyText1?.copyWith(
                        height: 1.5,
                        color: AppColors.greyDark,
                        fontWeight: FontWeight.w700,
                        fontSize: fontSize,
                      ),),
                    TextButton(
                        onPressed: () => openUrlLink(StringConst.PRIVACITY_URL),
                        child: Flex(
                          direction: Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConst.RIGHTS_RESERVED,
                              style: textTheme.bodyText1?.copyWith(
                                height: 1.5,
                                color: AppColors.turquoise,
                                fontWeight: FontWeight.w700,
                                fontSize: fontSize,
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(StringConst.FORM_ACCEPT_SENTENCE_Y,
                      style: textTheme.bodyText1?.copyWith(
                      height: 1.5,
                      color: AppColors.greyDark,
                      fontWeight: FontWeight.w700,
                      fontSize: fontSize,
                    ),),
                    TextButton(
                        onPressed: () => openUrlLink(StringConst.USE_CONDITIONS_URL),
                        child: Flex(
                          direction: Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConst.BUILT_BY,
                              style: textTheme.bodyText1?.copyWith(
                              height: 1.5,
                              color: AppColors.turquoise,
                              fontWeight: FontWeight.w700,
                              fontSize: fontSize,
                            ),),
                          ],
                        )
                    ),
                  ],
                ),
              ],
            ),
            state.errorText == null
                ? Text("")
                : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(state.errorText!, style: TextStyle(color: AppColors.red, fontSize: 13)),
                ),
          ],
        );
      },
      validator: (value) => _isChecked ? null : StringConst.FORM_ACCEPTANCE_ERROR,
    ),
  );
}