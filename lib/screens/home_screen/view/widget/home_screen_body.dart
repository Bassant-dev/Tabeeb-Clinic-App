import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:v_care_clinic/screens/home_screen/view/widget/view_all_doctors_home.dart';

import '../../../ProfileScreen/view/screens/UserProfileScreen.dart';
import '../../../doctor_details/view model/doctor_details_cubit.dart';
import '../../../doctor_details/views/doctor details view.dart';
import '../../view_model/cubit/cubit.dart';
import '../../view_model/cubit/states.dart';


class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({Key? key}) : super(key: key);
  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        var cubit = HomeCubit.get(context);
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.filter_list_outlined),
                    SizedBox(width: 3),
                    TextButton(
                      onPressed: () {
                        _showFilterBottomSheet(context);
                      },
                      child: Text(
                        'Filter',
                        style: TextStyle(fontSize: 14.sp, color: HexColor('#174068')),
                      ),
                    ),


                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Card(
                  child: ExpansionTile(
                    title: Text("CITY"),
                    children: [
                      StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState /*You can rename this!*/){
                            return  Container(
                              height: 200, // Adjust the height as needed
                              child: ListView.builder(
                                itemCount: cubit.cityModel != null ? cubit.cityModel!.data!.length : 0,
                                itemBuilder: (context, index) {
                                  final Data = cubit.cityModel?.data?[index];
                                  return RadioListTile(
                                    title: Text("${Data!.name}"),
                                    value: index+1,
                                    groupValue: cubit.selectItem,
                                    onChanged: (value) {
                                      print(value);
                                      print("m + b");
                                      setState(() {
                                        HomeCubit.get(context).selectItem=value;
                                      });
                                      // HomeCubit.get(context).selectOption(value!);
                                    },

                                  );
                                },
                              ),
                            );
                          }
                      ),
                    ],
                  ),
                ),
                Card(
                  child: ExpansionTile(
                    title: Text("GOVERNMENT"),
                    children: [
                      StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState /*You can rename this!*/){
                            return  Container(
                              height: 200, // Adjust the height as needed
                              child: ListView.builder(
                                itemCount: cubit.governmentModel != null ? cubit.governmentModel!.data!.length : 0,
                                itemBuilder: (context, index) {
                                  final Data = cubit.governmentModel?.data?[index];
                                  return RadioListTile(
                                    title: Text("${Data!.name}"),
                                    value: index+1,
                                    groupValue: cubit.selectItem,
                                    onChanged: (value) {
                                      print(value);
                                      print("m + b");
                                      setState(() {
                                        HomeCubit.get(context).selectItem=value;
                                      });
                                      // HomeCubit.get(context).selectOption(value!);
                                    },

                                  );
                                },
                              ),
                            );
                          }
                      ),
                    ],
                  ),
                ),
                Card(
                  child: ExpansionTile(
                    title: Text("SPECIALIZATION"),
                    children: [
                      StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState /*You can rename this!*/){
                            return  Container(
                              height: 200, // Adjust the height as needed
                              child: ListView.builder(
                                itemCount: cubit.specialModel != null ? cubit.specialModel!.data!.length : 0,
                                itemBuilder: (context, index) {
                                  final Data = cubit.specialModel?.data?[index];
                                  return RadioListTile(
                                    title: Text("${Data!.name}"),
                                    value: index+1,
                                    groupValue: cubit.selectItem,
                                    onChanged: (value) {
                                      print(value);
                                      print("m + b");
                                      setState(() {
                                        HomeCubit.get(context).selectItem=value;
                                      });
                                      // HomeCubit.get(context).selectOption(value!);
                                    },

                                  );
                                },
                              ),
                            );
                          }
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () {



                  },
                  style: ElevatedButton.styleFrom(
                    primary: HexColor('#174068'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    minimumSize: const Size(312, 48),
                  ),
                  child: Text(
                    'Apply',
                    style: GoogleFonts.roboto(fontSize: 14.sp, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        );


      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor('#174068'),
            title: Text('VCare', style: TextStyle(fontSize: 20, color: Colors.white)),
            leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: CircularNotchedRectangle(),
            notchMargin: 5,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home, color: HexColor('#174068')),
                      onPressed: () {},
                    ),
                    Text(
                      'Home',
                      style: TextStyle(fontSize: 12, color: HexColor('#174068')),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.add, color: HexColor('#174068')),
                      onPressed: () {},
                    ),
                    Text(
                      'Doctors',
                      style: TextStyle(fontSize: 12, color: HexColor('#174068')),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.history, color: HexColor('#174068')),
                      onPressed: () {},
                    ),
                    Text(
                      'History',
                      style: TextStyle(fontSize: 12, color: HexColor('#174068')),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.account_box, color: HexColor('#174068')),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UserProfileScreen(),
                          ),
                        );
                      },
                    ),
                    Text(
                      'Account',
                      style: TextStyle(fontSize: 12, color: HexColor('#174068')),
                    ),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
            backgroundColor: HexColor('#174068'),
            elevation: 4.0,
            splashColor: Colors.blueAccent,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.filter_list_outlined),
                  SizedBox(width: 3),
                  TextButton(
                    onPressed: () {
                      _showFilterBottomSheet(context);
                    },
                    child: Text(
                      'Filter',
                      style: TextStyle(fontSize: 14.sp, color: HexColor('#174068')),
                    ),
                  ),


                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cubit.autogenerated != null ? cubit.autogenerated!.data!.length : 0,
                  itemBuilder: (BuildContext context, int sectionIndex) {
                    final sectionData = cubit.autogenerated?.data?[sectionIndex];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                sectionData?.name ?? '',
                                style: TextStyle(fontSize: 20.sp, color: Colors.grey),
                              ),
                            ),
                            SizedBox(width: 5,),
                            GestureDetector(
                              onTap: () {
                                print(sectionData?.id ?? '');
                                print(sectionData?.name ?? '');
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ViewAllScreen(id: sectionData?.id ?? 0), // Default to 0 if id is null
                                  ),
                                );
                              },
                              child: Text(
                                'View all',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            )
                          ],
                        ),
                        sectionData != null ? SizedBox(
                          height: 250,
                          child: ListView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              final doctor = sectionData.doctors![index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 200,
                                  height: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: Color(0xff174068),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(doctor.photo!),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8, top: 8),
                                        child: Text(
                                          doctor.name!,
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          doctor.degree!,
                                          style: TextStyle(fontSize: 14),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                doctor.description!,
                                                style: TextStyle(fontSize: 14),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                print(doctor.id!);
                                                BlocProvider.of<DoctorDetailsCubit>(context).showDetails(doctor.id!);
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) => DoctorDetailsView(id: doctor.id!),
                                                  ),
                                                );
                                              },
                                              icon: Icon(Icons.arrow_right_alt, color: HexColor('#174068')),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ) : SizedBox(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),

        );
      },
    );
  }
}
