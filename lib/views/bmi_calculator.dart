import 'package:bmi_app_mobile/views/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: context.read<BMIProvider>().heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Height",
                labelStyle: TextStyle(color: Colors.black),
                fillColor: Colors.white30,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: context.read<BMIProvider>().weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Weight",
                labelStyle: TextStyle(color: Colors.black),
                fillColor: Colors.white30,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<BMIProvider>().calculateBMI(),
              child: Text("Calculate"),
            ),
            SizedBox(height: 20),
            Consumer<BMIProvider>(
              builder: (context, provider, child) {
                Color categoryColor = provider.bmiCategory ==
                            "Underweight\n(BMI < 18.5)" ||
                        provider.bmiCategory == "Overweight\n(BMI 25 - 29.9)" ||
                        provider.bmiCategory == "Obesity\n(BMI 30 or higher)"
                    ? Colors.red
                    : Colors.green;

                return Column(
                  children: [
                    Text(
                      provider.bmi == 0
                          ? ''
                          : "Your BMI: ${provider.bmi.toStringAsFixed(1)} kg/m²",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      provider.bmiCategory,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: categoryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
