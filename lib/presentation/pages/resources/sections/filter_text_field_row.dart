import 'package:enreda_app/presentation/widgets/rounded_container.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../../../../values/values.dart';
import '../../../layout/adaptive.dart';

class FilterTextFieldRow extends StatefulWidget {
  const FilterTextFieldRow(
      {Key? key,
        required this.searchTextController,
        required this.onFieldSubmitted,
        required this.onPressed,
        required this.clearFilter})
      : super(key: key);

  final TextEditingController searchTextController;
  final void Function(String) onFieldSubmitted;
  final void Function() onPressed;
  final void Function() clearFilter;

  @override
  State<FilterTextFieldRow> createState() => _FilterTextFieldRowState();
}

class _FilterTextFieldRowState extends State<FilterTextFieldRow> {
  bool _isClearTextVisible = false;
  String _hintText = 'Nombre del recurso, organizador, país...';

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    widget.searchTextController.addListener(() {
      if (widget.searchTextController.text.isNotEmpty && !_isClearTextVisible) {
        setState(() {
          _isClearTextVisible = true;
        });
      } else if (widget.searchTextController.text.isEmpty &&
          _isClearTextVisible) {
        setState(() {
          _isClearTextVisible = false;
        });
      }
    });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus && _hintText.isNotEmpty) {
        setState(() {
          _hintText = '';
        });
      } else if (!_focusNode.hasFocus && _hintText.isEmpty) {
        setState(() {
          _hintText = StringConst.SEARCH_TEXT;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 15, 18, md: 16);
    return Row(
      children: [
        Expanded(
          child: RoundedContainer(
            height: Responsive.isMobile(context) ? 40 : 45,
            child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        onFieldSubmitted: widget.onFieldSubmitted,
                        textAlignVertical: TextAlignVertical.center,
                        textInputAction: TextInputAction.done,
                        focusNode: _focusNode,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: _hintText,
                          hintStyle: textTheme.bodyMedium?.copyWith(
                            color: AppColors.greyDarkTxt,
                            height: 1.5,
                            fontWeight: FontWeight.w500,
                            fontSize: fontSize,
                          ),
                          border: InputBorder.none,
                        ),
                        controller: widget.searchTextController,
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppColors.greyAlt,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                          fontSize: fontSize,
                        ),
                        keyboardType: TextInputType.text),
                  ),
                  if (_isClearTextVisible)
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.clear, color: AppColors.greyTxtAlt),
                          onPressed: widget.clearFilter,
                          // onPressed: () {
                          //   setState(() {
                          //     widget.searchTextController.clear();
                          //   });
                          // },
                        ),
                      ],
                    ),
                  if (!_isClearTextVisible)
                  IconButton(
                    icon: Icon(Icons.search, color: AppColors.greyTxtAlt),
                    onPressed: widget.onPressed,
                  ),
                  Responsive.isMobile(context) ? SpaceW4() : SpaceW12(),
                ]
            ),
          ),
        ),
      ],
    );
  }
}