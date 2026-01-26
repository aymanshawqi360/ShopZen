import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacing {
  // Padding - All Sides
  static EdgeInsets get paddingAll4 => EdgeInsets.all(4.w);
  static EdgeInsets get paddingAll8 => EdgeInsets.all(8.w);
  static EdgeInsets get paddingAll12 => EdgeInsets.all(12.w);
  static EdgeInsets get paddingAll14 => EdgeInsets.all(14.w);
  static EdgeInsets get paddingAll16 => EdgeInsets.all(16.w);
  static EdgeInsets get paddingAll20 => EdgeInsets.all(20.w);
  static EdgeInsets get paddingAll24 => EdgeInsets.all(24.w);

  // Padding - Horizontal
  static EdgeInsets get paddingH8 => EdgeInsets.symmetric(horizontal: 8.w);
  static EdgeInsets get paddingH10 => EdgeInsets.symmetric(horizontal: 10.w);
  static EdgeInsets get paddingH12 => EdgeInsets.symmetric(horizontal: 12.w);
  static EdgeInsets get paddingH16 => EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets get paddingH18 => EdgeInsets.symmetric(horizontal: 18.w);
  static EdgeInsets get paddingH20 => EdgeInsets.symmetric(horizontal: 20.w);
  static EdgeInsets get paddingH24 => EdgeInsets.symmetric(horizontal: 24.w);
  static EdgeInsets get paddingH28 => EdgeInsets.symmetric(horizontal: 28.w);
  static EdgeInsets get paddingH40 => EdgeInsets.symmetric(horizontal: 40.w);
  static EdgeInsets get paddingH19 => EdgeInsets.symmetric(horizontal: 19.w);

  // Padding - Vertical
  static EdgeInsets get paddingAllH2 => EdgeInsets.all(2.h);
  static EdgeInsets get paddingV4 => EdgeInsets.symmetric(vertical: 4.h);
  static EdgeInsets get paddingV8 => EdgeInsets.symmetric(vertical: 8.h);
  static EdgeInsets get paddingV10 => EdgeInsets.symmetric(vertical: 10.h);
  static EdgeInsets get paddingV12 => EdgeInsets.symmetric(vertical: 12.h);
  static EdgeInsets get paddingV16 => EdgeInsets.symmetric(vertical: 16.h);
  static EdgeInsets get paddingV20 => EdgeInsets.symmetric(vertical: 20.h);
  static EdgeInsets get paddingV23 => EdgeInsets.symmetric(vertical: 23.h);

  // Padding - Combined

  // static EdgeInsets paddingHV({
  //   required double horizontal,
  //   required double vertical,
  // }) =>
  //     EdgeInsets.symmetric(horizontal: horizontal.w, vertical: vertical.h);

  // static EdgeInsets symmetricPadding({
  //   required double horizontal,
  //   required double vertical,
  // }) =>
  //     EdgeInsets.symmetric(horizontal: horizontal.w, vertical: vertical.h);

  static EdgeInsets get paddingH12V12 =>
      EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h);
  static EdgeInsets get paddingH16V8 =>
      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h);      
  static EdgeInsets get paddingH24V12 =>
      EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h);
  static EdgeInsets get paddingH10V4 =>
      EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h);
  static EdgeInsets get paddingH12V6 =>
      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h);
  static EdgeInsets get paddingH16V14 =>
      EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h);
  static EdgeInsets get paddingH24V24 =>
      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h);
  static EdgeInsets get paddingH16V10 =>
      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h);
      static EdgeInsets get paddingH16V12 =>
      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h);
  static EdgeInsets get paddingH16V45 =>
      EdgeInsets.symmetric(horizontal: 16.w, vertical: 45.h);
  static EdgeInsets get paddingH20V16 =>
      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h);
  static EdgeInsets get paddingH12V8 =>
      EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h);
      static EdgeInsets get paddingH8V15 =>
      EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h);
  static EdgeInsets get paddingH123V14 =>
      EdgeInsets.symmetric(horizontal: 123.w, vertical: 14.h);

  // Padding - Custom

  static EdgeInsets paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => EdgeInsets.only(
    left: left.w,
    top: top.h,
    right: right.w,
    bottom: bottom.h,
  );

  static EdgeInsets get paddingL28R24 =>
      EdgeInsets.only(left: 28.w, right: 24.w);
  static EdgeInsets get paddingR20T10 =>
      EdgeInsets.only(right: 20.w, top: 10.h);
  static EdgeInsets get paddingL16R16B23 =>
      EdgeInsets.only(left: 16.w, right: 16.w, bottom: 23.h);
  static EdgeInsets get paddingL22B5 =>
      EdgeInsets.only(left: 22.w, bottom: 5.h);
  static EdgeInsets get paddingL23R23T15B15 =>
      EdgeInsets.only(left: 23.w, right: 23.w, top: 15.h, bottom: 15.h);
      static EdgeInsets get paddingT5 =>
      EdgeInsets.only( top: 2.8.h, );
      static EdgeInsets get paddingL20R20B15 =>
      EdgeInsets.only( left: 20.w,right: 20.w,bottom: 15.h);
      static EdgeInsets get paddingL20R20 =>
      EdgeInsets.only( left: 20.w,right: 20.w,);
      static EdgeInsets get paddingL8R8 =>
      EdgeInsets.only( left: 8.w,right: 8.w,);
  static EdgeInsets get paddingT24L19R19B19 =>
      EdgeInsets.only(top: 24.h, left: 19.w, right: 19.w, bottom: 19.h);
      static EdgeInsets get paddingT5L8R8B19 =>
      EdgeInsets.only(top: 5.h, left: 8.w, right: 8.w, bottom: 19.h);

  // Margin - All Sides
  static EdgeInsets get marginAll4 => EdgeInsets.all(4.w);
  static EdgeInsets get marginAll8 => EdgeInsets.all(8.w);
  static EdgeInsets get marginAll12 => EdgeInsets.all(12.w);
  static EdgeInsets get marginAll16 => EdgeInsets.all(16.w);
  static EdgeInsets get marginAll20 => EdgeInsets.all(20.w);
  static EdgeInsets get marginAll24 => EdgeInsets.all(24.w);
  static EdgeInsets get marginB10 => EdgeInsets.only(bottom: 10.h);
  static EdgeInsets get marginB14 => EdgeInsets.only(bottom: 14.h);

  // Margin - Horizontal
  static EdgeInsets get marginH8 => EdgeInsets.symmetric(horizontal: 8.w);
  static EdgeInsets get marginH12 => EdgeInsets.symmetric(horizontal: 12.w);
  static EdgeInsets get marginH16 => EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets get marginH20 => EdgeInsets.symmetric(horizontal: 20.w);
  static EdgeInsets get marginH24 => EdgeInsets.symmetric(horizontal: 24.w);

  // Margin - Vertical
  static EdgeInsets get marginV4 => EdgeInsets.symmetric(vertical: 4.h);
  static EdgeInsets get marginV8 => EdgeInsets.symmetric(vertical: 8.h);
  static EdgeInsets get marginV12 => EdgeInsets.symmetric(vertical: 12.h);
  static EdgeInsets get marginV16 => EdgeInsets.symmetric(vertical: 16.h);
  static EdgeInsets get marginV20 => EdgeInsets.symmetric(vertical: 20.h);

  // Margin - Custom

  static EdgeInsets marginOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => EdgeInsets.only(
    left: left.w,
    top: top.h,
    right: right.w,
    bottom: bottom.h,
  );

  static EdgeInsets get marginR8 => EdgeInsets.only(right: 8.w);

 
  // ========= CUSTOM GAPS =========

  static SizedBox customGapH(double height) => SizedBox(height: height.h);
  static SizedBox customGapW(double width) => SizedBox(width: width.w);

  // ========= HELPER METHODS (Factory methods) =========

  static SizedBox horizontal(double horizontal, {Widget? child}) =>
      SizedBox(width: horizontal.w, child: child);
  static SizedBox vertical(double vertical, {Widget? child}) =>
      SizedBox(height: vertical.h, child: child);

  static EdgeInsets horizontalPadding(double horizontal) =>
      EdgeInsets.symmetric(horizontal: horizontal.w);

  static EdgeInsets verticalPadding(double vertical) =>
      EdgeInsets.symmetric(vertical: vertical.h);

  static EdgeInsets allPadding(double value) => EdgeInsets.all(value.w);

  static EdgeInsets customPadding({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) => EdgeInsets.only(
    left: (left ?? 0).w,
    top: (top ?? 0).h,
    right: (right ?? 0).w,
    bottom: (bottom ?? 0).h,
  );

  
  static EdgeInsets get screenPaddingH => paddingH20;
  static EdgeInsets get screenPaddingH16 => paddingH16;
  static EdgeInsets get buttonPadding => paddingH20;
  static EdgeInsets get textFieldPadding => paddingH20;

  // ========= circular spacing =========
  static final borderRadius2 = BorderRadius.circular(2.0);
  static final borderRadius4 = BorderRadius.circular(4.0);
  static final borderRadius8 = BorderRadius.circular(8.0);
  static final borderRadius12 = BorderRadius.circular(12.0);
  static final borderRadius16 = BorderRadius.circular(16.0);
  static final borderRadius20 = BorderRadius.circular(20.0);
  static final borderRadius24 = BorderRadius.circular(24.0);
  static final borderRadius30 = BorderRadius.circular(30.0);
  static final borderRadius50 = BorderRadius.circular(50.0);
}
