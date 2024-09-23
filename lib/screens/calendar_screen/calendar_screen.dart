import 'package:doctor_appointment_app/utils/themes/color_themes.dart';
import 'package:doctor_appointment_app/utils/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ClientAppointmentCalendar extends StatefulWidget {
  @override
  _ClientAppointmentCalendarState createState() => _ClientAppointmentCalendarState();
}

class _ClientAppointmentCalendarState extends State<ClientAppointmentCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Dummy data for available slots
  Map<DateTime, List<String>> availableSlots = {
    DateTime(2024, 9, 24): ["9:00 AM", "11:00 AM", "3:00 PM"],
    DateTime(2024, 9, 25): ["10:00 AM", "1:00 PM", "5:00 PM"],
    DateTime(2024, 9, 26): ["8:00 AM", "12:00 PM", "4:00 PM"],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: customTextWidget(text: "Book an Appointment" , fontSize: 20 , fontWeight: FontWeight.w600 , color: Colors.white),
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Calendar widget
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // Update focused day as well
              });
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            availableGestures: AvailableGestures.all,
          ),
          SizedBox(height: 16),

          // Appointment Slots section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              _selectedDay != null
                  ? 'Available Slots on ${_selectedDay!.toLocal()}'
                  : 'Select a Date to see available slots',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(height: 16),

          // Display available slots for the selected day
          Expanded(
            child: _selectedDay != null && availableSlots.containsKey(_selectedDay)
                ? ListView.builder(
              itemCount: availableSlots[_selectedDay]!.length,
              itemBuilder: (context, index) {
                String timeSlot = availableSlots[_selectedDay]![index];
                return ListTile(
                  leading: Icon(Icons.schedule, color: Colors.blueAccent),
                  title: Text(timeSlot),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Handle booking appointment here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Appointment booked for $timeSlot')),
                      );
                    },
                    child: Text('Book'),
                  ),
                );
              },
            )
                : Center(
              child: Text(
                _selectedDay != null
                    ? 'No available slots on this day.'
                    : 'Select a date to view slots.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
