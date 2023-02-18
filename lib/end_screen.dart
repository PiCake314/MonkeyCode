import 'package:flutter/material.dart';
import 'package:monkey_code/Constants.dart';

class EndScreen extends StatelessWidget {
  final String code;
  final String lang;
  final int mistakes;
  final int time;
  final List<Map<String, String>> codeList;
  final Function reset;
  const EndScreen(
    {super.key,
    required this.code,
    required this.lang,
    required this.mistakes,
    required this.time,
    required this.codeList,
    required this.reset,}
  );

  // int wordsInCode(String s) {
  //   String words = s.replaceAll("\n", " ");
  //   return words.split(" ").length;
  // }

  int numOfChars(String s) {
    return s.replaceAll("\n", " ").length;
  }

  String findTestType(List<Map<String, String>> list) {
    if (list == HW)
      return "Hello World Program";
    else if (list == varDec)
      return "Variable Declaration";
    else
      return "Loops";
  }

  @override
  Widget build(BuildContext context) {
    // int wpm = ((wordsInCode(code) / time) * 60).round();
    int accuracy =
        ((numOfChars(code) - mistakes) / numOfChars(code) * 100).round();
    String type = findTestType(codeList);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(64),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Results:",
                style: TextStyle(
                  fontFamily: "Monaco",
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),

              // Text("WPM: $wpm",
              //   style: const TextStyle(
              //     fontFamily: "Monaco",
              //     fontSize: 30,
              //     color: Colors.white54,
              //   ),
              // ),

              
              Text("Accuracy: $accuracy%",
                style: const TextStyle(
                  fontFamily: "Monaco",
                  fontSize: 20,
                  color: Colors.white54,
                ),
              ),

              Text("Test Type: $type", 
                style: const TextStyle(
                  fontFamily: "Monaco",
                  fontSize: 20,
                  color: Colors.white54,
                ),
              ),

              Text("Language: $lang",
                style: const TextStyle(
                  fontFamily: "Monaco",
                  fontSize: 20,
                  color: Colors.white54,
                ),
              ),


              Text(code,
                style: TextStyle(
                  fontFamily: "Monaco",
                  fontSize: 20,
                  color: mistakes == 0 ? Colors.green : Colors.red,
                ),
              ),


              Text("Time: $time seconds",
                style: const TextStyle(
                  fontFamily: "Monaco",
                  fontSize: 20,
                  color: Colors.white54,
                ),
              ),

              const SizedBox(height: 32),
        
              TextButton(
                child: const Text("Try Again", style: TextStyle( fontSize: 32)),
                
                onPressed: () {
                  Navigator.pop(context);
                  reset();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
