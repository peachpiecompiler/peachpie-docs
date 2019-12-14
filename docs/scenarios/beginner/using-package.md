# Use PHP project as reference in C\#

Please see [What is NuGet](https://docs.microsoft.com/en-us/nuget/what-is-nuget) for the introductionary about the .NET's packaging system.

This article goes further the [creating a NuGet from a PHP project](create-nuget) and describes how to use NuGet packages and PHP libraries seamlessly in C# with respect to compiled PHP code specifics.

## Sample `library.nupkg`

The following example demonstrates a PHP library. It contains a single source file declaring a class `Class1` within a namespace `Library`. The class has a single instance method `encode` taking a single argument of any type (`mixed` in PHP), returning value of type `string`.

> *`library.msbuildproj`:*
```xml
<Project Sdk="Peachpie.NET.Sdk">
  <PropertyGroup>
    <OutputType>library</OutputType>
    <TargetFramework>netstandard2.0</TargetFramework>
    <GeneratePackageOnBuild>true</GeneratePackageOnBuild>
  </PropertyGroup>

  <ItemGroup>
    <Compile Include="**/*.php" />
  </ItemGroup>

</Project>
```

> *`class1.php`:*
```php
<?php

namespace Library;

class Class1 {
  // a sample function that encodes given value into a json string:
  function encode($value): string {
      return json_encode($value);
  }
}
```

Library is compiled and packed into a NuGet package upon building:
```shell
dotnet build
```
> *Expected command result:*
```shell
Microsoft (R) Build Engine version 16.4.0 for .NET Core
Copyright (C) Microsoft Corporation. All rights reserved.        

  Restore completed in 26,77 ms for library.msbuildproj.
  PeachPie PHP Compiler version 1.0.0
  library -> \bin\Debug\netstandard2.0\library.dll
  Successfully created package '\bin\Debug\library.1.0.0.nupkg'.

Build succeeded.

    0 Warning(s)
    0 Error(s)

Time Elapsed 00:00:02.45
```

## Referencing library

### A. Referencing a `<ProjectReference>`

In case the library is a part of a .NET solution, it can be referenced as a .NET project.

> *Open the `.csproj` file and add following code snippet. Alter the `Include` value to point to your `library.msbuildproj` file.*

```xml
<ItemGroup>
  <ProjectReference Include="../library/library.msbuildproj" />
</ItemGroup>
```

### B. Referencing a `<PackageReference>`

The library can be provided to users as a standard .NET NuGet package. The created `.nupkg` file is supposed to be published to a NuGet feed. Use the `dotnet nuget push` command along with an API key. Please see [Publishing packages](https://docs.microsoft.com/en-us/nuget/nuget-org/publish-a-package) for more details.

> *Open the `.csproj` file and add following code snippet:*

```xml
<ItemGroup>
  <PackageReference Include="library" Version="1.0.0" />
</ItemGroup>
```

> Note: definitely choose a more specific name for your library. A fully namespaced name separated with dots is a common way of naming packages.

## Using library

Once the library is referenced, either as a ProjectReference or PackgeReference, it's public classes and methods become available to the client's C# code.

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

### Remarks

There are certain conversion conventions between PHP values and C# types. Please see [type system](/net/type-system) and [PhpValue](/api/ref/phpvalue) for more details and how the values are implicitly converted.

PHP objects and functions are liable to the instance of [Context](/net/ref/context) class. If ommited (like in this example) a default instance is provided implicitly. In case of a multithreaded evironment and web applications, make sure you provide an instance of `Context` corresponding to your current thread.

## Related links

- [Creating a NuGet from a PHP project](create-nuget)
- [What is NuGet](https://docs.microsoft.com/en-us/nuget/what-is-nuget) *(docs.microsoft.com)*
- [Signing NuGet Packages](https://docs.microsoft.com/en-us/nuget/create-packages/sign-a-package) *(docs.microsoft.com)*
