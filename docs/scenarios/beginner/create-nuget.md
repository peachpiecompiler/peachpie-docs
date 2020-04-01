# Create a NuGet package

NuGet packages provide a standardized way of sharing a library functionality across .NET projects. In general, they contain the compiled code (assembly) and other files you want to deliver as a package. Packages are usually pushed to NuGet feeds (public or private), so that they can be referenced by other projects.

The process of creating packages is separated from the compilation itself and is fully managed by the build system. This means that projects containing PHP code can be packaged using a standard way, no different from packing other project types. This article summarizes the usual approaches and options.

## Packing on the command line

The following command creates a default NuGet package (`.nupkg`) containing just the compiled assembly. Run the command within [your project](/php/msbuild) directory.

```shell
dotnet pack
```

## Packing within build

Usually it is necessary to alter [the project file](/php/msbuild) with the following properties in order to pack the compiled project after a successful build. Insert the following properties into the project file:

```xml
<GeneratePackageOnBuild>true</GeneratePackageOnBuild>
```

### Pack PHPDoc

Creates XMLDoc from the contained PHPDoc and packs it into the NuGet package:
```xml
<GenerateDocumentationFile>true</GenerateDocumentationFile>
```

### Copy content into the NuGet

Most PHP projects contain a decent amout of content that has to be published together with its compiled functionality. This usualy includes images, scripts and styles.

```xml
<ItemGroup>
  <Content Include="**/*.jpg;**/*.png" />
</ItemGroup>
```

!!! Note
    PHP files are compiled and their content is not copied to the package by default. Some functionalities may require the PHP file to be physically present within the target project. Include those required source files in the same way as you would any other content files. 

```xml
<ItemGroup>
  <Content Include="**/*.php" />
</ItemGroup>
```

### Building the project

Build the project to create the package. Run the following command in your favorite command shell:

```shell
dotnet build
```

## Related links

- [Using compiled project in C#](../reference-php-project/)
- [NuGet pack and restore as MSBuild targets](https://docs.microsoft.com/en-us/nuget/reference/msbuild-targets) *(docs.microsoft.com)*
- [Signing NuGet Packages](https://docs.microsoft.com/en-us/nuget/create-packages/sign-a-package) *(docs.microsoft.com)*
