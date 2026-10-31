# Target .NET Framework

*(PeachPie 1.0.30, `netstandard2.0` / `net461`)*

PeachPie **1.1.13** (`Peachpie.NET.Sdk` 1.1.13 and `Peachpie.Runtime` 1.1.13) targets **`net6.0`**. Those packages do not contain a `netstandard2.0` or `net461` asset, so they cannot be referenced from .NET Framework.

The last line that targets **.NET Standard 2.0** is `1.0.*`. The latest of that line on nuget.org is **1.0.30** (`Peachpie.NET.Sdk` 1.0.30, `Peachpie.Runtime` 1.0.30, `Peachpie.RequestHandler` 1.0.30). `Peachpie.Runtime` 1.0.30 targets `netstandard2.0`. `Peachpie.RequestHandler` 1.0.30 targets `net461` and still exposes `RequestHandler.ProcessRequest(System.Web.HttpContext)`. Use this line when the host is .NET Framework 4.6.1. The steps below are for **1.0.30**, not for 1.1.13.

## Building the project

### Build a library

When compiling a library project to be referenced by other projects on the 1.0.30 line, target `netstandard2.0`. Make sure you have the following property set in [the project file](/php/msbuild):

```xml
<Project Sdk="Peachpie.NET.Sdk/1.0.30">
  <PropertyGroup>
    <TargetFramework>netstandard2.0</TargetFramework>
  </PropertyGroup>
</Project>
```

### Build an executable

In order to build an executable application for the .NET Framework, target `net461` or higher and specify the output type `exe` in [the project file](/php/msbuild), still with SDK 1.0.30:

```xml
<Project Sdk="Peachpie.NET.Sdk/1.0.30">
  <PropertyGroup>
    <OutputType>exe</OutputType>
    <TargetFramework>net461</TargetFramework>
  </PropertyGroup>
</Project>
```

Optionally, specify [the startup object](/php/msbuild#startupobject), which should be called upon starting the application.

## ASP.NET application

Assuming the project with PHP files is compiled as a library with SDK 1.0.30, you can target either `netstandard2.0` or `net461`.

```xml
<TargetFramework>net461</TargetFramework>
<AssemblyName>MyWebsite</AssemblyName><!-- an optional name -->
```

Add a package reference to request handler:

```xml
<ItemGroup>
  <PackageReference Include="Peachpie.RequestHandler" Version="1.0.30" />
</ItemGroup>
```

You can handle the requests to `*.php` pages on your ASP.NET (Integrated Pipeline) server (specifically IIS 7, IIS Express or Apache with mod_mono) in two ways; either by modifying `web.config` and passing requests directly to `MyWebsite.dll`, or by handling the requests programatically in your C# code.

### Option 1: Web.Config

Alter the web application's `web.config` file with the following configuration within `<configuration>` root element:

```xml
<system.webServer>
    <handlers>
      <add name="PeachpieHandler" path="*.php" verb="*" type="Peachpie.RequestHandler.RequestHandler, Peachpie.RequestHandler" resourceType="Unspecified" preCondition="integratedMode" />
    </handlers>
</system.webServer>
```

> Ensure the `/bin` folder of your ASP.NET application contains all the necessary assemblies including `MyWebsite.dll`, `Peachpie.RequestHandler.dll` and other Peachpie runtime assemblies. 

### Option 2: Programatically

In order to handle requests to compiled `*.php` pages, make use of the `RequestHandler` API. Obtain the instance of `System.Web.HttpContext` and pass it to the `RequestHandler.ProcessRequest(HttpContext)` method.

```c#
using Peachpie.RequestHandler;
new RequestHandler().ProcessRequest( httpContext );
```

The code above lazily loads PHP library assemblies (e.g. `MyWebsite.dll`) and looks up the compiled script corresponding to a given `httpContext`. If it is found, it gets included and processed.

## Related links

- [Target frameworks](https://docs.microsoft.com/en-us/dotnet/standard/frameworks) *(docs.microsoft.com)*
- [.NET Standard Versions Interactive Table](https://immo.landwerth.net/netstandard-versions/#) *(immo.landwerth.net)*
