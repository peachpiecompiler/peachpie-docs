# Project file reference

MSBuild is the build system for .NET and Visual Studio. The MSBuild project file is an XML file describing the build process and other features and properties.

## Sample Project File

```xml
<Project Sdk="Peachpie.NET.Sdk/1.0.19">
  <PropertyGroup>
    <OutputType>library</OutputType>
    <TargetFramework>netstandard2.1</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
    <Compile Include="**/*.php" />
  </ItemGroup>

</Project>
```

The sample project file above is supposed to be saved as **`your-project-name.msbuildproj`**. This particular example includes all the `.php` files into the compilation, uses the PeachPie compiler and targets class library projects. See the section [OutputType](#outputtype) below on how to target different project types. The project can be opened in Visual Studio 2017, Visual Studio Code, other IDEs or used from your favorite shell to build or run the project.

!!!note
    `Peachpie.NET.Sdk` is downloaded from a NuGet feed. Visual Studio resolves the Sdk automatically since 15.6.

Build the project using an IDE or the command below:
```bash
dotnet build
```

## Additional Properties

### OutputType

The `OutputType` property specifies whether to output an executable (`.exe`) or a library (`.dll`). The possible values are:

- library
- exe - in combination with `#!xml <TargetFramework>netcoreapp3.1</TargetFramework>` or higher.
- winexe
- module

### LangVersion

The `LangVersion` property specifies the version of the PHP semantic. This allows you to treat built-in types with respect to the PHP version or to enable language constructs (like `&new`) that have been removed from the latest versions of PHP.

```xml
<LangVersion>5.4</LangVersion>
```

The options are `5.4`, `5.5`, `5.6`, `7.0`, `7.1`, `7.2` etc., `default` and `latest`.

This option affects the source code syntax and the types used in type hints. The following code has a different semantic according to the `LangVersion` value:
```php
<?php
function foo(int $i, object $o, callable $c)
{
  // $i is either long or class `int`
  // $o is either an object or class `object`
}
```

### ShortOpenTag

The short open tag syntax (`<?`) is disabled by default. To enable it, set the `ShortOpenTag` property to `true`.

```xml
<ShortOpenTag>true</ShortOpenTag>
```

### NoWarn

Disables specific warning messages. The warnings are identified by their ID (e.g. `PHP5006`) and can be separated by a comma or a space.

```xml
<NoWarn>PHP5006,PHP0125</NoWarn>
```
The sample above disables the reporting of a call of an undefined function and declaring a mandatory parameter behind an optional parameter.

### DefineConstants

Defines constants in compile-time. The value of the property is a semicolon-separated list of name=value pairs. If the value is not specified, the constant is assumed to have a boolean value `TRUE`. Constant names cannot be namespaced, only simple names are allowed.

```xml
<DefineConstants>DEBUG;TRACE;INC_PATH="inc";FUNC_PATH="inc/functions"</DefineConstants>
```

Provided constants get defined in the compiled program. Defining constants is equivalent to calling `define(name, value);` before the script execution. Defining constants using the `$(DefineConstants)` property has performance advantages since the values may be evaluated in compile time.

> Available since `0.9.900`

### CodePage

Specifies an encoding to be used to parse source files. By default, the code page is `UTF-8`.

```xml
<CodePage>iso-8859-1</CodePage>
```

### GenerateDocumentationFile

Enables or disables the build of an `.xml` file with the `XMLDoc` generated from the source files' `PHPDoc`. The default value is `false` in order not to generate the XML documentation file.

```xml
<GenerateDocumentationFile>true</GenerateDocumentationFile>
```

!!! success "enabling this option is recommended"
    In case the project containing the XML documentation is referenced by a C# project, the IDE's IntelliSense will display additional text information collected from the `XMLDoc` file.

Enabling this property also sets following properties if not specified else:

- `DocumentationFile`
- `PublishDocumentationFile = true`

### PeachpieVersion

The property is set by Sdk to the current version of Peachpie. It can be used in project files to refer to the Peachpie version being used. The value of the property can be changed in order to use a different Peachpie runtime and compiler for the project.

### PhpDocTypes

This property allows strongly typing PHP properties, functions or function parameters using regular PHPDoc comments. This is useful for keeping a backward compatibility with PHP 5 and to strongly type PHP properties.

```xml
<PhpDocTypes>FieldTypes</PhpDocTypes>
```

Possible values are `None`, `FieldTypes`, `ParameterTypes`, `ReturnTypes` or `All` or their combination using a vertical bar `|`. The default is `None`. In case there is a PHP type hint, then the PHPDoc type is ignored. 

!!! example
    The result of setting **`PhpDocTypes`** to **`FieldTypes`** and compilation of the following  PHP source code
    ```php
    <?php
    class A {
      /** @var array */
      var $a_property;
      /** @var int */
      var $integer_property;
    }
    ```
    is a .NET assembly containing an equivalent to the following C# code:
    ```C#
    public class A {
      public PhpArray a_property;
      public long integer_property;
    }
    ```

!!!warning
    Be careful when enabling this option. Typed values won't persist a PHP reference.

### StartupObject

Specifies the function, method or file representing the application's main routine.

```xml
<OutputType>exe</OutputType>
<StartupObject>main.php</StartupObject>
```

The value can be set in one of the following formats:

- `filename.php` - startup object as a file.
- `function_name` - startup object as a global function.
- `class_name` - lookups for a static method `Main` on given class as the startup object.
- `class_name::method_name` - lookups for a method.

If the property is not specified, a script file that happens to be compiled first is used as the application's startup object.

### PhpRelativePath

Sets the compiled script files placement within the application's root directory.

```xml
<PhpRelativePath>vendor/author/package</PhpRelativePath>
```

> Available since `0.9.41`

## Common snippets

### Create NuGet package

The build system can automatically create a NuGet package. To create a NuGet package (`.nupkg`), insert the following snippet into the project file:
```xml
<PropertyGroup>
  <VersionPrefix>1.2.3</VersionPrefix>
  <GeneratePackageOnBuild>true</GeneratePackageOnBuild>
</PropertyGroup>
```

### Sign with a Strong Name

To provide a unique identity of the compiled assembly, sign the assembly with a strong name using a private key. Signing the assembly during the build process using your private key can be achieved using the following snippet:
```xml
<PropertyGroup>
  <!-- signing -->
  <AssemblyOriginatorKeyFile>my-key.snk</AssemblyOriginatorKeyFile>
  <SignAssembly>true</SignAssembly>
</PropertyGroup>
```

### EmbeddedResource

In order to generate the embedded files manifest and to embed content files as an embedded resource, add following:

```xml
<PropertyGroup>
  <GenerateEmbeddedFilesManifest>true</GenerateEmbeddedFilesManifest>
</PropertyGroup>
<ItemGroup>
  <PackageReference Include="Microsoft.Extensions.FileProviders.Embedded" Version="2.*" PrivateAssets="All" />
  <EmbeddedResource Include="**/*.png;**/*.css" />
</ItemGroup>
```

> Available since `0.9.46`

## Related links

- [MSBuild reference](https://docs.microsoft.com/en-us/visualstudio/msbuild/msbuild-reference) *(docs.microsoft.com)*
- [Sign an Assembly with a Strong Name](https://docs.microsoft.com/en-us/dotnet/framework/app-domains/how-to-sign-an-assembly-with-a-strong-name) *(docs.microsoft.com)*
- [Goodbye project.json, Hello MSBuild](http://www.peachpie.io/2017/04/msbuild-netcoreapp1-1.html) *(www.peachpie.io)*
