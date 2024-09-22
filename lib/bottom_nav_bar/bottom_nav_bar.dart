import 'package:doctor_appointment_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Center(child: Text('Calendar Page')),
    const Center(child: Text('Chat Page')),
    const Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Stack(
        children: [
          // Custom background with curve
          Container(
            height: 80,
            color: Colors.white, // Background color of the navbar
          ),
          // Positioned icons
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavBarItem(Icons.home, 0),
                  _buildNavBarItem(Icons.calendar, 1),
                  _buildNavBarItem(Icons.chat, 2),
                  // _buildCenterNavBarItem(Icons.shopping_cart),
                  _buildNavBarItem(Icons.person, 3),
                  // _buildNavBarItem(Icons.receipt, 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Icon(
        icon,
        size: 30,
        color: _selectedIndex == index
            ? Colors.blue
            : Colors.grey, // Highlight selected icon
      ),
    );
  }

  Widget _buildCenterNavBarItem(IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = 2; // Middle item for Cart
        });
      },
      child: Container(
        height: 65,
        width: 65,
        decoration: const BoxDecoration(
          color: Colors.white, // Blue color for the center button
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 35,
          color: Colors.white, // White color for the center icon
        ),
      ),
    );
  }
}

// CustomClipper to create the curved background of the navbar
class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.25, size.height - 50,
        size.width * 0.4, size.height - 50);
    path.quadraticBezierTo(
        size.width * 0.5, size.height - 50, size.width * 0.6, size.height);
    path.quadraticBezierTo(
        size.width * 0.75, size.height - 50, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
