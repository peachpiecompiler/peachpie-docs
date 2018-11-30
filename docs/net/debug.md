# How to Debug PeachPie Code

* Clone the peachpie repo.
* Checkout a tag of the most recent release.
* In peachpie\build\Settings.props, check the Version node and make sure all of the assemblies have the same version set.  
* Build the project.
* In the project that is using peach pie remove the nuget references and instead add references to the all of dlls in peachpie\src\Peachpie.App\bin\Debug\netstandard2.0\
* Now you should be able to step inside of peachpie runtime code while debugging!


## Old Project file
```xml
 <Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>netcoreapp2.1</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
    <PackageReference Include="Peachpie.App" Version="0.9.18" />
    <PackageReference Include="Peachpie.CodeAnalysis" Version="0.9.18" />
    <PackageReference Include="Peachpie.Library" Version="0.9.18" />
    <PackageReference Include="Peachpie.Library.Graphics" Version="0.9.18" />
    <PackageReference Include="Peachpie.Library.MsSql" Version="0.9.18" />
    <PackageReference Include="Peachpie.Library.MySql" Version="0.9.18" />
    <PackageReference Include="Peachpie.Library.Network" Version="0.9.18" />
    <PackageReference Include="Peachpie.Library.PDO" Version="0.9.18" />
    <PackageReference Include="Peachpie.Library.PDO.MySQL" Version="0.9.18" />
    <PackageReference Include="Peachpie.Library.PDO.SqlSrv" Version="0.9.18" />
    <PackageReference Include="Peachpie.Library.Scripting" Version="0.9.18" />
    <PackageReference Include="Peachpie.Library.XmlDom" Version="0.9.18" />
    <PackageReference Include="Peachpie.Runtime" Version="0.9.18" />
  </ItemGroup>
</Project>

```

## New Project File
```xml
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>netcoreapp2.1</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
    <Reference Include="Peachpie.App">
      <HintPath>..\..\..\..\peachpie\src\Peachpie.App\bin\Debug\netstandard2.0\Peachpie.App.dll</HintPath>
    </Reference>
    <Reference Include="Peachpie.CodeAnalysis">
      <HintPath>..\..\..\..\peachpie\src\Peachpie.App\bin\Debug\netstandard2.0\Peachpie.CodeAnalysis.dll</HintPath>
    </Reference>
    <Reference Include="Peachpie.Library">
      <HintPath>..\..\..\..\peachpie\src\Peachpie.App\bin\Debug\netstandard2.0\Peachpie.Library.dll</HintPath>
    </Reference>
    <Reference Include="Peachpie.Library.Graphics">
      <HintPath>..\..\..\..\peachpie\src\Peachpie.App\bin\Debug\netstandard2.0\Peachpie.Library.Graphics.dll</HintPath>
    </Reference>
    <Reference Include="Peachpie.Library.MsSql">
      <HintPath>..\..\..\..\peachpie\src\Peachpie.App\bin\Debug\netstandard2.0\Peachpie.Library.MsSql.dll</HintPath>
    </Reference>
    <Reference Include="Peachpie.Library.MySql">
      <HintPath>..\..\..\..\peachpie\src\Peachpie.App\bin\Debug\netstandard2.0\Peachpie.Library.MySql.dll</HintPath>
    </Reference>
    <Reference Include="Peachpie.Library.Network">
      <HintPath>..\..\..\..\peachpie\src\Peachpie.App\bin\Debug\netstandard2.0\Peachpie.Library.Network.dll</HintPath>
    </Reference>
    <Reference Include="Peachpie.Library.PDO">
      <HintPath>..\..\..\..\peachpie\src\Peachpie.App\bin\Debug\netstandard2.0\Peachpie.Library.PDO.dll</HintPath>
    </Reference>
    <Reference Include="Peachpie.Library.Scripting">
      <HintPath>..\..\..\..\peachpie\src\Peachpie.App\bin\Debug\netstandard2.0\Peachpie.Library.Scripting.dll</HintPath>
    </Reference>
    <Reference Include="Peachpie.Library.XmlDom">
      <HintPath>..\..\..\..\peachpie\src\Peachpie.App\bin\Debug\netstandard2.0\Peachpie.Library.XmlDom.dll</HintPath>
    </Reference>
    <Reference Include="Peachpie.Runtime">
      <HintPath>..\..\..\..\peachpie\src\Peachpie.App\bin\Debug\netstandard2.0\Peachpie.Runtime.dll</HintPath>
    </Reference>
  </ItemGroup>

</Project>
```