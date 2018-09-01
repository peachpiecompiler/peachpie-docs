# Create NuGet package

NuGet package provides a standardized way of sharing a library functionality across .NET projects. In general it contains the compiled code (assembly) and other files you want to deliver as a package. Packages are usually pushed to NuGet feeds (public or private) so they can be referenced by other projects.

Process of creating packages is separated from the compilation itself and is fully managed by build system. That means projects containing PHP code can be packaged using standard way which does not differ from packing of other project types. This article summarizes usual approaches and options.

## Packing on command line

Following command creates a default NuGet package (`.nupkg`) containing just the compiled assembly. Run the command wihtin [your project](/php/msbuild) directory.

```shell
dotnet pack
```

## Packing within build

Usually it is necessary to alter [the project file](/php/msbuild) with following properties in order to pack the compiled project after successful build. Insert following properties to the project file:

```xml
<GeneratePackageOnBuild>true</GeneratePackageOnBuild>
```

### Pack PHPDoc

Creates XMLDoc from contained PHPDoc and packs it into the NuGet package:
```xml
<GenerateDocumentationFile>true</GenerateDocumentationFile>
```

### Copy content into NuGet

Most PHP projects contain a decent amout of content that has to be published together with its compiled functionality. This usualy includes images, scripts and styles.

```xml
<ItemGroup>
  <Content Include="**/*.jpg;**/*.png" />
</ItemGroup>
```

Note, PHP files are compiled and their content is not copied to the package by default. Some functionality may require the PHP file to be physically present within the target project. Include such source files that are required the same way as other content files.

```xml
<ItemGroup>
  <Content Include="**/meta.php" />
</ItemGroup>
```

### Building the project

Build the project to create the package. Run the following command in your favorite command shell:

```shell
dotnet build
```

## Related links

- Using NuGet in C#
- [NuGet pack and restore as MSBuild targets](https://docs.microsoft.com/en-us/nuget/reference/msbuild-targets)
- [Signing NuGet Packages](https://docs.microsoft.com/en-us/nuget/create-packages/sign-a-package)