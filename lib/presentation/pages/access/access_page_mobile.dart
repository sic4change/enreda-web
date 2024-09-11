import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:enreda_app/presentation/routes/router.gr.dart';
import 'package:enreda_app/presentation/widgets/buttons/enreda_button.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/utils/const.dart';
import 'package:enreda_app/utils/functions.dart';
import 'package:enreda_app/values/values.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../home/sections/register_new_user/organizationUser/organization_registering.dart';

class AccessPageMobile extends StatefulWidget {
  @override
  _AccessPageMobileState createState() => _AccessPageMobileState();
}

class _AccessPageMobileState extends State<AccessPageMobile> {
  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(Constants.mainPadding),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () => router.navigate(HomeRoute()),
                                child: Image.asset(
                                  ImagePath.LOGO_ENREDA_LONG,
                                  height: Sizes.HEIGHT_52,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          SpaceH44(),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: Constants.mainPadding * 2),
                                child: Text(
                                  StringConst.LOOKING_FOR_YOUTHS,
                                  style: textTheme.titleMedium,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SpaceH44(),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: Constants.mainPadding * 2),
                                child: Text(
                                  StringConst.LOOKING_FOR_OPPORTUNITIES,
                                  style: textTheme.titleMedium,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SpaceH44(),
                              EnredaButton(
                                buttonTitle: StringConst.ACCESS.toUpperCase(),
                                buttonColor: AppColors.turquoise,
                                titleColor: AppColors.white,
                                onPressed: () =>
                                    openUrlLink(StringConst.ADMIN_WEB_URL),
                              ),
                              SpaceH30(),
                              Text(
                                StringConst.NEW_ACCOUNT,
                                style: TextStyle(fontSize: 15,
                                    color: AppColors.greyDark,
                                    fontWeight: FontWeight.bold),
                              ),
                              SpaceH20(),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                      elevation: MaterialStateProperty.all<double>(0.0),
                                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.white),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                              side: BorderSide(color: AppColors.primaryColor, width: 1)
                                          )
                                      )
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const OrganizationRegistering()),);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                    child: Text(StringConst.REGISTERING.toUpperCase(), style: TextStyle(color: AppColors.turquoise, fontWeight: FontWeight.w600 ),),
                                  ))
                            ],
                          ),
                        ],
                      )),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Image.asset('assets/images/form-boton-empresa-trans.png', fit: BoxFit.cover,),
                  )
            ])));
  }

}
