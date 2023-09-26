import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/appcolors.dart';
import '../../../../core/appfont.dart';

import '../../../doctor_details/view model/doctor_details_cubit.dart';

class ProfileHistoryDetailsViewBody extends StatelessWidget {
  const ProfileHistoryDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocProvider.of<DoctorDetailsCubit>(context)
              .dateTimeController
              .text
              .isEmpty
          ? Center(
              child: Text(
              'There is no booking now',
              style: Styles.textStyle20.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                  width: 115.w,
                  height: 35.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                      onPressed: () {},
                      child: Text(
                        'PRINT',
                        style: Styles.textStyle16
                            .copyWith(fontWeight: FontWeight.w500),
                      )),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  'Doctor details',
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Row(
                  children: [
                    Text(
                      'name',
                      style: Styles.textStyle16,
                    ),
                    Spacer(),
                    Text(
                      'doctor name',
                      style: Styles.textStyle16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Row(
                  children: [
                    Text(
                      'location',
                      style: Styles.textStyle16,
                    ),
                    Spacer(),
                    Text(
                      'doctor location',
                      style: Styles.textStyle16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Row(
                  children: [
                    Text(
                      'email',
                      style: Styles.textStyle16,
                    ),
                    Spacer(),
                    Text(
                      'doctor email',
                      style: Styles.textStyle16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Row(
                  children: [
                    Text(
                      'phone',
                      style: Styles.textStyle16,
                    ),
                    Spacer(),
                    Text(
                      'doctor phone',
                      style: Styles.textStyle16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Patient details',
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Row(
                  children: [
                    Text(
                      'name',
                      style: Styles.textStyle16,
                    ),
                    Spacer(),
                    Text(
                      'doctor name',
                      style: Styles.textStyle16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Row(
                  children: [
                    Text(
                      'location',
                      style: Styles.textStyle16,
                    ),
                    Spacer(),
                    Text(
                      'doctor location',
                      style: Styles.textStyle16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Row(
                  children: [
                    Text(
                      'email',
                      style: Styles.textStyle16,
                    ),
                    Spacer(),
                    Text(
                      'doctor email',
                      style: Styles.textStyle16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Row(
                  children: [
                    Text(
                      'phone',
                      style: Styles.textStyle16,
                    ),
                    Spacer(),
                    Text(
                      'doctor phone',
                      style: Styles.textStyle16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Appointment details',
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Row(
                  children: [
                    Text(
                      'date',
                      style: Styles.textStyle16,
                    ),
                    Spacer(),
                    Text(
                      'date',
                      style: Styles.textStyle16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Row(
                  children: [
                    Text(
                      'appointment id',
                      style: Styles.textStyle16,
                    ),
                    Spacer(),
                    Text(
                      'id',
                      style: Styles.textStyle16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Row(
                  children: [
                    Text(
                      'status',
                      style: Styles.textStyle16,
                    ),
                    Spacer(),
                    Text(
                      'status',
                      style: Styles.textStyle16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                    width: 328.w,
                    height: 39.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'Total',
                              style: Styles.textStyle16
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Text(
                              '\$00.00',
                              style: Styles.textStyle16.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )))
              ],
            ),
    );
  }
}
