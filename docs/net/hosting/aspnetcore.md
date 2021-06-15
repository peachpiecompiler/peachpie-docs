# Hosting on ASP.NET Core

This article provides information on hosting PHP scripts within an ASP.NET Core Web Application. This represents a standard way of serving compiled PHP scripts on a web server. The full example can be found at [peachpie-samples/web-application](https://github.com/iolevel/peachpie-samples/tree/master/web-application).

It is important to note, that the resulting application is a standard ASP.NET Core Web Application; therefore further tasks like publish, deployment, continuous integration, and hosting on various providers and technologies are a subject to .NET and ASP.NET Core documentation.

## Create PHP library project

Directory with PHP project - its source files and static files - needs to be compiled as a library project. Create a project file in the root of the PHP project:

*/website/website.msbuildproj:*
```xml
<Project Sdk="Peachpie.NET.Sdk/1.0.6">
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

Add reference to the PHP library project `website.msbuildproj`, and to the `Peachpie.AspNetCore.Web` supporting package:

*using a commandline:*
```shell
dotnet add reference ../website/website.msbuildproj
dotnet add package Peachpie.AspNetCore.Web
```

*or by editing the .csproj project file:*
```xml
<ItemGroup>
  <ProjectReference Include="../website/website.msbuildproj" />
  <PackageReference Include="Peachpie.AspNetCore.Web" Version="1.0.6" />
</ItemGroup>
```

In result, you should have a following project structure:

![AS.NET Core Solution](/img/vs-aspnetcore-sln.png)

### Configuration

PHP request pipeline has to be configured before being used. Navigate to the startup class, and alter the `ConfigureServices` method:

```c#
public void ConfigureServices(IServiceCollection services)
{
    services.AddPhp(options =>
    {
        // options.Session.AutoStart = true;
    });
}
```

The extension method **AddPhp(options)** setups default PHP configuration, and initializes services required for serving compiled PHP script.

### Request pipeline

Integrate PHP handler into the request pipeline:

```c#
public void Configure(IApplicationBuilder app)
{
    app.UsePhp();
}
```
