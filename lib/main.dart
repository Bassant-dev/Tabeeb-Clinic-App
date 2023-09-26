import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care_clinic/screens/LoginScreen/viewmodel/SignIncubit/SigninCubit.dart';
import 'package:v_care_clinic/screens/ProfileScreen/viewmodel/UserProfileCubit/UserProfileCubit.dart';
import 'package:v_care_clinic/screens/doctor_details/view%20model/doctor_details_cubit.dart';

import 'package:v_care_clinic/screens/home_screen/view/widget/home_screen_body.dart';
import 'package:v_care_clinic/screens/home_screen/view_model/cubit/cubit.dart';
import 'package:v_care_clinic/screens/register_screen/view/register_screen.dart';
import 'package:v_care_clinic/screens/register_screen/view_model/cubit/cubit.dart';
import 'package:v_care_clinic/screens/search/view%20model/search_cubit.dart';
import 'package:v_care_clinic/screens/splash_screen/splash_screen.dart';

import 'core/bloc_observer.dart';
import 'core/cache_helper.dart';
import 'core/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.Init_dio();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=> RegisterCubit()),
            BlocProvider(create: (context)=> HomeCubit()..getAllDoctorSpec()..getAllCity()..getAllGovernment()..getAllSpecializatio()),
            BlocProvider(create: (context)=> DoctorDetailsCubit()),
            BlocProvider(create: (context)=>  SignInCubit()),
            BlocProvider(create: (context)=>  SearchCubit ()),
            BlocProvider(create: (context)=>  UserProfileCubit()..GetUserData()..GetAppointments(),)




          ],
      child: ScreenUtilInit(
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.blueAccent,
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              elevation: 20.0,
              backgroundColor: Colors.white,
            ),

            useMaterial3: false ,
          ),
          home:MyHomePage(),
        ),
      ),
    );
  }
}

