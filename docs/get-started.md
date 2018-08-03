# Get started

The purpose of this page is to get you started with PeachPie quickly. Following steps lets you to create a minimal project containing PHP files that compiles and runs on top of .NET Core. 

## Prerequisites

- .NET Core SDK 2.1 or newer: [microsoft.com/net/download](https://www.microsoft.com/net/download)

## Install dotnet templates

Open a command prompt and run the following command:

!!! example "install dotnet templates"
    ```bash
    dotnet new -i Peachpie.Templates::*
    ```

The `dotnet` command downloads latest project template to be used to create a new PeachPie projects for you.

## Create your app

Following steps create a new project in the current directory. They come with a simple *hello world* code.

### Console Application

The easiest way is to create a console application with a PHP code. Open command prompt and run the following commands:

!!! example "create and run console project"
    ```bash
    dotnet new console -lang PHP
    dotnet run
    ```

The first run takes a few seconds since it downloads all the dependencies for the first time and compiles the project.

### Web Application

Now let's create an ASP.NET Core application that runs PHP compiled web site. Open a command prompt in a new directory and run following commands:

!!! example "create and run web project"
    ```bash
    dotnet new web -lang PHP
    dotnet run -p Server
    ```

The `dotnet new` command creates a new project. Then it downloads all the necessary dependencies, the application compiles and runs a built-in web server on http://localhost:5004. You can access the page in the browser and see the result of `index.php`.

The newly created web application actually consists of two projects - `Server` and `Website`. The first one is a C# .NET Core app that initializes web server and passes requests to scripts in the second project. You can integrate this solution with a regular .NET Core MVC application with your additional configuration.

### Class Library

Third project type is a class library. Following command creates a project that builds `.dll` file out of your PHP files to be used as a library referenced by other projects - either C# projects or other PHP projects.

!!! example "create and build class library project"
    ```bash
    dotnet new classlib -lang PHP
    dotnet build
    ```

This kind of project can be used purely as a dependency to other projects. Containing classes and interfaces are exposed as regular .NET types. Containing script files and globals functions are also accessible, either by (PeachPie API)[api-reference] or seamlessly within another PHP project that references this library.

## Development Environment

Projects created by steps above can be opened by .NET development environments like `Visual Studio 2017` or newer or `Visual Studio Code`. There few additional steps that are necessary.

### Visual Studio Code

- Install [PeachPie for VS Code](https://marketplace.visualstudio.com/items?itemName=iolevel.peachpie-vscode) extension
- Open folder with your PHP project
- Start the project by pressing `F5` and let the VSCode to create initial `tasks.json` and `launch.json` files
- Edit `launch.json` to point to actual build result

The steps above adds support for PeachPie diagnostics and breakpoints in PHP code within a PHP project. Building and debugging of the application is handled by .NET runtime and debugger.

### Visual Studio

- Run `dotnet restore` within the project directory before opening the project in Visual Studio.
- Open the project, build, debug and edit as needed.

The `dotnet restore` command is necessary for Visual Studio 2017 since it downloads the PeachPie SDK for the first time and lets Visual Studio to 'understand' the project when opening.
