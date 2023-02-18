

const List<Map<String, String>> code = [
  {
    "language": "C",
    "script": "#include <stdio.h>\n\nint main() {\n    printf(\"Hello, World!\\n\");\n    return 0;\n}"
  },
  {
    "language": "C++",
    "script": "#include <iostream>\n\nint main() {\n    std::cout << \"Hello, World!\" << std::endl;\n    return 0;\n}"
  },
  {
    "language": "Python",
    "script": "print(\"Hello, World!\")"
  },
  {
    "language": "JavaScript",
    "script": "console.log(\"Hello, World!\");"
  },
  {
    "language": "Scala",
    "script": "object HelloWorld {\n    def main(args: Array[String]) = {\n        println(\"Hello, World!\")\n    }\n}"
  },
  {
    "language": "Elixir",
    "script": "IO.puts \"Hello, World!\""
  },
  {
    "language": "C#",
    "script": "using System;\n\nclass Program {\n    static void Main() {\n        Console.WriteLine(\"Hello, World!\");\n    }\n}"
  },
  {
    "language": "Java",
    "script": "class HelloWorld {\n    public static void main(String[] args) {\n        System.out.println(\"Hello, World!\");\n    }\n}"
  },
  {
    "language": "Go",
    "script": "package main\n\nimport \"fmt\"\n\nfunc main() {\n    fmt.Println(\"Hello, World!\")\n}"
  },
  {
    "language": "Dart",
    "script": "void main() {\n    print(\"Hello, World!\");\n}"
  },
  {
    "language": "Swift",
    "script": "print(\"Hello, World!\")"
  },
  {
    "language": "Kotlin",
    "script": "fun main() {\n    println(\"Hello, World!\")\n}"
  },
  {
    "language": "PHP",
    "script": "<?php\n    echo \"Hello, World!\";\n?>"
  },
  {
    "language": "R",
    "script": "cat(\"Hello, World!\")"
  },
  {
    "language": "Ruby",
    "script": "puts \"Hello, World!\""
  },
  {
    "language": "Julia",
    "script": "println(\"Hello, World!\")"
  },
  {
    "language": "Rust",
    "script": "fn main() {\n    println!(\"Hello, World!\");\n}"
  },
  {
    "language": "Perl",
    "script": "print \"Hello, World!\\n\";"
  },
  {
    "language": "Lua",
    "script": "print(\"Hello, World!\")"
  },
  {
    "language": "Brainfuck",
    "script": "+[-->-[>>+>-----<<]<--<---]>-.>>>+.>>..+++[.]\n"
  },
];



// const List<Map<String, String>> code = [
//   {"#include <stdio.h>\n\nint main() {\n    printf(\"Hello, World!\\n\");\n    return 0;\n}": "C"},

//   {"#include <iostream>\n\nint main() {\n    std::cout << \"Hello, World!\" << std::endl;\n    return 0;\n}": "C++"},

//   {"print(\"Hello, World!\")": "Python"},

//   {"console.log(\"Hello, World!\");": "JavaScript"},

//   {"object HelloWorld {\n    def main(args: Array[String]) = {\n        println(\"Hello, World!\")\n    }\n}": "Scala"},

//   {"IO.puts \"Hello, World!\"": "Elixir"},

//   {"using System;\n\nclass Program {\n    static void Main() {\n        Console.WriteLine(\"Hello, World!\");\n    }\n}": "C#"},

//   {"class HelloWorld {\n    public static void main(String[] args) {\n        System.out.println(\"Hello, World!\");\n    }\n}": "Java"},

//   {"package main\n\nimport \"fmt\"\n\nfunc main() {\n    fmt.Println(\"Hello, World!\")\n}": "Go"},

//   {"void main() {\n    print(\"Hello, World!\");\n}": "Dart"},

//   {"print(\"Hello, World!\")": "Swift"},

//   {"fun main() {\n    println(\"Hello, World!\")\n}": "Kotlin"},

//   {"<?php\n    echo \"Hello, World!\";\n?>": "PHP"},

//   {"cat(\"Hello, World!\")": "R"},

//   {"puts \"Hello, World!\"": "Ruby"},

//   {"println(\"Hello, World!\")": "Julia"},

//   {"fn main() {\n    println!(\"Hello, World!\");\n}": "Rust"},

//   {"print \"Hello, World!\\n\";": "Perl"},

// ];


int longestLine(String input) {
  return input.split('\n').reduce((a, b) => a.length > b.length ? a : b).length;
}
