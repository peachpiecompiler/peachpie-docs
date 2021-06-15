# Referencing a PHP project

This article demonstrates a PHP code provided as a library available as a dependency to other .NET projects (i.e. C# or another PHP).

This allows to provide a library written in PHP code to C# projects, to decouple large PHP code bases, or to provide a NuGet package with a PHP library or a whole website.

### Prerequisites:

- .NET Core SDK 3.0 or newer ([dotnet.microsoft.com](https://dotnet.microsoft.com/download))
- Optionally, Visual Studio 2017 or newer

**Content:**

This tutorial goes roughly through the following steps.

1. Creating a PHP library project
2. Adding dependency from a C# project
3. Adding dependency from a PHP project

## Create a PHP library project

First create a project file. It is an XML file with extension `.msbuildproj`, describing the library and the build process. 

> *`library.msbuildproj`:*

```xml
<Project Sdk="Peachpie.NET.Sdk/1.0.6">
  <PropertyGroup>
    <OutputType>library</OutputType>
    <TargetFramework>netstandard2.1</TargetFramework>
    <GeneratePackageOnBuild>true</GeneratePackageOnBuild>
    <GenerateDocumentationFile>true</GenerateDocumentationFile>
  </PropertyGroup>

  <ItemGroup>
    <Compile Include="**/*.php" />
  </ItemGroup>

</Project>
```

The project file above is used by .NET Core SDK to build the project. It treats all the `*.php` files as source files, generates a documentation file from containing PHPDoc comments, creates a NuGet package and a resulting `library.dll` file.

### Add some code

Let's add some code, create a PHP file next to the project file. The following code defines class `Class1` with a single instance function `encode`. The function accepts value of any type (`mixed` type) and returns always a `string`.

> *`class1.php`:*

```php
<?php

namespace Library;

/** This is a sample class. */
class Class1 {

  /**
   * Our sample encoding function.
   * @param string $value String to be encoded.
   */
  function encode($value): string {
      return json_encode($value);
  }
}
```

### Build the library

The library is created. It provides a public class with a sample function that can be used by other PHP or C# projects.

On command line, build the project using `dotnet build` command:

```shell
dotnet build
```

> *Expected command result:*

```shell
Microsoft (R) Build Engine version 16.4.0 for .NET Core
Copyright (C) Microsoft Corporation. All rights reserved.        

  Restore completed in 26,77 ms for library.msbuildproj.
  PeachPie PHP Compiler
  library -> \bin\Debug\netstandard2.0\library.dll
  Successfully created package '\bin\Debug\library.1.0.0.nupkg'.

Build succeeded.

    0 Warning(s)
    0 Error(s)

Time Elapsed 00:00:02.45
```

In case of an error in the source code, it will be reported during the build. In case the error is fatal, i.e. a code that would always cause runtime error, the build process fails.

The build outputs `library.dll` file with the compiled code, `library.xml` with the compiled documentation, eventually `library.pdb` containing information for debugger and `library.1.0.0.nupkg` containing the whole library packed in a standard NuGet file.

## Adding dependency in Visual Studio

The library project can be directly opened in Visual Studio. Either open an existing solution and add the project into it (`File -> Add -> Existing Project`), or open the project into a new solution (`Ctrl+Shift+O`).

![Solution Explorer with Library project](/img/vs-solution-library.png)

In order to use `Class1` in the other project, add dependency. Right click onto `Dependencies` node within `ConsoleApp1`, and choose `Add reference`.

![Add dependency menu](/img/vs-add-dependency-menu.png)

Choose the `library` project as a dependency and comfirm.

![Choose project reference](/img/vs-choose-reference.png)

Now you can build the solution.

## Adding dependency manually

The dependency can be added without Visual Studio either. Assuming you have another .NET project e.g. `ConsoleApp1` and its project file `ConsoleApp1.csproj`. In order to add dependency to the library, add following into the project file:

```xml
  <ItemGroup>
    <ProjectReference Include="..\library\library.msbuildproj" />
  </ItemGroup>
```

Or; you can do the same on command line. See [docs.microsoft.com/dotnet/core/tools/dotnet-add-reference](https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-add-reference) for more details.

```shell
dotnet add reference ../library/library.msbuildproj
```

## C# app using the PHP library

Once the library is referenced, either as a `ProjectReference` or a `PackgeReference`, its public classes and methods become available to the C# app's code.

```c#
static void Main(string[] args)
{
    // instantiate PHP class
    var class1 = new Library.Class1();
    // call PHP method with an argument
    string encoded = class1.encode("Hello World!");
    // output the result
    Console.WriteLine(encoded);
}
```

There are certain conversion conventions between PHP values and C# types. Please see [type system](/net/type-system) and [PhpValue](/api/ref/phpvalue) for more details on how the values are implicitly converted.

PHP objects and functions are liable to the instance of [Context](/net/ref/context) class. If ommited (like in this example) a default instance is provided implicitly. In case of a multithreaded evironment and web applications, make sure you provide an instance of `Context` corresponding to your current thread.

## PHP app using the PHP library

In case the library project is referenced by another PHP project (another library or executable), the library become a seamless part of the project. In order to use the class, the containing script file has to be **included** first.

```php
<?php

require_once './class1.php';

$c = new Library\Class1;
echo $c->encode('Hello World!');

```

## Library subfolder

In most cases, the library script files have to appear in a subfolder when referenced by an application. For example:

- WordPress plugins should be placed wihtin `wp-content/plugins/<pluginnanme>`.
- Composer packages usually in `vendor/<vendorname>/<packagename>`.

Also custom library should be placed within a unique subfolder to avoid conflicts with other script file paths. To do so, add following property into the project file `library.msbuildproj`:

```xml
<PropertyGroup>
  <PhpRelativePath>vendor/example/library</PhpRelativePath>
</PropertyGroup>
```

More at [project file's PhpRelativePath](../php/msbuild/#phprelativepath).

After that, the script file `class1.php` can be included at

```php
<?php
require_once './vendor/example/library/class1.php';
```

## See also

- [Creating a NuGet from a PHP project](create-nuget)
- [What is NuGet](https://docs.microsoft.com/en-us/nuget/what-is-nuget) *(docs.microsoft.com)*
- [Signing NuGet Packages](https://docs.microsoft.com/en-us/nuget/create-packages/sign-a-package) *(docs.microsoft.com)*
- [Project File Reference](../php/msbuild)
