The compiler processes source codes in the standard PHP syntax. By default, it is compliant with the latest language specification.

## Language Syntax Version

The source language specification (e.g. PHP 5.4, PHP 7, PHP 7.1, etc.) can be changed using compilation parameters, depending on how the compilation is invoked.

- Use `LangVersion` property when using [[msbuild]] project file
- Use `/langversion` option when using [[peach.exe]] command line tool

## Internals

The compiler parses the source code into an abstract syntax tree (AST), which represents an abstraction over various PHP language specifications. The source code parser is a standalone component that can be customized, parametrized or even changed. This may be useful if you would like to implement a capability of parsing for example `Hack` or any other language instead of the standard PHP.
Once the code is parsed into the AST, the compiler lowers it into a data structure called `semantic tree`, which respects interfaces from the Roslyn CodeAnalysis library.