MSBuild support allows to integrate Peachpie projects with build servers, Visual Studio, Visual Studio Code, Xamarin Studio and other industry standard development tools. The core functionality defines how the source files are compiled into a DLL using the cross-platform open-source `msbuild.exe` 15.0 or newer.

Read the blog post about the msbuild introduction on [[http://www.peachpie.io/2017/04/msbuild-netcoreapp1-1.html]].

## Sample Project File

```xml
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>exe</OutputType>
    <TargetFramework>netcoreapp2.0</TargetFramework>
  </PropertyGroup>
 
  <ItemGroup>
    <Compile Include="**/*.php" />
  </ItemGroup>
 
  <ItemGroup>
    <DotNetCliToolReference Include="Peachpie.Compiler.Tools" Version="0.9.0-*" />
    <PackageReference Include="Peachpie.NET.Sdk" Version="0.9.0-*" PrivateAssets="Build" />
  </ItemGroup>
</Project>
```

The sample project file above should be saved as `project.msbuildproj`. It can be opened in Visual Studio 2017, Visual Studio Code, other IDEs or used from your favorite shell to build or run the project.

1. `dotnet build`

In case you are going to open the project in Visual Studio 2017, do not forget to run the `restore` task before opening: `dotnet restore`

## Imports

The support for compiling PHP files is added through targets defined in the referenced package `Peachpie.NET.Sdk`. The package contains the necessary targets defining the `CoreCompile` task invoking the compiler distributed in and automatically downloaded from the `Peachpie.Compiler.Tools` package. The SDK also propagates the dependencies to Peachpie Runtime packages seamlessly.

The necessary packages are downloaded by restoring the project dependencies.

`dotnet restore` or `msbuild /t:restore project.msbuildproj`

## Supported frameworks

The `TargetFramework` property can target any framework compatible Peachpie-supported frameworks - `netstandard2.0`, `net46` and higher (`netcoreapp2.0`, `netcoreapp2.1`, `netstandard2.0` etc.).

## Properties

### `LangVersion`

The `LangVersion` property specifies the version of PHP semantic. This allows to treat built-in types with respect to PHP version or to allow language constructs (like `&new`) that has been removed from latest versions of PHP already.

```xml
<LangVersion>5.4</LangVersion>
```

The options are `5.4`, `5.5`, `5.6`, `7.0`, `7.1`, `7.2` etc.

Mainly this option has effect to built-in types used in type hints, following code has a different semantic using different values of `LangVersion`:
```php
function foo(int $i, object $o, callable $c){} // $i is either long or class 'int', etc.
```

### `ShortOpenTag`

> Available since `0.7.0-CI00200`

Short open tag syntax (`<?`) is disabled by default. To enable it set `ShortOpenTag` property to `true`.

```xml
<ShortOpenTag>true</ShortOpenTag>
```

### `NoWarn`

> Available since `0.9.0-CI00743`

Disables specific warning messages. The warnings are identified by their ID (e.g. `PHP3006`) and can be separated by comma or space.

```xml
<NoWarn>PHP3006,PHPX0125</NoWarn>
```
The sample above disables reporting of call of an undefined function and declaring a mandatory parameter behind optional parameter.

### `GenerateDocumentation`

Enables or disables creation of `.xml` file with `XMLDoc` generated from source files `PHPDoc`.

```xml
<GenerateDocumentation>true</GenerateDocumentation>
```

### `PhpDocTypes`

> Available since `0.7.0-CI00299`

Allows to strongly type PHP properties, functions or function parameters using regular PHP Doc comment. This is useful for keeping backward compatibility with PHP 5 and to strongly type PHP properties.

Possible values are `None`, `FieldTypes`, `ParameterTypes`, `ReturnTypes` or `All` or their combination using vertical bar `|`. In case there is a PHP type hint, the PHPDoc type is ignored.

```xml
<PhpDocTypes>FieldTypes</PhpDocTypes>
```

Default is `None`.

> Be careful when enabling this option. Typed values cannot hold a reference.

## Multitargeting

Specifying `TargetFrameworks` property is supported. The construct allows to set more than one target framework for the project to be built.

```xml
<TargetFrameworks>netcoreapp2.0;net46</TargetFrameworks>
```