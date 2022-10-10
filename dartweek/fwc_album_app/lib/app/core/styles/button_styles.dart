import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/styles/text_styles.dart';

class ButtonStyles {
  static ButtonStyles? _instance;
  ButtonStyles._();
  static ButtonStyles get i {
    _instance ??= ButtonStyles._();
    return _instance!;
  }

  ButtonStyle get yellowButton => ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.i.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        textStyle: TextStyles.i.textSecondaryFontExtraBold.copyWith(
          fontSize: 14.0,
        ),
      );

  ButtonStyle get yellowOutlineButton => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        side: BorderSide(
          color: ColorsApp.i.yellow,
        ),
        textStyle: TextStyles.i.textSecondaryFontExtraBold.copyWith(
          fontSize: 14.0,
        ),
      );

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.i.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        textStyle: TextStyles.i.textSecondaryFontExtraBold.copyWith(
          fontSize: 14.0,
        ),
      );

  ButtonStyle get primaryOutlineButton => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        side: BorderSide(
          color: ColorsApp.i.primary,
        ),
        textStyle: TextStyles.i.textSecondaryFontExtraBold.copyWith(
          fontSize: 14.0,
        ),
      );
}

extension ButtonStylesExtension on BuildContext {
  ButtonStyles get buttonStyles => ButtonStyles.i;
}
