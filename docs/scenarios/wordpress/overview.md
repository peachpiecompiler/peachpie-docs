# Overview

[WpDotNet](https://www.wpdotnet.com/) is the unmodified WordPress, running compiled purely on .NET, provided as a NuGet package and ready to be used as a part of an ASP.NET Core application. WpDotNet comes with additional components and features, making it easy to be used from C# and a .NET development environment in general.

The project does not require PHP to be installed, and is purely built on top of the .NET platform.

The maintained WordPress documentation is at [wpdotnet.com](https://www.wpdotnet.com/). This section is the same material, with package versions taken from nuget.org.

## Requirements

- The **.NET 6 runtime** ([dotnet.microsoft.com](https://dotnet.microsoft.com/download)) when the app targets `net6.0`. [`PeachPied.WordPress.AspNetCore` 6.7.1](https://www.nuget.org/packages/PeachPied.WordPress.AspNetCore/6.7.1) targets `net6.0` and depends on PeachPie **1.1.11** (`Peachpie.App` 1.1.11, `Peachpie.AspNetCore.Web` 1.1.11, `Peachpie.AspNetCore.Mvc` 1.1.11), which also targets `net6.0`.
- MySQL Server ([dev.mysql.com](https://dev.mysql.com/downloads/mysql/) or [docker](https://hub.docker.com/_/mysql))

Make sure you have valid credentials to your MySQL server and you have created a database in it. The following quick start expects a database named `"wordpress"`. Database charset `"UTF-8"` is recommended.

## Quick Start

The sources of a demo WordPress application are at [github.com/iolevel/peachpie-wordpress](https://github.com/iolevel/peachpie-wordpress). That repository's `global.json` pins `Peachpie.NET.Sdk` **1.1.11** and `PeachPied.WordPress.Build.Plugin` **6.7.1**.

Open or create an ASP.NET Core application that targets `net6.0`, the framework the 6.7.1 package is built for:

```shell
dotnet new web -f net6.0
```

Add a package reference to `PeachPied.WordPress.AspNetCore`. Version 6.7.1 is a stable package (published 20 February 2025), not the older `6.3.1-rc-016` prerelease:

```shell
dotnet add package PeachPied.WordPress.AspNetCore --version 6.7.1
```

Add the WordPress services and set up your database connection (here or in `appsettings.json`):

```csharp
builder.Services.AddWordPress(options =>
{
    options.DbHost = "localhost";
    options.DbName = "wordpress";
    // ...
});
```

The same extension method works from `Startup.ConfigureServices`:

```csharp
public void ConfigureServices(IServiceCollection services)
{
    services.AddWordPress(options =>
    {
        options.DbHost = "localhost";
        options.DbName = "wordpress";
    });
}
```

Add the WordPress middleware within your request pipeline:

```csharp
app.UseWordPress();
```

> Note: the recommended approach is to place the configuration within the `appsettings.json` configuration file. See [configuration](configuration) for more details.

## Dashboard

Besides regular WordPress dashboard pages, WpDotNet adds an informational panel on the Dashboard Home page, within the *At a Glance* widget.

The panel provides information about the current .NET runtime version, consumed memory, or total CPU time spent in the whole application. Note that the values are reset if the process is restarted.

## Differences

The main differences between regular WordPress running on PHP and WpDotNet running on .NET are:

- The .NET application and all its [plugins and themes](add-plugin-theme) need to be compiled before running. Plugins and themes cannot be added after building the project.
- The WordPress configuration is not set in `wp-config.php` anymore. WpDotNet uses ASP.NET Core configuration providers like `appsettings.json`. See [configuration](configuration).
- There is no `php` interpreter. PHP standard functions and extensions are re-implemented in .NET and their behavior may differ.

## Remarks

- Permalinks are implicitly enabled through the URL rewriting feature.
- WordPress debugging is implicitly enabled when running in a Development environment.
- When running on Azure with MySQL in App enabled, the database connection is automatically configured.
- Response caching and response compression are enabled by default when the user is not logged in.
- Most of the original `.php` files are not present on the file system and cannot be edited.

## Next steps

- [ASP.NET Core with WordPress](aspnetcore-wordpress)
- [Configuration](configuration)
- [Adding a plugin or theme](add-plugin-theme)
- [SDK sources](https://github.com/iolevel/wpdotnet-sdk)
