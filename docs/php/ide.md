# Development Environments

The PeachPie project primarily focuses on the compiler, runtime and libraries. Developers must choose from the available .NET tools.

## CLI

The standard `dotnet` command and .NET tools are available. You can `build`, `run`, `publish`, profile, `pack`, etc. Please see [dotnet command](https://learn.microsoft.com/dotnet/core/tools/dotnet) for details or our [get started](/get-started) page.

## Visual Studio Code

**Features**: Code editor, Diagnostics, Debugging, Build

Additional support in VS Code is provided through the [PeachPie for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=iolevel.peachpie-vscode) extension.

## Microsoft Visual Studio

**Features**: Code editor, Diagnostics, Profiling, Debugging, Build

Visual Studio opens the [project files](msbuild) and can edit the PHP files, so you don't actually need an extension to build PeachPie projects.

For additional templates, install [PeachPie Visual Studio Extension](https://marketplace.visualstudio.com/items?itemName=iolevel.peachpie-vs). That item is `1.0.11`, last updated 27 December 2021. The templates that match SDK 1.1.13 come from `dotnet new install Peachpie.Templates::1.0.33`, described in [get started](/get-started).

## JetBrains Rider

Rider supports editing PHP files and opening project files. You'll be able to build the [project](msbuild). Breakpoints and stepping through the code were not supported for custom languages as of December 2019; that was not rechecked for 1.1.13.
