class Patient {
  int? id;
  String name;
  int phone;
  String loc;
  Patient(
      {this.id, required this.name, required this.phone, required this.loc});
}

List<Patient> patientList = [
  Patient(name: "Hashim", phone: 03124300907, loc: "Lahore"),
  Patient(name: "Ali", phone: 0312487657, loc: "Lahore"),
  Patient(name: "Hamza", phone: 03124789907, loc: "Lahore"),
];
