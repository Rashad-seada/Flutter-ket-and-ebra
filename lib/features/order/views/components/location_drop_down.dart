import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/core_feature/data/entities/citie_entity.dart';

class LocationDropDown extends StatefulWidget {
  double? width;
  double? height;


  List<CityEntity> cities;
  CityEntity selectedCity;

  void Function(CityEntity?)? onChanged;

  LocationDropDown({super.key,this.height,this.width,this.onChanged, required this.cities,required this.selectedCity});

  @override
  State<LocationDropDown> createState() => _LocationDropDownState();
}

class _LocationDropDownState extends State<LocationDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.w),
        border: Border.all(color: AppTheme.neutral300,width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<CityEntity>(
          style: AppTheme.mainTextStyle(
              color: AppTheme.neutral400, fontSize: 12.sp),
          value: widget.selectedCity,
          onChanged: (city){
            setState(() {
              if(widget.onChanged != null){
                widget.onChanged!(city);
              }
            });

          },
          items: widget.cities
              .map<DropdownMenuItem<CityEntity>>(
              (CityEntity value) {
                return DropdownMenuItem<CityEntity>(
                  value: value,
                  child: Text(value.name ?? ''),
                );
              }
          ).toList(),
        ),
      ),

    );
  }
}
