import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:flutter/material.dart';

//********************* LIGHT *************************

TextStyle eLightMediumHintSTL = const TextStyle(
  fontSize: eSFontSize,
  color: eHintCLR,
  fontWeight: FontWeight.normal,
  fontFamily: eNormalOpenSansFNT,
);

TextStyle eLightMediumHintWthSTL = const TextStyle(
  fontSize: eSFontSize,
  color: eWhiteCLR,
  fontWeight: FontWeight.normal,
  fontFamily: eNormalOpenSansFNT,
);

TextStyle eLightSmallTextStyleSTL = const TextStyle(
  fontSize: eSFontSize,
  color: eBlackCLR,
  fontWeight: FontWeight.normal,
  fontFamily: eNormalOpenSansFNT,
);
TextStyle eLightDoubleExtraSmallTextStyleSTL = const TextStyle(
  fontSize: eDoubleExtraSmallFontSize,
  color: eBlackCLR,
  fontWeight: FontWeight.normal,
  fontFamily: eNormalOpenSansFNT,
);
TextStyle eLightExtraSmallTextStyleSTL = const TextStyle(
  fontSize: eESFontSize,
  color: eBlackCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);

TextStyle eLightMediumTextStyleSTL = const TextStyle(
  fontSize: eMFontSize,
  color: eBlackCLR,
  fontWeight: FontWeight.normal,
  fontFamily: eNormalOpenSansFNT,
);
TextStyle eLightMediumTitleStyleSTL = const TextStyle(
  fontSize: eMFontSize,
  color: eBlackCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);

TextStyle eLightSmallTitleStyleSTL = const TextStyle(
  fontSize: eSFontSize,
  color: eBlackCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);
TextStyle eLightSmallTxtStyleSTL = const TextStyle(
  fontSize: eLFontSize,
  color: eBlackCLR,
  fontWeight: FontWeight.normal,
  fontFamily: eNormalOpenSansFNT,
);
TextStyle eELTextStyleSTL = const TextStyle(
  fontSize: eELFontSize,
  color: eBlackCLR,
  fontWeight: FontWeight.normal,
  fontFamily: eNormalOpenSansFNT,
);

TextStyle eLightBtnTextStyleSTL = const TextStyle(
  fontSize: eSFontSize,
  color: eWhiteCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);

TextStyle eWhiteELTextStyleSTL = const TextStyle(
  fontSize: eELFontSize,
  color: eWhiteCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);
TextStyle eWhiteExtraSmallTextStyleSTL = const TextStyle(
  fontSize: eESFontSize,
  color: eWhiteCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);

//********************* DARK *************************

TextStyle eDarkMHintSTL = const TextStyle(
  fontSize: eSFontSize,
  color: eDarkThemeTextCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);

TextStyle eDarkSmallTextStyleSTL = const TextStyle(
  fontSize: eSFontSize,
  color: eDarkThemeTextCLR,
  fontWeight: FontWeight.normal,
  fontFamily: eNormalOpenSansFNT,
);



TextStyle eDarkDoubleExtraSmallTextStyleSTL = const TextStyle(
  fontSize: eDoubleExtraSmallFontSize,
  color: eDarkThemeTextCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);
TextStyle eDarkExtraSmallTextStyleSTL = const TextStyle(
  fontSize: eESFontSize,
  color: eDarkThemeTextCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);



TextStyle eDarkMediumTextStyleSTL = const TextStyle(
  fontSize: eMFontSize,
  color: eDarkThemeTextCLR,
  fontWeight: FontWeight.normal,
  fontFamily: eNormalOpenSansFNT,
);
TextStyle eDarkMediumTitleStyleSTL = const TextStyle(
  fontSize: eMFontSize,
  color: eDarkThemeTextCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);
TextStyle eDarkSmallTitleStyleSTL = const TextStyle(
  fontSize: eSFontSize,
  color: eDarkThemeTextCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);



TextStyle eDarkLTextStyleSTL = const TextStyle(
  fontSize: eLFontSize,
  color: eDarkThemeTextCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);
TextStyle eLightLTextStyleSTL = const TextStyle(
  fontSize: eLFontSize,
  color: eHintCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);
TextStyle eDarkELTextStyleSTL = const TextStyle(
  fontSize: eELFontSize,
  color: eDarkThemeTextCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);TextStyle eLightELTextStyleSTL = const TextStyle(
  fontSize: eELFontSize,
  color: eBlackCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);

TextStyle eDarkBtnTextStyleSTL = const TextStyle(
  fontSize: eMFontSize,
  color: eDarkThemeTextCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);

TextStyle eLightAppNameStyle = const TextStyle(
    fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.w500);

TextStyle eLightMediumTitleStyleWhtSTL = const TextStyle(
  fontSize: eMFontSize,
  color: eWhiteCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);

TextStyle eLightMediumSuccessStyleWhtSTL = const TextStyle(
  fontSize: eELFontSize,
  color: eLSuccessCLR,
  fontWeight: FontWeight.bold,
  fontFamily: eNormalOpenSansFNT,
);

TextStyle subTitleShadowTextStyle =
const TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600,
    /*color:Color(0xffFFFFDF)*/
    shadows: [
      Shadow(
        blurRadius: 3.0, // shadow blur
        color: Colors.white, // shadow color
        offset: Offset(0.0, 0.0), // how much shadow will be shown
      )
    ]);
TextStyle smallSubTitleShadowTextStyle =
const TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w600,
    /*color:Color(0xffFFFFDF)*/
    shadows: [
      Shadow(
        blurRadius: 2.0, // shadow blur
        color: Colors.white, // shadow color
        offset: Offset(0.0, 0.0), // how much shadow will be shown
      )
    ]);

TextStyle titleShadowTextStyle =
const TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold,
    /*color:Color(0xffFFFFDF)*/
    shadows: [
      Shadow(
        blurRadius: 5.0, // shadow blur
        color: Colors.white, // shadow color
        offset: Offset(0.0, 0.0), // how much shadow will be shown
      )
    ]);


TextStyle largeTitleShadowTextStyle =
const TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold,
    /*color:Color(0xffFFFFDF)*/
    shadows: [
      Shadow(
        blurRadius: 5.0, // shadow blur
        color: Colors.white, // shadow color
        offset: Offset(0.0, 0.0), // how much shadow will be shown
      )
    ]);