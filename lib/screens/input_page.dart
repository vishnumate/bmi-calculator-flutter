import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Meter {
  ammeter,
  voltmeter,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Meter selectedMeter;
  double forwardVoltage = 0.0;
  double diodeVoltage = 0.6;
  int resistance = 100;
  double current = 0.0;
  double voltage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('VI CHARACTERISTICS OF DIODE')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedMeter = Meter.ammeter;
                      });
                    },
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AMMETER',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              current.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'A',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'VOLTMETER',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              voltage.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'V',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'FORWARD VOLTAGE',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        forwardVoltage.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'V',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 14.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 28.0),
                    ),
                    child: Slider(
                      value: forwardVoltage.toDouble(),
                      min: 0.0,
                      max: 2.0,
                      onChanged: (double newvalue) {
                        setState(() {
                          String fv;
                          fv = newvalue.toStringAsFixed(1);
                          forwardVoltage = double.parse(fv);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'DIODE VOLTAGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          diodeVoltage.toStringAsFixed(1),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  diodeVoltage = diodeVoltage - 0.1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  diodeVoltage = diodeVoltage + 0.1;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'RESISTANCE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          resistance.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  resistance = resistance - 100;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  resistance = resistance + 100;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              double current() {
                if (forwardVoltage == 0.7 &&
                    diodeVoltage == 0.6 &&
                    resistance == 100) {
                  return 0.25;
                }
              }

              double voltage() {
                if (forwardVoltage == 0.7 &&
                    diodeVoltage == 0.6 &&
                    resistance == 100) {
                  return 0.05;
                }
              }

              //   CalculatorBrain calc = CalculatorBrain(
              //       forwardVoltage: forwardVoltage, diodeVoltage: diodeVoltage);
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ResultsPage(
              //           // bmiResult: calc.calculateBMI(),
              //           // resultText: calc.getResult(),
              //           // interpretation: calc.getInterpretation(),
              //           ),
              //     ),
              //   );
            },
          ),
        ],
      ),
    );
  }
}

// Container(
// margin: EdgeInsets.all(15.0),
// decoration: BoxDecoration(
// color: Color(0xFF1DE33),
// borderRadius: BorderRadius.circular(10.0),
// ),
// height: 200.0,
// width: 170.0,
// ),

// Color maleCardColor = kInactiveCardColor;
// Color femaleCardColor = kInactiveCardColor;
//
// //1=male, 2=female
//
// void updateColor(Gender selectedGender) {
//   //male card pressed
//   if (selectedGender == Gender.male) {
//     if (maleCardColor == kInactiveCardColor) {
//       maleCardColor = kActiveCardColor;
//       femaleCardColor = kInactiveCardColor;
//     } else {
//       maleCardColor = kInactiveCardColor;
//     }
//   }
//   //female card pressed
//   if (selectedGender == Gender.female) {
//     if (femaleCardColor == kInactiveCardColor) {
//       femaleCardColor = kActiveCardColor;
//       maleCardColor = kInactiveCardColor;
//     } else {
//       femaleCardColor = kInactiveCardColor;
//     }
//   }
// }
