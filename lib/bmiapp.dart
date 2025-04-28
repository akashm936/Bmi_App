import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiApp extends StatefulWidget {
  @override
  State<BmiApp> createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  var wtcontroller = TextEditingController();
  var fitcontroller = TextEditingController();
  var inchcontroller = TextEditingController();

  var result = "";
  var bgcolor ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI App"),
        backgroundColor: ThemeData().appBarTheme.backgroundColor,
      ),
      body: Container(
        color: bgcolor!=null? bgcolor : Colors.purpleAccent.shade200 ,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Calculate BMI",style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                TextField(
                  controller: wtcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Your Weight",
                    // label: Text("Enter Your Weight ",style: TextStyle(fontSize: 16),),
                    prefixIcon: Icon(Icons.line_weight),

                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: fitcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Your height in fit",
                    // label: Text("Enter Your height in fit",style: TextStyle(fontSize: 16),),
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: inchcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Your Height in Inch",
                    // label: Text("Enter your Height in Inch",style: TextStyle(fontSize: 16),),
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    var Wt = wtcontroller.text.toString();
                    var FitH = fitcontroller.text.toString();
                    var Inch = inchcontroller.text.toString();

                    if (Wt != "" && FitH != "" && Inch != "") {

                      var iWt = double.parse(Wt);
                      var iFit = double.parse(FitH);
                      var iInch = double.parse(Inch);

                      var tInch = (iFit*12) + iInch;
                      var tCm = tInch * 2.54;
                      var tm = tCm/100;
                      var bmi = iWt/(tm*tm);

                      var msg = "";
                      if(bmi>25){
                        msg = "You're Overweight";
                        bgcolor = Colors.orange.shade200;
                      }
                      else if(bmi<18){
                        msg = "Your are Underweight";
                        bgcolor = Colors.red.shade200;
                      }
                      else{
                        msg = "Your are Healthy";
                        bgcolor = Colors.green.shade200;
                    }
                      print(result);
                      setState(() {
                        result = "Your Bmi is ${bmi.toStringAsFixed(2)}";
                        wtcontroller.clear();
                        fitcontroller.clear();
                        inchcontroller.clear();
                      });

                    } else {
                      setState(() {
                        result = "Please fill all fields Correctly";
                      });
                    }
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                SizedBox(height: 20),
                Text(result, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
