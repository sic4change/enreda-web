import 'package:auto_route/auto_route.dart';
import 'package:enreda_app/presentation/pages/access/sections/access_background_web.dart';
import 'package:enreda_app/presentation/routes/router.gr.dart';
import 'package:enreda_app/presentation/widgets/buttons/enreda_button.dart';
import 'package:enreda_app/presentation/widgets/spaces.dart';
import 'package:enreda_app/utils/const.dart';
import 'package:enreda_app/utils/functions.dart';
import 'package:enreda_app/values/values.dart';
import 'package:flutter/material.dart';
import '../home/sections/register_new_user/organizationUser/organization_registering.dart';

class AccessPageWeb extends StatefulWidget {
  @override
  _AccessPageWebState createState() => _AccessPageWebState();
}

class _AccessPageWebState extends State<AccessPageWeb> {
  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    final textTheme = Theme.of(context).textTheme;

    final double widthSize = MediaQuery.of(context).size.width;
    final double heightSize = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        AccessBackgroundWeb(),
        Center(
              child: Container(
              height: heightSize * 0.75,
              width: widthSize * 0.85,
              child:
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5,
                  child: Row(children: [
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.all(Constants.mainPadding),
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
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: Constants.mainPadding * 5),
                                      child: Text(
                                        StringConst.LOOKING_FOR_YOUTHS,
                                        style: textTheme.headline5,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SpaceH30(),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: Constants.mainPadding * 5),
                                      child: Text(
                                        StringConst.LOOKING_FOR_OPPORTUNITIES,
                                        style: textTheme.headline5,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SpaceH30(),
                                    EnredaButton(
                                      buttonTitle: StringConst.ACCESS,
                                      buttonColor: AppColors.turquoise,
                                      titleColor: AppColors.white,
                                      onPressed: () =>  openUrlLink(StringConst.ADMIN_WEB_URL),
                                    ),
                                    SpaceH30(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          StringConst.NEW_ACCOUNT,
                                          style: TextStyle(fontSize: 15,
                                              color: AppColors.black400,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SpaceW24(),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const OrganizationRegistering()),
                                            );
                                          },
                                          child: Text(
                                            StringConst.REGISTERING,
                                            style: TextStyle(fontSize: 15,
                                              color: AppColors.turquoise,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.underline,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                            child: Image.asset(
                              'assets/images/form-boton-empresa-turquesa.png',
                              fit: BoxFit.cover,
                            ),
                            decoration: BoxDecoration(
                            ),
                        )
                    )
                  ])
              ),
            )),
      ],
    );
  }
}
