import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'intents_actions.dart';

TextEditingController textController = TextEditingController();

class CodeHandeler extends StatefulWidget {
  final String text;
  final int numLines;
  final Function onTap;
  final Function onMistake;
  const CodeHandeler({
    super.key,
    required this.text,
    required this.numLines,
    required this.onTap,
    required this.onMistake,
  });

  @override
  State<CodeHandeler> createState() => _CodeHandelerState();
}

class _CodeHandelerState extends State<CodeHandeler> {
  @override
  Widget build(BuildContext context) {
    // int prevLength = 0;
    // String prevText = "";

    Color textColor = Colors.white;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          alignment: Alignment.topLeft,
          child: Text(
            widget.text,
              style: const TextStyle(
                fontFamily: "Monaco",
                fontSize: 20,
                color: Colors.white54,
                height: 1.3,
              ),
            ),
          ),

        Actions(
          actions: {InsertTabIntent: InsertTabAction()},
          child: Shortcuts(
            shortcuts: {
              LogicalKeySet(LogicalKeyboardKey.tab):
                  InsertTabIntent(4, textController),
              LogicalKeySet(LogicalKeyboardKey.backspace):
                const BackspaceIntent(),
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                // focusNode: FocusNode(),
                // textAlign: TextAlign.center,
                decoration: const InputDecoration(border: InputBorder.none),
                style: TextStyle(
                  fontFamily: "Monaco",
                  fontSize: 20,
                  color: textColor,
                  height: widget.numLines == 1 ? 1 : 1.3,
                ),

                onChanged: (value) {
                  // debugPrint(value);
                  // debugPrint((value == widget.text).toString());
                  if (value.length == 1) {
                    widget.onTap();
                  }

                  if (value.length - 1 > 0 &&
                      value[value.length - 1] !=
                          widget.text[value.length - 1]) {
                    widget.onMistake();
                  }

                },
                controller: textController,
                minLines: widget.numLines,
                maxLines: widget.numLines,
                autofocus: true,
                autocorrect: false,
                enableSuggestions: false,
                enableInteractiveSelection: true,
                cursorColor: Colors.purple,
              ),
            ),
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          alignment: Alignment.topLeft,
          child: RichText(
            text: TextSpan(
              children: [
                for(int i = 0; i < textController.text.length; i++)
                TextSpan(
                  text: widget.text[i],
                  style: TextStyle(
                    fontFamily: "Monaco",
                    fontSize: 20,
                    color: (i >= textController.text.length) ? Colors.white54 : (textController.text[i] != widget.text[i]) ? Colors.red : Colors.green.withAlpha(0),
                    height: 1.3,
                  ),
                ),
              ],

              style: const TextStyle(
                fontFamily: "Monaco",
                fontSize: 20,
                color: Colors.white,
                height: 1.3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
