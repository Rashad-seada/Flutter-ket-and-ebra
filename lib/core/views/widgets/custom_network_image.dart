import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../config/app_images.dart';

class CustomNetworkImage extends StatelessWidget {
  String url;
  double? width;
  double? height;
  BoxFit? fit;
  CustomNetworkImage({super.key,required this.url,this.width,this.height,this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      imageUrl: url,
      placeholder: (context, url) => Padding(
        padding: EdgeInsets.all(8.w),
        child: SvgPicture.asset(
          AppImages.image,
          width: 9.w,
          height: 9.w,
        ),
      ),
      errorWidget: (context, url, error) => Padding(
        padding: EdgeInsets.all(8.w),
        child: SvgPicture.asset(
          AppImages.errorImage,
          width: 9.w,
          height: 9.w,
        ),
      ),
    );
  }
}
