import 'package:enreda_app/presentation/pages/access/access_page_mobile.dart';
import 'package:enreda_app/presentation/pages/access/access_page_web.dart';
import 'package:flutter/material.dart';

class AccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 1024) {
          return AccessPageMobile();
        } else {
          return AccessPageWeb();
        }
      },
    );
  }
}
