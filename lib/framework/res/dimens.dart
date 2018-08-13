import 'package:flutter/material.dart';

//region space
const kSpaceZero = 0.0;
const kSpaceTiny = 1.0;
const kSpaceSmall = 4.0;
const kSpaceNormal = 8.0;
const kSpaceBig = 16.0;
const kSpaceHuge = 32.0;
const kSpaceGiant = 64.0;

const SPACE_ZERO = SizedBox(width: kSpaceZero, height: kSpaceZero);
const SPACE_TINY = SizedBox(width: kSpaceTiny, height: kSpaceTiny);
const SPACE_SMALL = SizedBox(width: kSpaceSmall, height: kSpaceSmall);
const SPACE_NORMAL = SizedBox(width: kSpaceNormal, height: kSpaceNormal);
const SPACE_BIG = SizedBox(width: kSpaceBig, height: kSpaceBig);
const SPACE_HUGE = SizedBox(width: kSpaceHuge, height: kSpaceHuge);
const SPACE_GIANT = SizedBox(width: kSpaceHuge, height: kSpaceHuge);
//endregion

//region text
const kTextNormal = 16.0;
const kTextBig = 18.0;
//endregion

//region elevation
const kElevationSmall = 2.0;
const kElevationNormal = 4.0;
const kElevationBig = 8.0;
const kElevationHuge = 16.0;
const kElevationGiant = 32.0;
//endregion

double onePixel(BuildContext context) {
  return 1 / MediaQuery.of(context).devicePixelRatio;
}
