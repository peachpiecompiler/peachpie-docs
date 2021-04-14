# Debugging the compiler & runtime

> The following article describes the development and debugging of the PeachPie platform itself. It contains the best practices when running PeachPie from the sources. It is intended for developers of PeachPie itself.

There are two approaches to debugging the platform internals, depending on whether you target a **small piece of code (A)** or an **entire application (B)**.

It is suggested to disable the *Just My Code* feature to debug through the runtime internals. See your debugger documentation on how to do that.

## Debug compilation & execution of a code snippet

**Requirements**: Visual Studio<br/>
**Project**: `/src/Tests/Peachpie.Test/Peachpie.Test.csproj`

Having just a small piece of code or a test case is the easiest way to debug the compiler and runtime. It is sufficient when debugging an isolated language construct, a test case, or a new library function.

In *Visual Studio* open the `Peachpie.sln` solution, make the project `Peachpie.Test` your *startup project*. Navigate to `index.php` within the project and alter its content with your PHP test case.

Optionally, you can put breakpoints inside the `index.php` file. It will break during the code snippet execution.

Start the project - by default it runs an in-memory compilation of the script allowing you to debug the compiler code. Then it runs the compiled code itself allowing you to debug the runtime and libraries as well.

## Debug an entire application

Here, we assume you created a project (`.msbuildproj`) and you need to debug its compilation or runtime. This section is intended for developers debugging the PeachPie platform for a specific [project](/php/msbuild).

### Prepare a development build of PeachPie

All the PeachPie libraries are distributed as Release builds. In some cases it is sufficient to debug those (e.g. to handle exceptions). In case you need to debug your own build of PeachPie (e.g. you're developing a feature or a fix in the PeachPie project sources), build the project from its sources.

#### In the PeachPie project folder:

Build `Peachpie.sln`:

```shell
dotnet build
```

Copy the build output to your local NuGet cache:

```shell
cd build
.\update-dependencies.ps1
```

After these steps, there are PeachPie packages with a versioned `1.0.0-dev` installed on your system.

#### In your PHP project folder:

Wherever it occurs in your project, change the version of the `PeachPie.***` references to **`1.0.0-dev`**. Alter your project file targeting the development build of PeachPie:

> *Example project file targeting development build of PeachPie:*
```xml
<Project Sdk="Peachpie.NET.Sdk/1.0.0-dev">
  <PropertyGroup>
    <OutputType>library</OutputType>
    <TargetFramework>netstandard2.0</TargetFramework>
  </PropertyGroup>
</Project>
```

Restore your project:

```shell
dotnet restore
```

### Debug the compilation of a project

In order to debug the compilation, you have to attach to the compilation process (msbuild running the Compile task). Use the MSBuild property **`DebuggerAttach`** to instruct the compiler to attach a debugger to itself.

Run the build with the property `DebuggerAttach` set to `true`:

```shell
dotnet build /p:DebuggerAttach=true
```

This causes the compiler process to call [`System.Diagnostics.Debugger.Launch()`](https://docs.microsoft.com/en-us/dotnet/api/system.diagnostics.debugger.launch?view=netframework-4.8) upon the start, allowing you to choose a debugger (Visual Studio) and step into the compilation process. If asked, choose the debugger engine .NET Core or accordingly.

### Debug Runtime and Libraries

Start you project from within the IDE in debug mode.

In *Visual Studio*, ensure you have disabled *Just My Code*.

In *VS Code*, alter your launch configuration to search for debug symbols in your PeachPie build directories:

> *`.vscode/launch.json`:*
```json
"justMyCode": false,
"symbolOptions": {
  "searchPaths":["C:\\peachpie\\src\\Peachpie.App\\bin\\Debug\netstandard2.0"]
}
```

The Core CLR debugger will allow you to step into the PeachPie sources then.
