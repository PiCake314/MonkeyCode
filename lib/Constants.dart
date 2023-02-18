int longestLine(String input) {
  return input.split('\n').reduce((a, b) => a.length > b.length ? a : b).length;
}

const List<Map<String, String>> HW = [
  {
    "language": "C",
    "script":
        "#include <stdio.h>\n\nint main() {\n    printf(\"Hello, World!\\n\");\n    return 0;\n}"
  },
  {
    "language": "C++",
    "script":
        "#include <iostream>\n\nint main() {\n    std::cout << \"Hello, World!\" << std::endl;\n    return 0;\n}"
  },
  {"language": "Python", "script": "print(\"Hello, World!\")"},
  {"language": "JavaScript", "script": "console.log(\"Hello, World!\");"},
  {
    "language": "Scala",
    "script":
        "object HelloWorld {\n    def main(args: Array[String]) = {\n        println(\"Hello, World!\")\n    }\n}"
  },
  {"language": "Elixir", "script": "IO.puts \"Hello, World!\""},
  {
    "language": "C#",
    "script":
        "using System;\n\nclass Program {\n    static void Main() {\n        Console.WriteLine(\"Hello, World!\");\n    }\n}"
  },
  {
    "language": "Java",
    "script":
        "class HelloWorld {\n    public static void main(String[] args) {\n        System.out.println(\"Hello, World!\");\n    }\n}"
  },
  {
    "language": "Go",
    "script":
        "package main\n\nimport \"fmt\"\n\nfunc main() {\n    fmt.Println(\"Hello, World!\")\n}"
  },
  {
    "language": "Dart",
    "script": "void main() {\n    print(\"Hello, World!\");\n}"
  },
  {"language": "Swift", "script": "print(\"Hello, World!\")"},
  {
    "language": "Kotlin",
    "script": "fun main() {\n    println(\"Hello, World!\")\n}"
  },
  {"language": "PHP", "script": "<?php\n    echo \"Hello, World!\";\n?>"},
  {"language": "R", "script": "cat(\"Hello, World!\")"},
  {"language": "Ruby", "script": "puts \"Hello, World!\""},
  {"language": "Julia", "script": "println(\"Hello, World!\")"},
  {
    "language": "Rust",
    "script": "fn main() {\n    println!(\"Hello, World!\");\n}"
  },
  {"language": "Perl", "script": "print \"Hello, World!\\n\";"},
  {"language": "Lua", "script": "print(\"Hello, World!\")"},
  {
    "language": "Brainfuck",
    "script": "+[-->-[>>+>-----<<]<--<---]>-.>>>+.>>..+++[.]\n"
  },
];

List<Map<String, String>> varDec = [
  {
    "language": "C",
    "script":
        "#include <stdio.h>\n\nint main() {\n    int x = 10;\n    int y = 20;\n    int sum = x + y;\n    printf(\"The sum of %d and %d is %d\\n\", x, y, sum);\n    return 0;\n}"
  },
  {
    "language": "C++",
    "script":
        "#include <iostream>\n\nint main() {\n    int x = 10;\n    int y = 20;\n    int sum = x + y;\n    std::cout << \"The sum of \" << x << \" and \" << y << \" is \" << sum << std::endl;\n    return 0;\n}"
  },
  {
    "language": "Python",
    "script":
        "x = 10\ny = 20\nsum = x + y\nprint(f\"The sum of {x} and {y} is {sum}\")"
  },
  {
    "language": "JavaScript",
    "script":
        "let x = 10;\nlet y = 20;\nlet sum = x + y;\nconsole.log(`The sum of \${x} and \${y} is \${sum}`);"
  },
  {
    "language": "Scala",
    "script":
        "object Main {\n    def main(args: Array[String]) = {\n        val x = 10\n        val y = 20\n        val sum = x + y\n        println(s\"The sum of \$x and \$y is \$sum\")\n    }\n}"
  },
  {
    "language": "Elixir",
    "script":
        "x = 10\ny = 20\nsum = x + y\nIO.puts \"The sum of #{x} and #{y} is #{sum}\""
  },
  {
    "language": "C#",
    "script":
        "using System;\n\nclass Program {\n    static void Main() {\n        int x = 10;\n        int y = 20;\n        int sum = x + y;\n        Console.WriteLine(\"The sum of {0} and {1} is {2}\", x, y, sum);\n    }\n}"
  },
  {
    "language": "Java",
    "script":
        "class Main {\n    public static void main(String[] args) {\n        int x = 10;\n        int y = 20;\n        int sum = x + y;\n        System.out.printf(\"The sum of %d and %d is %d\\n\", x, y, sum);\n    }\n}"
  },
  {
    "language": "Go",
    "script":
        "package main\n\nimport \"fmt\"\n\nfunc main() {\n    x := 10\n    y := 20\n    sum := x + y\n    fmt.Printf(\"The sum of %d and %d is %d\\n\", x, y, sum)\n}"
  },
  {
    "language": "Dart",
    "script":
        "void main() {\n    int x = 10;\n    int y = 20;\n    int sum = x + y;\n    print(\"The sum of \$x and \$y is \$sum\");\n}"
  },
  {
    "language": "Swift",
    "script":
        "var name: String = \"John\"\nvar age: Int = 30\nvar isStudent: Bool = true\nvar grades: [Int] = [90, 85, 95, 80]\nvar userInfo: [String: Any] = [\"name\": \"John\", \"age\": 30, \"isStudent\": true, \"grades\": [90, 85, 95, 80]]"
  },
  {
    "language": "Kotlin",
    "script":
        "var name: String = \"John\"\nvar age: Int = 30\nvar isStudent: Boolean = true\nvar grades: Array<Int> = arrayOf(90, 85, 95, 80)\nvar userInfo: Map<String, Any> = mapOf(\"name\" to \"John\", \"age\" to 30, \"isStudent\" to true, \"grades\" to arrayOf(90, 85, 95, 80))"
  },
  {
    "language": "PHP",
    "script":
        "<?php\n\$name = \"John\";\n\$age = 30;\n\$isStudent = true;\n\$grades = array(90, 85, 95, 80);\n\$userInfo = array(\"name\" => \"John\", \"age\" => 30, \"isStudent\" => true, \"grades\" => array(90, 85, 95, 80));\n?>"
  },
  {
    "language": "R",
    "script":
        "name <- \"John\"\nage <- 30\nis_student <- TRUE\ngrades <- c(90, 85, 95, 80)\nuserInfo <- list(name = \"John\", age = 30, isStudent = TRUE, grades = c(90, 85, 95, 80))"
  },
  {
    "language": "Ruby",
    "script":
        "name = \"John\"\nage = 30\nis_student = true\ngrades = [90, 85, 95, 80]\nuserInfo = {\"name\" => \"John\", \"age\" => 30, \"isStudent\" => true, \"grades\" => [90, 85, 95, 80]}"
  },
  {
    "language": "Julia",
    "script":
        "name = \"John\"\nage = 30\nis_student = true\ngrades = [90, 85, 95, 80]\nuserInfo = Dict(\"name\" => \"John\", \"age\" => 30, \"isStudent\" => true, \"grades\" => [90, 85, 95, 80])"
  },
  {
    "language": "Rust",
    "script":
        "let name: &str = \"John\";\nlet age: i32 = 30;\nlet is_student: bool = true;\nlet grades: Vec<i32> = vec![90, 85, 95, 80];\nlet user_info: HashMap<&str, &str> = [(\"name\", \"John\"), (\"age\", \"30\"), (\"isStudent\", \"true\"), (\"grades\", \"[90, 85, 95, 80]\")].iter().cloned().collect();"
  },
  {
    "language": "Perl",
    "script":
        "\$str = \"Hello, World!\";\n\$num = 42;\n@arr = (1, 2, 3);\n%hash = ('a' => 1, 'b' => 2);\nprint \"String: \$str\\nNumber: \$num\\nArray: @arr\\nHash: \$hash{a}, \$hash{b}\\n\";"
  }
];

