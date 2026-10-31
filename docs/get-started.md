# Get started

The purpose of this page is to get you started with [PeachPie](https://www.peachpie.io) quickly. The following steps let you to create a minimalistic project containing PHP files and then compile and run them on top of .NET.

## Prerequisites

- [.NET SDK](https://dotnet.microsoft.com/download) and the **.NET 6 runtime**.

PeachPie `1.1.13` is published as [`Peachpie.NET.Sdk` 1.1.13](https://www.nuget.org/packages/Peachpie.NET.Sdk/1.1.13). The compiler in that package runs on `Microsoft.NETCore.App` 6.0.0 (`Peachpie.CodeAnalysis.runtimeconfig.json` targets `net6.0`). The .NET 8 SDK does not include that runtime, so install the .NET 6 runtime next to it. A newer SDK prints `NETSDK1138` because `net6.0` is out of support.

The templates below target `net6.0`. A project can set `<TargetFramework>net8.0</TargetFramework>` when the .NET 6 runtime is installed; the compiler process still starts on .NET 6. `Peachpie.AspNetCore.Web` and `Peachpie.AspNetCore.Mvc` 1.1.13 also target `net6.0`.

## Install dotnet templates

Open a command prompt and run the following command:

!!! example "install dotnet templates"
    ```bash
    dotnet new install Peachpie.Templates::1.0.33
    ```

`Peachpie.Templates` 1.0.33 is the template package published with PeachPie 1.1.13. It generates `Sdk="Peachpie.NET.Sdk/1.1.13"` and `<TargetFramework>net6.0</TargetFramework>`.

## Create your app

The following steps create a new project in the current directory. They come with a simple *hello world* code.

### Console Application

The easiest way to start is to create a console application with PHP code. Open the command prompt and run the following commands:

!!! example "create and run console project"
    ```bash
    dotnet new console -lang PHP
    dotnet run
    ```

The first run takes a few seconds, since it will download all the dependencies for the first time and compile the project.

### Web Application

The second option is to create an ASP.NET Core application that runs a website with compiled PHP. Open the command prompt in a new directory and run the following commands:

!!! example "create and run web project"
    ```bash
    dotnet new web -lang PHP
    dotnet run --project Server
    ```

The `dotnet new` command creates a new project and downloads all the necessary dependencies. The application then compiles and runs a built-in web server on http://localhost:5004. You can access the page in the browser and see the result of `index.php`.

The newly created web application actually consists of two projects - `Server` and `Website`. The first one is a C# ASP.NET Core app that initializes the web server and passes requests to scripts in the second project. `Server` references `Peachpie.AspNetCore.Web` 1.1.13. You can integrate this solution with a regular ASP.NET Core MVC application with your additional configuration.

### Class Library

The third project type is a class library. The following command creates a project that builds a `.dll` file out of your PHP files to be used as a library that can be referenced by other projects - either C# or other PHP projects.

!!! example "create and build class library project"
    ```bash
    dotnet new classlib -lang PHP
    dotnet build
    ```

This kind of project can be used purely as a dependency to other projects. The contained classes and interfaces are exposed as regular .NET types. The included script files and global functions are also accessible, either by the [PeachPie API](api) or seamlessly within another PHP project that references this library.

## Development Environment

Projects can be created and opened by .NET development environments, such as `Visual Studio` or `Visual Studio Code`.

### Visual Studio
- The project file is an SDK-style MSBuild project, so Visual Studio can open it without an extension.
- The [PeachPie Visual Studio Extension](https://marketplace.visualstudio.com/items?itemName=iolevel.peachpie-vs) (`iolevel.peachpie-vs` 1.0.11, last updated 27 December 2021) adds project templates. Those templates are older than `Peachpie.Templates` 1.0.33. Create the project with `dotnet new` above when you need SDK 1.1.13.
- Hit ++f5++.

### Visual Studio Code

- Open an empty folder.
- Open Terminal and run the following command:
  ```shell
  dotnet new console -lang PHP
  ```
- Start the project by pressing ++f5++ and let VS Code create the initial `tasks.json` and `launch.json` files for .NET.
- Edit `launch.json` to point to the actual build result.
