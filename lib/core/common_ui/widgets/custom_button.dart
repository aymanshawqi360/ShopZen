import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/constants/app_strings.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/app_text_styles.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final WidgetStateProperty<EdgeInsetsGeometry?>? padding;
  final WidgetStateProperty<double?>? elevation;
  final WidgetStateProperty<Color?>? backgroundColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final WidgetStateProperty<Color?>? shadowColor;
  
  
  final Size ? minimumSize;
  final Widget ?child;
  const CustomButton({
    super.key,
    this.onPressed,
    this.minimumSize,
    this.padding,
    this.elevation,
    this.child,
    this.backgroundColor, this.overlayColor, this.shadowColor
  });
 factory CustomButton.text({
   final  String? text ,
   final TextStyle? style,
   final VoidCallback? onPressed,

}
 ){
  return CustomButton(    
    onPressed: onPressed,
    child: Text(
       text?? AppStrings.getStarted,
        style:style?? AppTextStyles.onboardingSmall.copyWith(color: AppColors.textWhite,fontWeight: FontWeightHelper.bold,fontSize: AppSize.textSizeSp13),
        
      ),
  );
 }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ButtonStyle(
        backgroundColor:
            backgroundColor ??
            MaterialStateProperty.all(AppColors.primaryColor),
        elevation: elevation ?? MaterialStateProperty.all(1),
         padding:
             padding ?? MaterialStateProperty.all(EdgeInsets.zero),

              minimumSize: MaterialStateProperty.all<Size>(minimumSize?? AppSize.sizeW335H50),

        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: AppSpacing.borderRadius8),
        ),

        overlayColor:overlayColor?? MaterialStateProperty.all(Colors.transparent),
        shadowColor:shadowColor?? MaterialStateProperty.all(Colors.black),
      ),
      child: child
    );
  }
}
