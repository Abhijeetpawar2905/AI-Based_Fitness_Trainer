/*import 'dart:ffi';

import 'package:bmi_calculator/ui/shared/input.dart';
import 'package:flutter/material.dart';

import 'package:bmi_calculator/theme/colors.dart';
import 'package:bmi_calculator/ui/shared/button.dart';


class BMI extends StatefulWidget {
 BMI({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final _formKey = GlobalKey<FormState>();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  double bmi;

  Function _validateValue(String label) {
    return (String value) {
      return value.isEmpty ? '$label is required' : null;
    };
  }

  void _calculateBMI() {
    if (_formKey.currentState.validate()) {
      final height = double.tryParse(_heightController.text);
      final weight = double.tryParse(_weightController.text);
      print('H $height - W $weight');
      setState(() {
        bmi = weight / (height * height) * 10000;
      });
    }
  }

  List<Color> _getStyleForBMI() {
    if (bmi == null) {
      return ResultColors.idle;
    } else if (bmi < 18.5) {
      return ResultColors.underweight;
    } else if (bmi < 24.9) {
      return ResultColors.normal;
    } else if (bmi < 29.9) {
      return ResultColors.overweight;
    }
    return ResultColors.obsese;
  }

  bool _usePrimaryButton() {
    if (bmi == null || (bmi > 18.5 && bmi < 29.9)) return true;
    return false;
  }

  String _getMessageForBMI() {
    if (bmi < 18.5) {
      return 'A BIT MORE WEIGHT\nWOULD DO NO ARM';
    } else if (bmi < 24.9) {
      return 'YOU’RE IN GREAT SHAPE\nKEEP YOUR HEALTHY STYLE';
    } else if (bmi < 29.9) {
      return 'TIME TO TAKE SOME\nATTENTION TO WHAT YOU EAT';
    }
    return 'TIME FOR SOME\nMORE HEALTHY SNACKS';
  }

  Widget _buildHeading(BuildContext context, List<Color> style) {
    if (bmi == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HEALTH APP',
            style: TextStyle(
              color: bmi != null ? style[1] : AppColors.darkGrey,
              fontSize: 16.0,
            ),
          ),
          Text(
            'CALCULATE YOUR BMI',
            style: TextStyle(
              color: style[1],
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (bmi != null) Text('$bmi'),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'YOUR RESULT',
              style: TextStyle(
                color: bmi != null ? style[1] : AppColors.darkGrey,
                fontSize: 16.0,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  bmi = null;
                });
              },
              child: Icon(
                Icons.close,
                color: style[1],
              ),
            ),
          ],
        ),
        Text(
          '${bmi.toStringAsFixed(0)}',
          style: TextStyle(
            color: style[1],
            fontSize: 80.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          _getMessageForBMI(),
          style: TextStyle(
            color: bmi != null ? style[1] : AppColors.darkGrey,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Color> style = _getStyleForBMI();

    return Scaffold(
      backgroundColor: style[0],
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeading(context, style),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Input.number(
                              title: 'Age',
                              controller: _ageController,
                              color: style[1],
                              validator: _validateValue('Age'),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Input.number(
                              title: 'Height',
                              controller: _heightController,
                              suffixText: 'cm',
                              color: style[1],
                              validator: _validateValue('Height'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Input.number(
                        title: 'Weight',
                        color: style[1],
                        controller: _weightController,
                        suffixText: 'kg',
                        validator: _validateValue('Height'),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    _usePrimaryButton()
                        ? Button.primary(
                            title: 'Calculate',
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              _calculateBMI();
                            },
                          )
                        : Button.secondary(
                            title: 'Calculate',
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              _calculateBMI();
                            },
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/