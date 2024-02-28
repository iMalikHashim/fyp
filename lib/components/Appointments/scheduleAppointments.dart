import 'package:flutter/material.dart';

class ScheduleAppointmentScreen extends StatefulWidget {
  @override
  _ScheduleAppointmentScreenState createState() =>
      _ScheduleAppointmentScreenState();
}

class _ScheduleAppointmentScreenState extends State<ScheduleAppointmentScreen> {
  String _selectedGender = '';
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  AppBar topBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Schedule Appointment',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color(0xFF08979D),
      foregroundColor: Colors.white,

      // centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInputField('Name', hintText: 'Enter your name'),
              _buildInputField('Age', hintText: 'Enter your age'),
              _buildInputField('Phone Number',
                  hintText: 'Enter your phone number'),
              _buildInputField('Address', hintText: 'Enter your address'),
              _buildInputField('Medical History',
                  hintText: 'Enter your medical history', maxLines: 3),
              _buildGenderSelection(),
              _buildDateTimeSelection(
                  'Select Date',
                  _selectedDate != null
                      ? 'Selected Date: ${_selectedDate!.toString().substring(0, 10)}'
                      : 'Select Date',
                  _selectDate),
              _buildDateTimeSelection(
                  'Select Time',
                  _selectedTime != null
                      ? 'Selected Time: ${_selectedTime!.format(context)}'
                      : 'Select Time',
                  _selectTime),
              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add your appointment scheduling logic here
                  },
                  child: Text('Schedule Appointment'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF055b5c), // Text color
                    elevation: 0, // No shadow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, {String? hintText, int? maxLines}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            _buildRadio('Male', 'Male'),
            SizedBox(width: 16),
            _buildRadio('Female', 'Female'),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildRadio(String label, String value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: _selectedGender,
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue.toString();
            });
          },
        ),
        Text(label),
      ],
    );
  }

  Widget _buildDateTimeSelection(
      String label, String buttonText, Function(BuildContext) onPressed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => onPressed(context),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 16),
            ),
          ),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF08979D), // Text color
            elevation: 0, // No shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
