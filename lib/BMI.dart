import "package:flutter/material.dart";

class BMI extends StatefulWidget {
  BMI({Key? key}) : super(key: key);

  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  int currentIndex = 0;
  double height = 0;
  double weight = 0;
  int age = 0;
  String result = "";
  String resultStatus = "";
  Color calculateButtonColor = Colors.blue; // Default color for Male

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(39, 68, 114, 0.8),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.black),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity, 
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0xFF274472), Color(0xFF4169E1)],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  radioButton("Male", Colors.blue, 0),
                  radioButton("Female", Colors.red, 1),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Your Age:",
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 8.0),
              TextField(
                keyboardType: TextInputType.number,
                controller: ageController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your age",
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Your Height in cm:",
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 8.0),
              TextField(
                keyboardType: TextInputType.number,
                controller: heightController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your height in cm",
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Your Weight in kg:",
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 8.0),
              TextField(
                keyboardType: TextInputType.number,
                controller: weightController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your weight in kg",
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      height = double.parse(heightController.text);
                      weight = double.parse(weightController.text);
                      age = int.parse(ageController.text);
                    });
                    calculateBmi(height, weight, age);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: calculateButtonColor, 
                  ),
                  child: const Text(
                    "Calculate",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Your BMI is:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: Text(
                  result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: Text(
                  resultStatus,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  void calculateBmi(double height, double weight, int age) {
    double finalResult = weight / (height * height / 10000);
    String bmi = finalResult.toStringAsFixed(2);
    String status = "";

    if (age < 18) {
      finalResult += 1;
    }

    if (finalResult < 18.5) {
      status = "Underweight";
    } else if (finalResult <= 24.9) {
      status = "Normal";
    } else if (finalResult <= 29.9) {
      status = "Overweight";
    } else {
      status = "Obese";
    }

    setState(() {
      result = "$bmi";
      resultStatus = "Status: $status";
      calculateButtonColor = currentIndex == 0 ? Colors.blue : Colors.red; 
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        height: 80,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: currentIndex == index ? color : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {
            changeIndex(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: currentIndex == index ? Colors.white : color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}