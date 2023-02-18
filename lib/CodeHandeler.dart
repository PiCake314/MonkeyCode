import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/androidstudio.dart';

class InsertTabIntent extends Intent {
  const InsertTabIntent(this.numSpaces, this.textController);
  final int numSpaces;
  final TextEditingController textController;
}

class InsertTabAction extends Action {
  @override
  Object invoke(covariant Intent intent) {
    if (intent is InsertTabIntent) {
      final oldValue = intent.textController.value;
      final newComposing = TextRange.collapsed(oldValue.composing.start);
      final newSelection = TextSelection.collapsed(
          offset: oldValue.selection.start + intent.numSpaces);

      final newText = StringBuffer(oldValue.selection.isValid
          ? oldValue.selection.textBefore(oldValue.text)
          : oldValue.text);
      for (var i = 0; i < intent.numSpaces; i++) {
        newText.write(' ');
      }
      newText.write(oldValue.selection.isValid
          ? oldValue.selection.textAfter(oldValue.text)
          : '');
      intent.textController.value = intent.textController.value.copyWith(
        composing: newComposing,
        text: newText.toString(),
        selection: newSelection,
      );
    }
    return '';
  }
}

class CodeHandeler extends StatelessWidget {
  final String text;
  final int numLines;
  const CodeHandeler({super.key, required this.text, required this.numLines});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.topLeft,
          child: Text(
            text,
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
                  InsertTabIntent(4, textController)
            },
            child: TextField(
              // textAlign: TextAlign.center,
              decoration: const InputDecoration(border: InputBorder.none),
              style: const TextStyle(
                fontFamily: "Monaco",
                fontSize: 20,
                color: Colors.white,
                height: 1.3,
              ),
              controller: textController,
              minLines: numLines< 10 ? numLines : 10,
              maxLines: numLines,
            ),
          ),
        ),
      ],
    );
  }
}
