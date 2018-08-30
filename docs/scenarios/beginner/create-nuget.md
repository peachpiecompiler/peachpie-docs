# Create NuGet package

NuGet package provides a standardized way of sharing a library functionality across .NET projects. In general it contains the compiled code (assembly) and other files you want to deliver as a package. Packages are usually pushed to NuGet feeds (public or private) so they can be referenced by other projects.

Process of creating packages is separated from the compilation itself and is fully managed by build system. That means projects containing PHP code can be packaged using standard way. This article summarizes usual approaches and options.

## Options

- manually from command line: `dotnet pack` or `msbuild /t:pack`
- automatically after build: set property `GeneratePackageOnBuild` within [project file](../php/msbuild).

## Related links

- [NuGet pack and restore as MSBuild targets](https://docs.microsoft.com/en-us/nuget/reference/msbuild-targets)
- [Signing NuGet Packages](https://docs.microsoft.com/en-us/nuget/create-packages/sign-a-package)