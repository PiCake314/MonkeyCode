import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:monkey_code/code_handeler.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.light(),
      theme: ThemeData.dark(),
      // darkTheme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  String text = "";
  String lang = "";

  int timer = 0;
  bool end = false;
  int mistakes = 0;

  @override
  void initState() {
    index = Random().nextInt(code.length);
    text = code[index]["script"].toString();
    lang = code[index]["language"].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Image(image: AssetImage("assets/images/Pi-symbol.png")),
      // ),
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image(image: AssetImage("assets/images/Pi-symbol.png")),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.topCenter,
            child: const Text(
              "Monkey Code",
              style: TextStyle(
                fontFamily: "Monaco",
                fontSize: 30,
                color: Colors.white54,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.topRight,
            child: Text(
              lang,
              style: const TextStyle(
                fontFamily: "Monaco",
                fontSize: 20,
                color: Colors.white54,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                int temp = Random().nextInt(code.length);
                while (temp == index) {
                  temp = Random().nextInt(code.length);
                }

                setState(() {
                  index = temp;
                  text = code[index]["script"].toString();
                  lang = code[index]["language"].toString();
                  textController.clear();
                  timer = 0;
                  end = true;
                  mistakes = 0;
                });
              },
              child: const Text(
                "Generate Code",
                style: TextStyle(
                  fontFamily: "Monaco",
                  fontSize: 20,
                  color: Colors.white54,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.bottomRight,
            child: Text(
              "${timer.toString()}s",
              style: const TextStyle(
                fontFamily: "Monaco",
                fontSize: 32,
                color: Colors.white54,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Mistakes: $mistakes",
              style: const TextStyle(
                fontFamily: "Monaco",
                fontSize: 20,
                color: Colors.white54,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: longestLine(text) * 13 + 10,
                  child: CodeHandeler(
                    text: text,
                    // lang: lang,
                    numLines: text.split('\n').length,
                    onTap: () {
                      end = false;
                      Timer.periodic(const Duration(seconds: 1), (t) {
                        setState(() {
                          timer++;
                        });

                        if (textController.text == text) {
                          t.cancel();
                        } else if (timer > 0 && end) {
                          t.cancel();
                          setState(() {
                            timer = 0;
                          });
                        }
                      });
                    },
                    onMistake: () {
                      // debugPrint("Mistake");
                      setState(() {
                        mistakes++;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
