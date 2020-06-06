# Hosting on ASP.NET Core

This article provides information on hosting PHP scripts within an ASP.NET Core Web Application. This represents a standard way of serving compiled PHP scripts on a web server. The full example can be found at [peachpie-samples/web-application](https://github.com/iolevel/peachpie-samples/tree/master/web-application).

It is important to note, that the resulting application is a standard ASP.NET Core Web Application; therefore further tasks like publish, deployment, continuous integration, and hosting on various providers and technologies are a subject to .NET and ASP.NET Core documentation.

## Create PHP library project

Directory with PHP project - its source files and static files - needs to be compiled as a library project. Create a project file in the root of the PHP project:

*/website/website.msbuildproj:*
```xml
<Project Sdk="Peachpie.NET.Sdk/0.9.981">
  <PropertyGroup>
    <OutputType>library</OutputType>
    <TargetFramework>netstandard2.1</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
    <Compile Include="**/*.php;" />
    <Content Include="**/*" Exclude="**/*.php;obj/*;bin/**;" />
  </ItemGroup>

</Project>
```

Add a sample PHP file to the directory, if it is an empty project:

*/website/index.php:*
```php
<?php

echo "Hello World!";
```

Try to build the project from command line:

```shell
dotnet build
```

## Create ASP.NET Core application

Once the PHP library project is ready, open or create an ASP.NET Core web application project **(C#)**.

## Hosting PHP library on ASP.NET Core application

Add reference to the PHP library project `website.msbuildproj`, and to the `Peachpie.AspNetCore.Web` supporting library.

```xml
<ProjectReference Include="../website/website.msbuildproj" />
```

```xml
<PackageReference Include="Peachpie.AspNetCore.Web" Version="0.9.981" />
```

### Configuration

PHP request pipeline has to be configured before being used. Navigate to your startup class, and alter the `ConfigureServices` method:

```c#
public void ConfigureServices(IServiceCollection services)
{
    servies.AddPhp(options =>
    {
        // options.Session.AutoStart = true;
    });
}
```

The extension method **AddPhp(options)** setups default PHP configuration, and initializes services required for serving compiled PHP script.

### Request pipeline

Integrate PHP handler into the request pipeline:

```c#
app.UsePhp();
```
