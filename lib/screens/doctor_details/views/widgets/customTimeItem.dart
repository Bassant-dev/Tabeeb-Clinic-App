import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/appcolors.dart';
import '../../view model/doctor_details_cubit.dart';
class TimeItem extends StatelessWidget {
  const TimeItem({
    Key? key,
    required this.cubit,
    required this.time,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);
  final String time;
  final DoctorDetailsCubit cubit;
  final bool isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.w,
        height: 30.h,
        decoration: BoxDecoration(
            color: isActive
                ? AppColors.primaryColor
                : const Color(0xff030e191a).withOpacity(0.1),
            borderRadius: BorderRadius.circular(24)),
        child: Center(
            child: Text(
              time,
              style: const TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
