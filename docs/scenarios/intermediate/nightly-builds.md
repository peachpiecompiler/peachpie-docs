# PeachPie Nightly Builds

The latest build of PeachPie is always available on our AppVeyor feed. The build is annotated as a PreRelease version.

### Register Package Source

Add the following NuGet feed source: `https://ci.appveyor.com/nuget/peachpie`

Either on command line:

```
dotnet nuget add source https://ci.appveyor.com/nuget/peachpie -n peachpie-appveyor
```

Or create the `NuGet.config` file in the root of your project:

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <add key="peachpie-appveyor" value="https://ci.appveyor.com/nuget/peachpie" />
  </packageSources>
</configuration>
```

### Use the Nightly Build

Then the latest build has to be used by PHP projects. Edit the `.msbuildproj` project file and update the PeachPie packages version to the latest AppVeyor version. The version number can be found on https://ci.appveyor.com/project/dotnetfoundation/peachpie/history.

```xml
<Project Sdk="Peachpie.NET.Sdk/1.0.0-appv4625">
  <PropertyGroup>
    <OutputType>library</OutputType>
    <TargetFramework>netstandard2.1</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
    <Compile Include="**/*.php" />
  </ItemGroup>

</Project>
```

> In this sample, we are using version `1.0.0-appv4625`.

Note, if you reference any other *Peachpie* packages in other projects, it is recommended to use the same version across the entire solution.