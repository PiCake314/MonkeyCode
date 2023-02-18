import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

TextEditingController textController = TextEditingController();

class CodeHandeler extends StatelessWidget {
  final String text;
  final int numLines;
  final onTap;
  final onMistake;
  const CodeHandeler({
    super.key,
    required this.text,
    required this.numLines,
    required this.onTap,
    required this.onMistake,
  });

  @override
  Widget build(BuildContext context) {
    int prevLength = 0;

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
              style: TextStyle(
                fontFamily: "Monaco",
                fontSize: 20,
                color: Colors.white,
                height: numLines == 1 ? 1 : 1.3,
              ),

              onChanged: (value) {
                // debugPrint(value);
                if (value.length == 1) {
                  onTap();
                }

                if (value.length - 1 > 0 &&
                    value[value.length - 1] != text[value.length - 1] &&
                    value.length > prevLength) {
                  onMistake();
                }

                prevLength = value.length;
              },
              controller: textController,
              minLines: numLines,
              maxLines: numLines,
              autofocus: true,
              autocorrect: false,
              enableSuggestions: false,
              enableInteractiveSelection: false,
              cursorColor: Colors.purple,
            ),
          ),
        ),
      ],
    );
  }
}
