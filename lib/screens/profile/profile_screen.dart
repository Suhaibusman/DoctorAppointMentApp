import 'package:doctor_appointment_app/utils/constant/image_constant.dart';
import 'package:doctor_appointment_app/utils/themes/color_themes.dart';
import 'package:doctor_appointment_app/utils/widget/button_widget.dart';
import 'package:doctor_appointment_app/utils/widget/text_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: customTextWidget(text: "Profile" , fontSize: 20 , fontWeight: FontWeight.w600 , color: Colors.white),
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Image
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/userImage.png'), // Replace with the actual image
              ),
            ),
            // Client Name
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Email
            Text(
              'john.doe@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),
            Divider(),
            // Contact Information
            ListTile(
              leading: Icon(Icons.phone, color: Colors.blueAccent),
              title: Text('+1 987 654 321'),
              subtitle: Text('Phone Number'),
            ),
            Divider(),
            // Appointment History Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming Appointments',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to Appointment History Screen
                    },
                    child: Text('View All', style: TextStyle(color: Colors.blueAccent)),
                  ),
                ],
              ),
            ),
            // Upcoming Appointment Card (Example)
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(ImageConstant.doctorImage5), // Replace with doctor's image
                ),
                title: Text('Dr. Sarah Johnson'),
                subtitle: Text('Cardiologist\nDate: Sep 25, 2024, 10:00 AM'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to appointment details or doctor details
                },
              ),
            ),
            // Edit Profile Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: customButtonWidget(text: "Logout", onPressed: (){}, fontColor: Colors.white , buttonColor: primaryColor , buttonHeight: 50 ,  fontWeight: FontWeight.w600),
            ),

          ],
        ),
      ),
    );
  }
}

