class CalculatorBrain {
  CalculatorBrain({this.forwardVoltage, this.diodeVoltage, this.resistance});

  double forwardVoltage;
  double diodeVoltage;
  double resistance;
  double current;
  double voltage;

  // String current() {
  //   if (forwardVoltage == 0.7 && diodeVoltage == 0.6 && resistance == 100) {
  //     return 'a';
  //   }
  // }
  //
  // String voltage() {
  //   if (forwardVoltage == 0.7 && diodeVoltage == 0.6 && resistance == 100) {
  //     return 'a';
  //   }
  // }
}
