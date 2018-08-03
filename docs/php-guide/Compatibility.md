The following page shows current status of the project features.

## Compiler & Runtime

|Feature|Status|Wiki|Issues|
|---|:---:|---|:---:|
|PHP Syntax|![Supported](http://i.imgur.com/MGixOna.png)|[[Syntax]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=syntax)|
|PE Compilation|![In progress](http://i.imgur.com/MGixOna.png)|[[Compiler Architecture]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=compilation)|
|Debugger|![Supported](http://i.imgur.com/MGixOna.png)|[[Debugging]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=debug)|
|Reflection|![Supported](http://i.imgur.com/MGixOna.png)|[[Reflection]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=Reflection)|
|PHP Classes|![Supported](http://i.imgur.com/MGixOna.png)|[[Peachpie Architecture]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=class)|
|PHP Interface|![Supported](http://i.imgur.com/MGixOna.png)|[[PHP Interface]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=interface)|
|PHP native types|![Supported](http://i.imgur.com/MGixOna.png)|[[CLR/PHP Interoperability Overview]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=native%20types)|
|PHP argument unpacking|![Supported](http://i.imgur.com/MGixOna.png)|[[PHP argument unpacking]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=argument%20unpacking)|
|PHP magic methods|![Supported](http://i.imgur.com/MGixOna.png)|[[PHP Magic Methods]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=magic%20methods)|
|PHP functions|![Supported](http://i.imgur.com/MGixOna.png)|[[PHP functions]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=functions)|
|PHP operators|![Supported](http://i.imgur.com/MGixOna.png)|[[PHP operators]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=operators)|
|.NET Libraries|![Supported](http://i.imgur.com/MGixOna.png)|[[.NET Libraries]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=dotnet%20libraries)|
|PHP type hints|![Supported](http://i.imgur.com/MGixOna.png)|[[PHP type hints]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=type%20hints)|
|PHP include|![Supported](http://i.imgur.com/MGixOna.png)|[[PHP include]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=include)|
|PHP conversions|![Supported](http://i.imgur.com/MGixOna.png)|[[PHP conversions]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=conversions)|
|PHP aliasing (references)|![Supported](http://i.imgur.com/9JMb4ps.png)|[[PHP aliasing]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=aliasing%20references)|
|PHP errors|![Miss-behaves](http://i.imgur.com/9JMb4ps.png)|[[Error Handling]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=errorhandling)|
|eval()|![Supported](http://i.imgur.com/MGixOna.png)|[[eval()]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=eval)|
|Variables|![Supported](http://i.imgur.com/MGixOna.png)|[[Variables]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=variables)|
|PHPDoc|![Supported](http://i.imgur.com/MGixOna.png)|[[PHPDoc]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=PHPdoc)|
|Anonymous Classes|![Supported](http://i.imgur.com/MGixOna.png)|[[Anonymous Classes]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=anonymous%20classes)|
|Closures|![Supported](http://i.imgur.com/MGixOna.png)|[[Closures]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=closures)|
|PHP Traits|![Supported](http://i.imgur.com/MGixOna.png)|[[PHP Traits]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=trait)|
|PHP language control structures|![Supported](http://i.imgur.com/MGixOna.png)|[[PHP language control structures]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=language%20control%20structures)|
|Indirect function call|![Supported](http://i.imgur.com/MGixOna.png)|[[Indirect funtion call]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=indirect%20function%20call)|
|PHP arrays|![Supported](http://i.imgur.com/MGixOna.png)|[[PHP arrays]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=arrays)|
|PHP constants|![Supported](http://i.imgur.com/MGixOna.png)|[[PHP constants]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=constants)|
|PHP Autoload|![Supported](http://i.imgur.com/MGixOna.png)|[[Type Declaration]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=autoload)|
|Late Static Binding|![Supported](http://i.imgur.com/MGixOna.png)|[[Late Static Binding]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?q=late%20static%20binding)|
|PHP Generators|![Supported](http://i.imgur.com/MGixOna.png)|[[PHP Generators]]|[Link](https://github.com/peachpiecompiler/peachpie/issues?&q=yield%20is:open)|

## Feature Status

- [x] PHP 5.4, 5.5, 5.6 Syntax
- [x] PHP 7.0, 7.1, 7.2 Syntax
- [x] Control Flow Graph & Code analysis
- [x] Compiler on top of Roslyn, semantics
- [x] Referencing .NET assemblies
- [x] Referencing script libraries
- [x] Code generation
  * [x] Routine declaration
  * [x] Types declaration
  * [x] Statements compiler
  * [x] Method overrides, Ghost stubs
  * [ ] Destructors
- [x] Expressions (missing few operators and expressions)
- [x] Type Hierarchy and Conversions
- [x] Value copying
- [x] Value aliasing
- [x] Array access for strings
- [x] Indirect variable access
- [x] Indirect function call
- [x] Indirect class access
- [x] Variable arguments (params)
- [x] Inclusions (include, require, once)
- [x] Autoload (__autoload, spl)
- [x] Late static binding
- [x] varargs ("...")
- [x] unpacking ("...")
- [x] Anonymous classes
- [x] Traits
- [x] Closures
  * [x] C# Lambda functions
- [x] Eval
- [x] PHP Generators
- [x] PHP Stack Trace
- [x] Console Application
- [x] Web Application
- [x] Class Library
- [ ] PHAR support

## Implemented PHP Extensions

- [x] Math
- [x] Output Buffering
- [x] Variables
- [x] Strings
- [x] Arrays
- [x] Streams
- [x] Mail
- [x] Hash
- [x] File System
- [x] FileInfo
- [ ] ftp
- [ ] intl
- [x] Serialization
- [ ] Sockets
- [x] PDO
- [x] mssql
- [x] MySql
- [x] MySqli (most of the functionality)
- [x] GD2
- [x] cURL
- [x] XML
- [x] Dom
- [x] Misc
- [x] PCRE
  * [x] PCRE syntax parser
  * [x] Modification of .NET Regex
- [ ] pthreads
- [x] Sessions
- [ ] Soap
- [x] SPL
- [x] Reflection
- [x] zlib
- [ ] Zip