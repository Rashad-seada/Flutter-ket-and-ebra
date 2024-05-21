import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/views/widgets/space.dart';
import 'package:smart_soft/features/home/views/bloc/home/home_cubit.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../generated/locale_keys.g.dart';

class HomeCard extends StatelessWidget {
  String title;
  String imageUrl;
  HomeCard({super.key,required this.title,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
      child: Container(
        height: 70.h,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: AppTheme.neutral100,
            borderRadius: BorderRadius.circular(3.w),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(4, 4), // changes position of shadow
              ),
            ]),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Image.network(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    imageUrl
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: SlicedContainer(
                color: AppTheme.primary900,
              ),
            ),
            SlicedContainer(
              color: Colors.white,
              child: Text(
                title,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral900, fontSize: 16.sp),
              ).tr(),
            ),

          ],
        ),
      ),
    );
  }
}

class SlicedContainer extends StatelessWidget {
  Color color;
  Widget? child;

  SlicedContainer({super.key, required this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.all(4.w),
        width: double.infinity,
        height: 40.w,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(3.w)),
        child: child,
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height); // Start from the bottom left
    path.lineTo(
      size.width,
      size.height - (size.height * .40),
    ); // Wave peak
    path.lineTo(size.width, 0); // End point
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
