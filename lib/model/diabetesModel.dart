class HealthData {
  double bloodSugarLevel;
  double gfrRate;
  HealthData({required this.bloodSugarLevel, required this.gfrRate});
}

List<HealthData> hdata = [
  HealthData(bloodSugarLevel: 12.50, gfrRate: 14),
  //We will get this data from firebase (So, bloodsugar/gfr e.t.c)
  HealthData(bloodSugarLevel: 14.50, gfrRate: 15),
  HealthData(bloodSugarLevel: 18.50, gfrRate: 16),
];
