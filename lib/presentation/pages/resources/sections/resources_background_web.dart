import 'package:enreda_app/presentation/layout/adaptive.dart';
import 'package:enreda_app/presentation/pages/home/sections/header_section/widgets.dart';
import 'package:enreda_app/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResourcesBackgroundWeb extends StatelessWidget {
  ResourcesBackgroundWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context);
    double sizeOfBlobSm = screenWidth * 0.3;
    double sizeOfGoldenGlobe = screenWidth * 0.2;
    double dottedGoldenGlobeOffset = sizeOfBlobSm * 0.4;
    double heightOfBlobAndGlobe =
        computeHeight(dottedGoldenGlobeOffset, sizeOfGoldenGlobe, sizeOfBlobSm);
    double heightOfStack = heightOfBlobAndGlobe * 2;
    double blobOffset = heightOfStack * 0.3;

    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              Positioned(
                  left: -(sizeOfBlobSm * 0.7),
                  top: blobOffset,
                  child: Image.asset(
                    ImagePath.BLOB_BLACK,
                    height: sizeOfBlobSm,
                    width: sizeOfBlobSm,
                  )),
              Positioned(
                top: 8,
                child:
                    Image.asset(ImagePath.DEV_HEADER_EMPTY, height: heightOfStack),
                right: -(sizeOfBlobSm * 0.8),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
