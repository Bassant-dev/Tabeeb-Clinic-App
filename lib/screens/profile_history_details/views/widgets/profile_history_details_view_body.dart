import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care_clinic/core/appcolors.dart';
import 'package:v_care_clinic/core/appfont.dart';
import 'package:v_care_clinic/screens/ProfileScreen/models/AppointmentModel/Data.dart';

class ProfileHistoryDetailsViewBody extends StatelessWidget {
 const  ProfileHistoryDetailsViewBody(this.appointment);
 final AppointmentData ?appointment;

  //const ProfileHistoryDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
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
            Row(
              children: [
                Text(
                  'doctor name',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                Text(

                  '${appointment!.doctor!.name!}',
                  style: Styles.textStyle16,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
             Row(
              children: [
                Text(
                  'location',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                Text(

                  '${appointment!.doctor!.address!}',
textAlign: TextAlign.center,

                  style: Styles.textStyle16,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
             Row(
              children: [
                Text(
                  'doctor email',


                  style: Styles.textStyle16,
                ),
                Spacer(),
                Text(
                  '${appointment!.doctor!.email!}',

                  style: Styles.textStyle16,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
             Row(
              children: [
                Text(
                  'phone',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                Text(
                  '${appointment!.doctor!.phone!}',
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
            Row(
              children: [
                Text(
                  'name',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                Text(
                  '${appointment!.patient!.name}',
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
                  'user location',
                  style: Styles.textStyle16,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
             Row(
              children: [
                Text(
                  'email',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                Text(
                  '${appointment!.patient!.email}',
                  style: Styles.textStyle16,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
             Row(
              children: [
                Text(
                  'phone',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                Text(
                  '${appointment!.patient!.phone}',
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
             Row(
              children: [
                Text(
                  'date',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                Flexible(
                  child: Text(
                    '${appointment!.appointmentTime}',
                    style: Styles.textStyle16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
             Row(
              children: [
                Text(
                  'appointment id',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                Text(
                  '${appointment!.id}',
                  style: Styles.textStyle16,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
             Row(
              children: [
                Text(
                  'status',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                Text(
                  '${appointment!.status}',
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
                          '\$${appointment!.appointmentPrice}',

                         // '\$00.00',
                          style: Styles.textStyle16.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}