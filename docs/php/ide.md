# Development Environments

The PeachPie project primarily focuses on the compiler, runtime and libraries. Developers must choose from the available .NET tools.

## CLI

The standard `dotnet` command and .NET tools are available. You can `build`, `run`, `publish`, profile, `pack`, etc. Please see [dotnet command](https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet) for details or our [get started](https://www.peachpie.io/getstarted) page.

## Visual Studio Code

**Features**: Code editor, Diagnostics, Debugging, Build

Additional support in VS Code is provided through the [PeachPie for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=iolevel.peachpie-vscode) extension.

## Microsoft Visual Studio

**Features**: Code editor, Diagnostics, Profiling, Debugging, Build

Visual Studio 2017 and newer (15.6 and later) supports opening the [project files](msbuild) and editing PHP files, so you don't actually need any extension to be able to work with PeachPie.

For additional features, project templates and more, install [PeachPie Visual Studio Extension](https://marketplace.visualstudio.com/items?itemName=iolevel.peachpie-vs).

## JetBrains Rider

Rider supports editing PHP files and opening project files. You'll be able to build the [project](msbuild); however, breakpoints and stepping through the code are not supported for custom languages yet as of December 2019.
