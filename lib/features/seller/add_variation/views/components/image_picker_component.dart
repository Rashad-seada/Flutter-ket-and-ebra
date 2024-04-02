import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/views/widgets/space.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';


class ImagePickerComponent extends StatelessWidget {
  XFile? image;
  void Function()? onTap;
  void Function()? onDeleteTap;

  ImagePickerComponent({super.key,this.image,this.onTap,this.onDeleteTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(2.w),
      child: Container(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 7.w,vertical: 3.h),
        width: 86.w,
        height: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          border: Border.all(color: AppTheme.neutral500)
        ),
        child: image  == null ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Space(height: 5.h,),

            Icon(
              Icons.camera_alt_outlined,
              size: 30.w,
                color: AppTheme.neutral500,
            ),

            Space(height: 1.h,),

            Text(
              LocaleKeys.image_pick,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral500, fontSize: 14.sp
              ),
              textAlign: TextAlign.center,
            ).tr(),

            Space(height: 5.h,),


          ],
        ) : Stack(
          alignment: Alignment.topRight,
          children: [



            SizedBox(child: Image.file(
              File(image!.path),
              fit: BoxFit.cover,
              width: 86.w,
              height: 30.h,
            )),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: onDeleteTap, icon: Icon(
                Icons.close,
                size: 10.w,
                color: AppTheme.neutral500,
              ),),
            ),

          ],),
      ),
    );
  }
}
