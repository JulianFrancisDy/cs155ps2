# cs155ps2

A lexical analyzer for EASY language using flex tool.

This was developed on Windows 10 Operating System.

To compile:

```bash
flex ps2.l
gcc lex.yy.c -o output
```

The command `flex ps2.l` compiles the flex file, generating a lex.yy.c file.

The command `gcc lex.yy.c -o ouput` compiles the lex file and generates an executable named output.


To run:

```bash
./output
```

This implementation also supports opening of files as input for the analyzer. Simply run using the command:

```bash
./output <filename>
```

Such as ```./output helloworld.easy```

Write or paste the EASY program on the terminal as input for the lexical analyzer.
