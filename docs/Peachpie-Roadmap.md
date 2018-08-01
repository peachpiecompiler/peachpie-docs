- [x] **0.8.0**: related work, open GitHub issues
- [x] **0.9.0**: all the PHP 5.4 - PHP 7.2 language features support, one serious big CMS working out of the box (WordPress), most of the commonly used PHP extensions implemented, compilation technical demo ([try.peachpie.io](https://try.peachpie.io))
- [ ] **0.9.3**: more PHP frameworks working, signing assemblies, PHAR support, more PHP extensions and core functions
- [ ] **0.9.6**: compile-time optimizations, initial runtime optimizations, `dynamic` support in C#, more C# interoperability features, Composer support
- [ ] **0.9.9**: interpreted mode, producing clean IL
- [ ] **1.0.0-alpha**: TBD

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

### Test Environments

- [x] Travis CI
- [x] MyGet CI
- [x] Unit tests
- [x] Comparison to PHP runtime tests

### Public API Status

- [x] Variables
- [x] Context
  * [x] Include
  * [x] Call function
  * [x] Class instantiation
  * [x] Global variables
  * [x] Reflection
  * [x] Dynamic compilation
- [x] Peachpie NuGet packages
- [x] Error handling

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

## Optimization Tasks

- [x] .NET performance diagnostics
- [x] Unreachable code elimination
- [x] Unnecessary branching elimination
- [ ] Compile Regex tree in PHP code compile time
- [x] Array literals one time construction
- [x] Compile-time expression evaluation
- [ ] Lowering/simplifying expressions
- [ ] Avoiding unnecessary value copying
- [ ] Typed array optimizations
- [ ] Compile on multi-core CPU in parallel
- [ ] do not declare unreachable declarations

## .NET Both-Way Interoperability

- [x] Generating portable assemblies
- [x] Calling .NET objects from PHP
- [ ] .NET generics
- [x] Generate XML documentation
- [x] MSBuild SDK (Peachpie.NET.Sdk)
- [x] [[CLR/PHP Interoperability Overview]]
- [ ] DynamicMetaObjectProvider
- [x] Signing assemblies
- [ ] [Custom Attributes](https://github.com/peachpiecompiler/peachpie/issues/106)

### Cross Platform Demos

- [x] .NETCore, Mono, .NET 4.5 compatibility
- [x] Sample Apps
- [x] Sample GitHub projects
- [ ] Mobile app sample

### Web Server Integration

- [x] ASP.NET Integrated Pipeline Request Handler
- [x] ASP.NET Core Middleware