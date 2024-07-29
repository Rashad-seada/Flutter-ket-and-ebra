import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/views/widgets/custom_network_image.dart';
import 'package:smart_soft/core/views/widgets/space.dart';

class VariantCard extends StatelessWidget {
  bool isSelect;
  String title;
  String imgUrl;
  void Function()? onTap;
  VariantCard({super.key,this.isSelect = true,required this.title,required this.imgUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(2.w),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          border: Border.all(color: (isSelect)? AppTheme.primary900 : Colors.transparent,width: 1.5)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
               imgUrl,
              width: 12.w,
              height: 12.w,
            ),
            // CustomNetworkImage(
            //   url: imgUrl,
            //   width: 12.w,
            //   height: 12.w,
            // ),
            Space(height: 1.5.h,),


            SizedBox(
              width: 14.w,
              child: Text(
                title,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral900, fontSize: 10.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center
              ),
            ),

          ],
        ),
      ),
    );
  }
}
