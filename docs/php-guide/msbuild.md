# MSBuild reference

MSBuild is the build system for .NET and Visual Studio. The MSBuild project file is an XML file describing the build process and more.

## Sample Project File

```xml
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>library</OutputType>
    <TargetFramework>netstandard2.0</TargetFramework>
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

The sample project file above is supposed to be saved as `your-project-name.msbuildproj`. This particular example includes all the `.php` files into the compilation, uses the PeachPie compiler and targets class library projects. See section [Output Type](#outputtype) below on how to target different project types. The project can be opened in Visual Studio 2017, Visual Studio Code, other IDEs or used from your favorite shell to build or run the project.

```bash
dotnet build
```

!!!warning "before opening in Visual Studio 2017"
    In case you are opening the project in Visual Studio 2017, run once the restore command:
    ```bash
    dotnet restore
    ```

## Additional Properties

### OutputType

The `OutputType` property specifies whether to output an executable (`.exe`) or a library (`.dll`). Possible values are:

- library
- exe - in combination with `<TargetFramework>netcoreapp2.0</TargetFramework>` or higher.
- winexe
- module

### LangVersion

The `LangVersion` property specifies the version of PHP semantic. This allows to treat built-in types with respect to PHP version or to allow language constructs (like `&new`) that has been removed from latest versions of PHP.

```xml
<LangVersion>5.4</LangVersion>
```

The options are `5.4`, `5.5`, `5.6`, `7.0`, `7.1`, `7.2` etc.

This option has effect to source code syntax and types used in type hints. Following code has a different semantic according to the `LangVersion` value:
```php
<?php
function foo(int $i, object $o, callable $c)
{
  // $i is either long or class `int`
  // $o is either an object or class `object`
}
```

### ShortOpenTag

Short open tag syntax (`<?`) is disabled by default. To enable it set `ShortOpenTag` property to `true`.

```xml
<ShortOpenTag>true</ShortOpenTag>
```

### NoWarn

Disables specific warning messages. The warnings are identified by their ID (e.g. `PHP3006`) and can be separated by comma or space.

```xml
<NoWarn>PHP3006,PHPX0125</NoWarn>
```
The sample above disables reporting of call of an undefined function and declaring a mandatory parameter behind optional parameter.

### GenerateDocumentation

Enables or disables creation of `.xml` file with `XMLDoc` generated from source files `PHPDoc`. Default is `false` to not generate the XML documentation file.

```xml
<GenerateDocumentation>true</GenerateDocumentation>
```

### PhpDocTypes

Allows to strongly type PHP properties, functions or function parameters using regular PHP Doc comment. This is useful for keeping backward compatibility with PHP 5 and to strongly type PHP properties.

Possible values are `None`, `FieldTypes`, `ParameterTypes`, `ReturnTypes` or `All` or their combination using vertical bar `|`. In case there is a PHP type hint, the PHPDoc type is ignored.

```xml
<PhpDocTypes>FieldTypes</PhpDocTypes>
```

Default is `None`.

!!!warning
    Be careful when enabling this option. Typed values won't persist a PHP reference.

## Create NuGet package

Build system can automatically create the NuGet package. To create the NuGet package (`.nupkg`) insert the following snippet into the project file:
```xml
<PropertyGroup>
  <VersionPrefix>1.2.3</VersionPrefix>
  <GeneratePackageOnBuild>true</GeneratePackageOnBuild>
</PropertyGroup>
```

## Sign with a Strong Name

To provide a unique identity of the compiled assembly, sign the assembly with a strong name using a private key. Signing the assembly during the build process using your private key can be achieved using the following snippet:
```xml
<PropertyGroup>
  <!-- signing -->
  <AssemblyOriginatorKeyFile>my-key.snk</AssemblyOriginatorKeyFile>
  <SignAssembly>true</SignAssembly>
  <PublicSign Condition="'$(OS)' != 'Windows_NT'">true</PublicSign>
</PropertyGroup>
```

## Related links
- [MSBuild reference](https://docs.microsoft.com/en-us/visualstudio/msbuild/msbuild-reference) *(docs.microsoft.com)*
- [Sign an Assembly with a Strong Name](https://docs.microsoft.com/en-us/dotnet/framework/app-domains/how-to-sign-an-assembly-with-a-strong-name) *(docs.microsoft.com)*
- [Goodbye project.json, Hello MSBuild](http://www.peachpie.io/2017/04/msbuild-netcoreapp1-1.html)