List<Map<String, String>> loops = [
  {
    "language": "C",
    "script":
        "#include <stdio.h>\n\nint main() {\n    int i;\n    for (i = 1; i <= 10; i++) {\n        printf(\"%d \", i);\n    }\n    return 0;\n}"
  },
  {
    "language": "C++",
    "script":
        "#include <iostream>\n\nint main() {\n    for (int i = 1; i <= 10; i++) {\n        std::cout << i << \" \";\n    }\n    return 0;\n}"
  },
  {
    "language": "Python",
    "script": "for i in range(1, 11):\n    print(i, end=\" \")"
  },
  {
    "language": "JavaScript",
    "script": "for (let i = 1; i <= 10; i++) {\n    console.log(i + ' ');\n}"
  },
  {
    "language": "Scala",
    "script": "for (i <- 1 to 10) {\n    print(i + \" \")\n}"
  },
  {"language": "Elixir", "script": "1..10 |> Enum.each(&IO.puts(&1))"},
  {
    "language": "C#",
    "script":
        "using System;\n\nclass Program {\n    static void Main() {\n        for (int i = 1; i <= 10; i++) {\n            Console.Write(i + \" \");\n        }\n    }\n}"
  },
  {
    "language": "Java",
    "script":
        "class Main {\n    public static void main(String[] args) {\n        for (int i = 1; i <= 10; i++) {\n            System.out.print(i + \" \");\n        }\n    }\n}"
  },
  {
    "language": "Go",
    "script":
        "package main\n\nimport \"fmt\"\n\nfunc main() {\n    for i := 1; i <= 10; i++ {\n        fmt.Print(i, \" \")\n    }\n}"
  },
  {
    "language": "Dart",
    "script":
        "void main() {\n    for (var i = 1; i <= 10; i++) {\n        print('\$i ');\n    }\n}"
  },
  {
    "language": "Swift",
    "script": "for i in 1...10 {\n    print(i, terminator: \" \")\n}"
  },
  {
    "language": "Kotlin",
    "script":
        "fun main() {\n    for (i in 1..10) {\n        print(\"\$i \")\n    }\n}"
  },
  {
    "language": "PHP",
    "script":
        "<?php\n    for (\$i = 1; \$i <= 10; \$i++) {\n        echo \$i . \" \";\n    }\n?>"
  },
  {
    "language": "R",
    "script": "for (i in 1:10) {\n    cat(i, \" \", sep = \"\")\n}"
  },
  {"language": "Ruby", "script": "for i in 1..10 do\n    print i, \" \"\nend"},

  {
    "language": "Julia",
    "script": "for i in 1:5\n    println(\"Hello, World! \$i\")\nend"
  },
  {
    "language": "Rust",
    "script": "fn main() {\n    for i in 1..=5 {\n        println!(\"Hello, World! {}\", i);\n    }\n}"
  },
  {
    "language": "Perl",
    "script": "\$i = 1;\nwhile (\$i <= 5) {\n    print \"Hello, World! \$i\\n\";\n    \$i++;\n}"
  },
  {
    "language": "Lua",
    "script": "for i = 1, 5 do\n    print(\"Hello, World! \", i, \"\\n\")\nend"
  },
];
