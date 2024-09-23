import 'package:doctor_appointment_app/utils/themes/color_themes.dart';
import 'package:doctor_appointment_app/utils/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/widget/text_widget.dart';

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
    DateTime(2024, 9, 27): ["9:00 AM", "11:00 AM", "3:00 PM"],
    DateTime(2024, 9, 28): ["10:00 AM", "1:00 PM", "5:00 PM"],
    DateTime(2024, 9, 29): ["8:00 AM", "12:00 PM", "4:00 PM"],
    DateTime(2024, 9, 30): ["8:00 AM", "12:00 PM", "4:00 PM"],

  };

  // Function to remove time component from DateTime
  DateTime _stripTime(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: customTextWidget(text: "Book an Appointment", fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
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
          const SizedBox(height: 16),

          // Appointment Slots section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: customTextWidget(
             text:  _selectedDay != null
                  ? 'Available Slots on ${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}'
                  : 'Select a Date to see available slots',
              fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor,
            ),
          ),

          const SizedBox(height: 16),

          // Display available slots for the selected day
          Expanded(
            child: _selectedDay != null && availableSlots.containsKey(_stripTime(_selectedDay!))
                ? ListView.builder(
              itemCount: availableSlots[_stripTime(_selectedDay!)]!.length,
              itemBuilder: (context, index) {
                String timeSlot = availableSlots[_stripTime(_selectedDay!)]![index];
                return ListTile(
                  leading: Icon(Icons.schedule, color: primaryColor),
                  title: customTextWidget( text: timeSlot , fontWeight: FontWeight.bold),
                  trailing: customButtonWidget(
                    onPressed: () {
                      // Handle booking appointment here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: customTextWidget( text: 'Appointment booked for $timeSlot' , color: Colors.white)),
                      );
                    },
                    text: 'Book',
                    fontColor: Colors.white,
                    buttonColor: primaryColor,
                    buttonHeight: 30,
                    fontWeight: FontWeight.w600,
                    buttonWidth: 70
                  ),
                );
              },
            )
                : Center(
              child: Text(
                _selectedDay != null
                    ? 'No available slots on this day.'
                    : 'Select a date to view slots.',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
