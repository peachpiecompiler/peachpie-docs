# Download

PeachPie is a compiler toolchain distributed as an Sdk for `dotnet`. There are two options:

- Use a pre-build package on [feed.peachpie.io](https://feed.peachpie.io/).
- [Build your development build](/scenarios/intermediate/debugging-peachpie).

## Pre-Build Packages (feed.peachpie.io)

Pre-Build NuGet packages of latest releases, nightly builds, release candidate builds, and work-in-progress features are available to our [Patreon](https://www.patreon.com/pchpcompiler) members at [feed.peachpie.io/](https://feed.peachpie.io/).

- Register the feed as your alternative NuGet source. **Password** is available on the [Patreon](https://www.patreon.com/pchpcompiler) page.

```
dotnet nuget add source https://feed.peachpie.io/v3/index.json -n "peachpie feed" -u PAT -p {{PASSWORD}}
```

- Consume the Sdk from the MsBuild tasks as described at our [MsBuild Docs](/php/msbuild).
