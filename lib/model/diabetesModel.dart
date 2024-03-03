class HealthData {
  double bloodSugarLevel;
  double gfrRate;
  HealthData({required this.bloodSugarLevel, required this.gfrRate});
}

List<HealthData> Hdata = [
  HealthData(bloodSugarLevel: 12.50, gfrRate: 14),
  HealthData(bloodSugarLevel: 14.50, gfrRate: 15),
  HealthData(bloodSugarLevel: 18.50, gfrRate: 16),
];
