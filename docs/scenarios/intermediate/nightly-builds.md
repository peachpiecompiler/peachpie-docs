# PeachPie Nightly Builds

The latest build of PeachPie is always available for our [Patreon](https://www.patreon.com/pchpcompiler) members at [feed.peachpie.io](https://feed.peachpie.io/).

### Use the Nightly Build

Latest daily build version needs to be specified in your PHP project. Edit the `.msbuildproj` project file and update the PeachPie package versions to the latest version pre-release available.

```xml
<Project Sdk="Peachpie.NET.Sdk/1.2.0-r17054">
  <PropertyGroup>
    <OutputType>library</OutputType>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
    <Compile Include="**/*.php" />
  </ItemGroup>

</Project>
```

> In this sample, we are using version `1.2.0-r17054`, the newest `1.2.0` prerelease on nuget.org (22 February 2024). `Peachpie.Runtime` 1.2.0-r17054 targets `net5.0`. Stable 1.1.13 targets `net6.0`, so keep this `net5.0` sample on the prerelease. Newer builds on the Patreon feed can target something else; read the package's target framework.

Note, if you reference any other *Peachpie* packages in other projects, it is **recommended** to use the same version across the entire solution.
