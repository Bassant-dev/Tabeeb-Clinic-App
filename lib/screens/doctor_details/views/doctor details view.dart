

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/appcolors.dart';
import '../../../core/appfont.dart';
import '../view model/doctor_details_cubit.dart';


class DoctorDetailsView extends StatelessWidget {
 DoctorDetailsView({Key? key,required this.id}) : super(key: key);
int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
            builder: (context, state) {
              var cubit = BlocProvider.of<DoctorDetailsCubit>(context);
              String timeChecked='';
              return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    width: 360.w,
                    height: 215.h,
                    color: AppColors.primaryColor,
                    child: Image.network('${cubit.model?.doctorDataModel.photo}',fit: BoxFit.fill),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cubit.model?.doctorDataModel.name}',
                          style: Styles.textStyle34.copyWith(
                            color: const Color(0xff0B2030E19),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 17.h,
                        ),
                        Text(
                          '${cubit.model?.doctorDataModel.description}',
                          style: Styles.textStyle16
                              .copyWith(color: const Color(0xff0B2030E19)),
                        ),
                        SizedBox(
                          height: 11.h,
                        ),
                        Container(
                          height: 1.h,
                          width: 312.w,
                          color: const Color(0x4D030E19),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        const Text('Select date'),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'yy/mm/dd ',
                          ),
                          onTap: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              builder: (context, child) {
                                return Theme(
                                    data: Theme.of(context).copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: AppColors.primaryColor,
                                          surface: AppColors.primaryColor,
                                        )),
                                    child: child!);
                              },
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000),
                            );
                            cubit.changeDateTime(pickedDate);
                          },
                          readOnly: true,
                          showCursor: false,
                          controller: cubit.dateTimeController,
                        ),
                        Container(
                          height: 1.h,
                          width: 312.w,
                          color: const Color(0x4D030E19),
                        ),
                        SizedBox(
                          height: 16.67.h,
                        ),
                        Text('Select time',
                            style: Styles.textStyle16
                                .copyWith(color: const Color(0xB2030E19))),
                        SizedBox(
                          height: 8.h,
                        ),
                        SizedBox(
                          height: 50.h,
                          child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                  child: TimeItem(
                                      cubit: cubit,
                                      time: cubit.time[index],
                                      isActive: cubit.currentIndex == index,
                                      onTap: () {
                                        timeChecked= cubit.time[index];

                                        cubit.changeIndex(index);
                                      }),
                                );
                              },
                              itemCount: cubit.time.length,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics()),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        SizedBox(
                          width: 328.w,
                          height: 36.h,
                          child: ElevatedButton(
                              onPressed: () {
                                cubit.bookAppointment(timeChecked,context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor),
                              child: Text(
                                'Book an appointment',
                                style: Styles.textStyle14
                                    .copyWith(fontWeight: FontWeight.w500),
                              )),
                        ),
                      ],
                    ),
                  )
                ]),
              );
            },
          ),
        ));
  }
}

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