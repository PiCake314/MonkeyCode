List<String> code = [
  // C
  "#include <stdio.h>\n\nint main() {\n    printf(\"Hello, World!\\n\");\n    return 0;\n}",

  // C++
  "#include <iostream>\n\nint main() {\n    std::cout << \"Hello, World!\" << std::endl;\n    return 0;\n}",

  // Python
  "print(\"Hello, World!\")",

  // JavaScript
  "console.log(\"Hello, World!\");",

  // Scala
  "object HelloWorld {\n    def main(args: Array[String]) = {\n        println(\"Hello, World!\")\n    }\n}",

  // Elixir
  "IO.puts \"Hello, World!\"",

  // C#
  "using System;\n\nclass Program {\n    static void Main() {\n        Console.WriteLine(\"Hello, World!\");\n    }\n}",

  // Java
  "class HelloWorld {\n    public static void main(String[] args) {\n        System.out.println(\"Hello, World!\");\n    }\n}",

  // Go
  "package main\n\nimport \"fmt\"\n\nfunc main() {\n    fmt.Println(\"Hello, World!\")\n}",

  // Dart
  "void main() {\n    print(\"Hello, World!\");\n}",

  // Swift
  "print(\"Hello, World!\")",

  // Kotlin
  "fun main() {\n    println(\"Hello, World!\")\n}",

  // PHP
  "<?php\n    echo \"Hello, World!\";\n?>",

  // R
  "cat(\"Hello, World!\")",

  // Ruby
  "puts \"Hello, World!\"",

  // Julia
  "println(\"Hello, World!\")",

  // Rust
  "fn main() {\n    println!(\"Hello, World!\");\n}",

  // Perl
  "print \"Hello, World!\\n\";"
];


int longestLine(String input) {
  return input.split('\n').reduce((a, b) => a.length > b.length ? a : b).length;
}
