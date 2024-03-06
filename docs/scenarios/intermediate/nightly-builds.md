# PeachPie Nightly Builds

The latest build of PeachPie is always available for our [Patreon](https://www.patreon.com/pchpcompiler) members at [feed.peachpie.io](https://feed.peachpie.io/).

### Use the Nightly Build

Latest daily build version needs to be specified in your PHP project. Edit the `.msbuildproj` project file and update the PeachPie package versions to the latest version pre-release available.

```xml
<Project Sdk="Peachpie.NET.Sdk/1.2.0-r14700">
  <PropertyGroup>
    <OutputType>library</OutputType>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
    <Compile Include="**/*.php" />
  </ItemGroup>

</Project>
```

> In this sample, we are using version `1.2.0-r14700`.

Note, if you reference any other *Peachpie* packages in other projects, it is **recommended** to use the same version across the entire solution.
