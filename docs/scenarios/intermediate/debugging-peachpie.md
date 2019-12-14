# Debugging Compiler & Runtime

> The following article describes the development and the debugging of the PeachPie platform itself. It contains the best practices when running PeachPie from sources. It is intended for developers of the PeachPie itself.

There are two approaches debugging the platform internals depending whether you target a **small piece of code (A)** or an **entire application (B)**.

It is suggested to disable *Just My Code* feature to debug through the runtime internals. See your debugger documentation on how to do that.

## (A) Debug compilation & execution of a code snippet

**Requirements**: Visual Studio<br/>
**Project**: `/src/Tests/Peachpie.Test/Peachpie.Test.csproj`

Having just a small piece of code or a test case is the easiest way of debug the compiler and runtime. It is sufficient when debugging an isolated language construct, a test case, or a new library function.

In *Visual Studio* open the `Peachpie.sln` solution, make the project `Peachpie.Test` as your *startup project*. Navigate to `index.php` within the project and alter its content with your PHP test case.

Optionally, you can put breakpoints inside the `index.php` file. It will break during the code snippet execution.

Start the project - by default it runs in-memory compilation of the script allowing you to debug the compiler code. Then it runs the compiled code itself allowing you to debug the runtime and libraries as well.

## (B) Debug an entire application

Assuming you have created a project (`.msbuildproj`) and you need to debug it's compilation or runtime. This section is intended for developers debugging PeachPie platform for a specific [project](/php/msbuild).

### Prepare development build of PeachPie

All the PeachPie libraries are distributed as Release builds. In some cases it is sufficient to debug those (i.e. to handle exceptions). In case you need to debug your own build of PeachPie (i.e. you're developing a feature or a fix in the PeachPie project sources), build the project from sources.

#### In PeachPie project folder:

Build `Peachpie.sln`:

```shell
dotnet build
```

Copy build output to your local NuGet cache:

```shell
cd build
.\update-dependencies.ps1
```

After these steps, there are PeachPie packages with versioned `1.0.0-dev` installed on your system.

#### In your PHP project folder:

Wherever in your project, change the version of `PeachPie.***` references to **`1.0.0-dev`**. Alter your project file targeting development build of PeachPie:

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

### Debug compilation of a project

In order to debug the compilation, you have to attach to the compilation process (msbuild running the Compile task). Use MSBuild property **`DebuggerAttach`** to instruct the compiler to attach a debugger to itself.

Run the build with the property `DebuggerAttach` set to `true`:

```shell
dotnet build /p:DebuggerAttach=true
```

This causes the compiler process to call [`System.Diagnostics.Debugger.Launch()`](https://docs.microsoft.com/en-us/dotnet/api/system.diagnostics.debugger.launch?view=netframework-4.8) upon start allowing you to choose a debugger (Visual Studio) and step into the compilation process. If asked, choose debugger engine .NET Core or accordingly.

### Debug Runtime and Libraries

Start you project from within IDE in debug mode.

In *Visual Studio*, ensure you have disabled *Just My Code*.

In *VS Code*, alter your launch configuration to search for debug symbols in your PeachPie build directories:

> *`.vscode/launch.json`:*
```json
"justMyCode": false,
"symbolOptions": {
  "searchPaths":["C:\\peachpie\\src\\Peachpie.App\\bin\\Debug\netstandard2.0"]
}
```

The Core CLR debugger will let you to step into the PeachPie sources then.
