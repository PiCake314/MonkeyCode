import 'package:flutter/material.dart';

import 'Constants.dart';

class Menu extends StatelessWidget {
  final chooseMode;
  const Menu({super.key, required this.chooseMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Game Mode:", style: TextStyle(fontSize: 32)),

              const SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    child: TextButton(
                      child: const Text("Hello World",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white54,
                          ),
                      ),
                      onPressed: () => chooseMode(HW),
                    ),
                  ),

                  SizedBox(
                    width: 200,
                    child: TextButton(
                      child: const Text("Vairables",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white54,
                          ),
                      ),
                      onPressed: () => chooseMode(varDec),
                    ),
                  ),

                  SizedBox(
                    width: 200,
                    child: TextButton(
                      child: const Text("Loops",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white54,
                          ),
                      ),
                      onPressed: () => chooseMode(loops),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
