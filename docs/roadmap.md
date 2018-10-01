# Roadmap

## Milestones

- [x] **0.8**: related work, open GitHub issues
- [x] **0.9**: all the PHP 5.4 - PHP 7.2 language features support, one serious big CMS working out of the box (WordPress), most of the commonly used PHP extensions implemented, compilation technical demo ([try.peachpie.io](https://try.peachpie.io))
- [x] **0.9.9**: pre-alpha. Signing assemblies, Phar support, more PHP extensions and core functions, migrate to latest Roslyn CodeAnalysis, MsBuild 15.0 Sdk `Peachpie.NET.Sdk`, opening in Visual Studio 2017/2019
- [ ] **1.0**: Visual Studio Code Extension, Visual Studio 2017 Extension, user friendly error messages, more documentation
- [ ] **1.1**: compile-time optimizations, runtime optimizations, `dynamic` support in C#, more C# interoperability features, Composer support

## General Tasks

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
- [x] Compile on multi-core CPU in parallel
- [ ] do not declare unreachable declarations

## .NET Both-Way Interoperability

- [x] Generating portable assemblies
- [x] Calling .NET objects from PHP
- [ ] .NET generics
- [x] Generate XML documentation
- [x] [MSBuild SDK (Peachpie.NET.Sdk)](php/msbuild)
- [x] [CLR/PHP Interoperability](net/type-system)
- [ ] DynamicMetaObjectProvider
- [x] Signing assemblies
- [ ] [Custom Attributes](https://github.com/peachpiecompiler/peachpie/issues/106)
- [x] Console Application
- [x] Web Application
- [x] Class Library

### Cross Platform Demos

- [x] .NETCore, Mono, .NET 4.5 compatibility
- [x] Sample Apps
- [x] Sample GitHub projects
- [ ] Mobile app sample

### Web Server Integration

- [x] ASP.NET Integrated Pipeline Request Handler
- [x] ASP.NET Core Middleware
