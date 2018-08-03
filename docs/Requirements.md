PeachPie is compatible with .NET standard 2.0 or higher, .NET Framework 4.7.1, .NET Core 2.0+, Mono.

## Prerequisites

1. .NET Framework 4.7.1 (Windows)
2. .NET Core 2.0+ [(Windows, Mac OS, Linux)](https://www.microsoft.com/net/core)

## Optional: Web Server

PeachPie can be utilized by various web servers. Currently officially supported are:

1. ASP.NET Core, Kestrel, IIS Express
2. IIS 7 (integrated pipeline), Azure

> Among a web server, PeachPie targets also command line executables and Windows executables that run standalone.

## Optional: Visual Studio 2017

`.msbuildproj` files can be opened directly from the Visual Studio 2017 IDE. The standard functionality (`build`, `restore`, `clean`) depends on the [[msbuild]] build platform. Debugging and running the application is handled fully by the underlying .NET runtime.

## Optional: Visual Studio Code

- .NET Core
- [Visual Studio Code](https://code.visualstudio.com/)
- [C# Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.csharp)
- [Peachpie for VS Code Extension](https://marketplace.visualstudio.com/items?itemName=iolevel.peachpie-vscode)
