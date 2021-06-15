# Self-contained executable

To create a self-contained PHP executable, start with a console application, e.g.:

```php
<?php

echo "Hello world!";
```

and a corresponding project file indicating that the output should be exe:

```xml
<Project Sdk="Peachpie.NET.Sdk/1.0.6">
  <PropertyGroup>
    <OutputType>exe</OutputType>
    <TargetFramework>netcoreapp3.1</TargetFramework>
    <StartupObject>main.php</StartupObject>
  </PropertyGroup>
  <ItemGroup>
    <Compile Include="**/*.php" />
  </ItemGroup>
</Project>
```

Now compile your project into binaries using the following command:
> `dotnet publish -c release`

This will publish the resulting binaries into the `/bin/release/netcoreapp3.1/publish` folder. 

As the final step, select an operating system to target, e.g. 

> `dotnet publish -c release -r win-x64` for 64-bit Windows, or

> `dotnet publish -c release -r linux-x64` for Linux.

This creates a self-contained executable PHP application targeting the operating system of your choice.

## Size considerations

A few tips on how to minimize the size of the resulting application:

* On Linux, you can get rid of culture-specific functionalities and keep just the "Invariant" culture features (cuts about 26MB of data). More detail [at globalization-invariant-mode.md](https://github.com/dotnet/corefx/blob/master/Documentation/architecture/globalization-invariant-mode.md).
* Use `dotnet-warp` to merge DLL files and remove unnecessary IL and methods. More info can be found [at hanselman.com](https://hanselman.com/blog/BrainstormingCreatingASmallSingleSelfcontainedExecutableOutOfANETCoreApplication.aspx).

!!! note
    Rename the project file so that it has the `.csproj` extension, it will work just fine.
  
## Resources

* [Blog post on self-contained executable PHP apps](https://www.peachpie.io/2019/06/self-contained-php-app.html)
* [Runtime Identifier (RID) catalog](https://docs.microsoft.com/en-us/dotnet/core/rid-catalog)
* [dotnet-warp](https://hanselman.com/blog/BrainstormingCreatingASmallSingleSelfcontainedExecutableOutOfANETCoreApplication.aspx)
* [PeachPie getting started](https://www.peachpie.io/getstarted)
* [dotnet publish](https://docs.microsoft.com/dotnet/core/tools/dotnet-publish)
* [PeachPie samples](https://github.com/iolevel/peachpie-samples)
* [ASP.NET Core Web Server](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/servers/)
