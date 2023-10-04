import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


import '../../../doctor_details/view model/doctor_details_cubit.dart';
import '../../../doctor_details/views/doctor details view.dart';
import '../../view_model/cubit/cubit.dart';
import '../../view_model/cubit/states.dart';

class GetAllDoctors extends StatelessWidget {
  GetAllDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        if (state is GetAllDoctorsLoadingState) {
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(
                color: HexColor('#174068'),

              ),
            ),
          );
        }
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('All Doctors'),
            backgroundColor: HexColor('#174068'),
          ),
          body:  state is GetAllDoctorsLoadingState
              ? Center(
            child: CircularProgressIndicator(
              color: HexColor('#174068'), // Custom color for CircularProgressIndicator
            ),
          )
              :GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: cubit.getALLDoctors?.data?.length ?? 0,
            itemBuilder: (context, index) {
              final sectionData = cubit.getALLDoctors?.data![index];

              // Check if the sectionData is null or not
              if (sectionData == null) {
                return CircularProgressIndicator(); // Display a loading indicator if data is null
              }
              return DoctorCard(
                doctorName: sectionData.name!,
                specialty: sectionData.degree!,
                description: sectionData.description!,
                imageUrl: sectionData.photo!,
                doctorId: sectionData.id!, // Pass the doctor id to the DoctorCard
              );
            },
          ),
        );
      },
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String description;
  final String imageUrl;
  final int doctorId; // Add doctorId

  DoctorCard({
    required this.doctorName,
    required this.specialty,
    required this.description,
    required this.imageUrl,
    required this.doctorId, // Add doctorId to the constructor
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              doctorName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              maxLines: 1, // Set maxLines to 1
              overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              specialty,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                print(doctorId);

                DoctorDetailsCubit.get(context).showDetails(doctorId);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DoctorDetailsView(id: doctorId),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(HexColor('#174068')),
                overlayColor: MaterialStateProperty.all<Color>(HexColor('#0D2D4E')),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.white, width: 2.0),
                  ),
                ),
              ),
              child: Container(
                width: 130.0,
                height: 50.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      HexColor('#174068'),
                      HexColor('#0D2D4E'),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  'Details',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
