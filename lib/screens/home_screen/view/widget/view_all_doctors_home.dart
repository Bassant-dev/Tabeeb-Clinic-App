import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View All Doctors'),
        backgroundColor: HexColor('#174068'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: 10, // Replace with your actual item count
        itemBuilder: (BuildContext context, int index) {
          // Replace this with the content of each grid item
          return DoctorCard(
            index: index,
            doctorName: 'Doctor $index',
            specialty: 'Cardiologist',
            description:
            'Experienced Cardiologist with 10+ years of practice. Highly skilled in treating heart-related conditions.',
            grade: 'Grade A',
            imageUrl: 'https://example.com/doctor.jpg', // Replace with the actual image URL
          );
        },
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final int index;
  final String doctorName;
  final String specialty;
  final String description;
  final String grade;
  final String imageUrl;

  DoctorCard({
    required this.index,
    required this.doctorName,
    required this.specialty,
    required this.description,
    required this.grade,
    required this.imageUrl,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Add rounded corners
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
          SizedBox(height: 8.0), // Add spacing
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              doctorName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'YourCustomFont'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              specialty,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          SizedBox(height: 8.0), // Add spacing
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          SizedBox(height: 8.0), // Add spacing
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              grade,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue), // Customize color
            ),
          ),
          SizedBox(height: 8.0), // Add spacing
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                // Add your action here when the card is tapped
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(HexColor('#174068')),
                overlayColor: MaterialStateProperty.all<Color>(HexColor('#0D2D4E')), // Color when the button is pressed
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Custom shape with rounded corners
                    side: BorderSide(color: Colors.white, width: 2.0), // Add a white border
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
                  borderRadius: BorderRadius.circular(20.0), // Match the button shape
                ),
                child: Text(
                  'View Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0), // Add spacing
        ],
      ),
    );
  }
}
