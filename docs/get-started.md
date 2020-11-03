# Get started

The purpose of this page is to get you started with [PeachPie](https://www.peachpie.io) quickly. The following steps let you to create a minimalistic project containing PHP files and then compile and run them on top of .NET Core. 

## Prerequisites

- .NET Core SDK 3.0 or newer: [microsoft.com/net/download](https://www.microsoft.com/net/download)

## Install dotnet templates

Open a command prompt and run the following command:

!!! example "install dotnet templates"
    ```bash
    dotnet new -i "Peachpie.Templates::*"
    ```

The `dotnet` command downloads the latest project template to be used to create new PeachPie projects for you.

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
    dotnet run -p Server
    ```

The `dotnet new` command creates a new project and downloads all the necessary dependencies. The application then compiles and runs a built-in web server on http://localhost:5004. You can access the page in the browser and see the result of `index.php`.

The newly created web application actually consists of two projects - `Server` and `Website`. The first one is a C# .NET Core app that initializes the web server and passes requests to scripts in the second project. You can integrate this solution with a regular .NET Core MVC application with your additional configuration.

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
- Install our [PeachPie Visual Studio Extension](https://marketplace.visualstudio.com/items?itemName=iolevel.peachpie-vs).
- Go to `File | New | Project`, locate the `PHP (PeachPie)` template group and create a new project.
- Hit ++f5++.

### Visual Studio Code

- Install [PeachPie for VS Code](https://marketplace.visualstudio.com/items?itemName=iolevel.peachpie-vscode) extension.
- Open the folder with your PHP project.
- Start the project by pressing ++f5++ and let VSCode create the initial `tasks.json` and `launch.json` files for .NET Core.
- Edit `launch.json` to point to the actual build result.

The steps above add support for PeachPie diagnostics and breakpoints in PHP code within a PHP project in VS Code. The building and debugging of the application is handled by the .NET runtime and debugger.
