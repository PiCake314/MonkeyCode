import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:monkey_code/code_handeler.dart';
import 'package:monkey_code/end_screen.dart';
import 'constants.dart';
import 'menu.dart';

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
  List<Map<String, String>> code = HW;
  String text = "";
  String lang = "";

  int timer = 0;
  bool end = false;
  int mistakes = 0;

  @override
  void initState() {
    super.initState();
    index = Random().nextInt(code.length);
    text = code[index]["script"].toString();
    lang = code[index]["language"].toString();
  }

  void reset() {
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
            child: TextButton(
              child: const Text(
                "Monkey Code",
                style: TextStyle(
                  fontFamily: "Monaco",
                  fontSize: 30,
                  color: Colors.white54,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => Menu(chooseMode: (list) {
                      setState(() {
                        code = list;
                        index = Random().nextInt(code.length);
                        text = code[index]["script"].toString();
                        lang = code[index]["language"].toString();
                        textController.clear();
                        timer = 0;
                        end = true;
                        mistakes = 0;
                      });

                      Navigator.of(context).pop();
                    }),
                    transitionDuration: const Duration(milliseconds: 250),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ),
                );
              },
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
              child: const Text(
                "Generate Code",
                style: TextStyle(
                  fontFamily: "Monaco",
                  fontSize: 20,
                  color: Colors.white54,
                ),
              ),
              onPressed: reset,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.bottomRight,
            child: Text(
              "${timer.toString()}s",
              style: const TextStyle(
                fontFamily: "Monaco",
                fontSize: 20,
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

                        if (textController.text.length >= text.length) {
                          t.cancel();
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => EndScreen(
                                code: text,
                                lang: lang,
                                mistakes: mistakes,
                                time: timer,
                                codeList: code,
                                reset: reset,
                              ),
                              transitionDuration:
                                  const Duration(milliseconds: 250),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(opacity: a, child: c),
                            ),
                          );
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
