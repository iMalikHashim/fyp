import 'package:flutter/material.dart';
import 'package:fyp/components/Appointments/displaySchedule.dart';

class ScheduleAppointmentScreen extends StatefulWidget {
  @override
  _ScheduleAppointmentScreenState createState() =>
      _ScheduleAppointmentScreenState();
}

class _ScheduleAppointmentScreenState extends State<ScheduleAppointmentScreen> {
  String _selectedGender = '';
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _medicalHistoryController = TextEditingController();

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _ageController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  AppBar topBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Schedule Appointment',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color(0xFF08979D),
      foregroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInputField('Name',
                    hintText: 'Enter name',
                    controller: _nameController, validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                }),
                _buildInputField('Age',
                    hintText: 'Enter an age',
                    controller: _ageController, validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter age';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid age';
                  }
                  return null;
                }),
                _buildInputField('Phone Number',
                    hintText: 'Enter phone number',
                    controller: _phoneNumberController, validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the phone number';
                  }
                  return null;
                }),
                _buildInputField('Address',
                    hintText: 'Enter the address',
                    controller: _addressController, validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the address';
                  }
                  return null;
                }),
                _buildInputField('Medical History',
                    hintText: 'Enter the medical history',
                    controller: _medicalHistoryController,
                    maxLines: 3, validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the medical history';
                  }
                  return null;
                }),
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
                      if (_formKey.currentState!.validate()) {
                        if (_selectedGender.isEmpty) {
                          // Display error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please select a gender'),
                            ),
                          );
                        } else if (_selectedDate == null) {
                          // Display error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please select a date'),
                            ),
                          );
                        } else if (_selectedTime == null) {
                          // Display error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please select a time'),
                            ),
                          );
                        } else {
                          // Navigate to next screen with data
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DisplayDataScreen(
                                name: _nameController.text,
                                age: _ageController.text,
                                phoneNumber: _phoneNumberController.text,
                                address: _addressController.text,
                                medicalHistory: _medicalHistoryController.text,
                                gender: _selectedGender,
                                selectedDate: _selectedDate,
                                selectedTime: _selectedTime,
                              ),
                            ),
                          );
                        }
                      }
                    },
                    child: Text('Schedule Appointment'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF055b5c),
                      elevation: 0,
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
      ),
    );
  }

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

  Widget _buildInputField(String label,
      {String? hintText,
      int? maxLines,
      TextEditingController? controller,
      String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator,
          keyboardType:
              label.toLowerCase() == 'age' ? TextInputType.number : null,
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

  // Widget _buildGenderSelection() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Gender',
  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //       ),
  //       SizedBox(height: 8),
  //       Row(
  //         children: [
  //           _buildRadio('Male', 'Male'),
  //           SizedBox(width: 16),
  //           _buildRadio('Female', 'Female'),
  //         ],
  //       ),
  //       if (_selectedGender.isEmpty)
  //         Text(
  //           'Please select a gender',
  //           style: TextStyle(color: Colors.red),
  //         ),
  //       SizedBox(height: 16),
  //     ],
  //   );
  // }

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
            backgroundColor: Color(0xFF08979D),
            elevation: 0,
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
