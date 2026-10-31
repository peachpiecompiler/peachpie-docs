# Download

PeachPie is a compiler toolchain distributed as an Sdk for `dotnet`.

## Current release (nuget.org)

The current public release is **1.1.13**.

```xml
<Project Sdk="Peachpie.NET.Sdk/1.1.13">
  <PropertyGroup>
    <OutputType>exe</OutputType>
    <TargetFramework>net6.0</TargetFramework>
  </PropertyGroup>
</Project>
```

`Peachpie.NET.Sdk` 1.1.13, `Peachpie.AspNetCore.Web` 1.1.13, and `Peachpie.AspNetCore.Mvc` 1.1.13 are on [nuget.org](https://www.nuget.org/packages/Peachpie.NET.Sdk/1.1.13). The compiler runs on the .NET 6 runtime. See [get started](/get-started) for the template install (`Peachpie.Templates` 1.0.33) and [the project file](/php/msbuild) for the other properties.

WordPress on .NET is a separate package, [`PeachPied.WordPress.AspNetCore` 6.7.1](https://www.nuget.org/packages/PeachPied.WordPress.AspNetCore/6.7.1), built on PeachPie **1.1.11**. See [WordPress](/scenarios/wordpress/overview).

## Pre-release packages (feed.peachpie.io)

Nightly builds, release candidates, and work-in-progress features are available to [Patreon](https://www.patreon.com/pchpcompiler) members at [feed.peachpie.io/](https://feed.peachpie.io/).

- Register the feed as an additional NuGet source. **Password** is available on the [Patreon](https://www.patreon.com/pchpcompiler) page.

```
dotnet nuget add source https://feed.peachpie.io/v3/index.json -n "peachpie feed" -u PAT -p {{PASSWORD}}
```

The newest `1.2.0` prerelease that is on the public nuget.org feed is `1.2.0-r17054` (22 February 2024). That runtime package targets `net5.0`, which is not the target framework of stable 1.1.13. See [nightly builds](/scenarios/intermediate/nightly-builds).

## Build from source

[Build a development build](/scenarios/intermediate/debugging-peachpie) of the compiler. The sources currently version those packages as `1.2.0-dev` and target `net6.0`. Building the repository asks for the .NET 9 SDK, as described in the compiler repo's `docs/Building-Peachpie.md`.
