import 'package:flutter/material.dart';

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View All Doctors'),
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
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0, // Add elevation for a raised look
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              doctorName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              specialty,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              grade,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Add your action here when the card is tapped
              },
              child: Text('View Profile'),
            ),
          ),
        ],
      ),
    );
  }
}
