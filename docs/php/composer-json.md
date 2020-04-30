# Composer.json

`composer.json` is a JSON file placed in the root folder of PHP project. Its purpose is to specify a common project properties, meta data and dependencies, and it is a part of vast array of existing projects. In most ways, it is a counterpart to .NET project file. At least, the information from the `composer.json` file can be represented by standard .NET project properties and items (not the other way around).

## Metadata

By default, `composer.json` file is processed during build time. In result certain composer meta data are mapped to corresponding project properties which results in having created NuGet packages automatically annotated.

Following table lists composer meta and corresponding project properties being automatically set:

Meta | MsBuild Property | Nuspec Value
---  | --- | ---
Name | PackageId | Id
Description | PackageDescription | Description
Version | Version, PackageVersion /1/ | Version
License | PackageLicenseExpression | license
Homepage | PackageProjectUrl | ProjectUrl
Authors | Authors | Authors

**/1/** Version respects specified `$(VersionSuffix)` property. In case project has non-empty `VersionSuffix`, the resulting `Version` will have the suffix specified even composer's `version` meta does not have it.

## MSBuild Properties

### $(ComposerJsonPath)

The `ComposerJsonPath` property controls path to the `composer.json` file. If the property is empty, the file is being located next to the project file implicitly.

```xml
<ComposerJsonPath>false</ComposerJsonPath>
```

Set `ComposerJsonPath` to `false` in order to disable processing of composer.json meta data during build.

### $(VersionSuffix)

Explicitly setting `VersionSuffix` allows to override suffix portion of `version` meta data from composer file. If `VersionSuffix` is non-empty string, the resulting version will respect the suffix.

*Project file:*
```xml
<VersionSuffix>dev</VersionSuffix>
```

*composer.json*
```json
{
    "version": "1.2.3"
}
```

The setup above results in `PackageVersion` property set to `1.2.3-dev`.

## Composer Dependencies

> Sections "require", "require-dev" and "suggest" are not processed (yet). Same as the "autoload" section.

## Composer Autoload

Composer autoloading provides standard approach in defining classes automatically. Compiler processes the "autoload" section and tries to avoid autoloading process in the first place. Classes, interfaces and traits fulfiling the autoload map are declared implicitly without need of invoking autoloaders during run time.

In case a source file contains more than just the class itself, autoloading cannot be fully optimized. In such case, containing source file has to be looked up and invoked during run time causing an unnecesary overhead.

> Available since `0.9.971`

*Sample "composer.json":*
```json
{
    "autoload": {
        "psr-4": {
            "Vendor\\Namespace\\": "src/",
            "": "src/",
        },
        "psr-0": {
            "Vendor\\Namespace\\": "src/",
            "Vendor_Namespace_": "src/"
        },
        "classmap": ["src/", "lib/", "Something.php"],
        "exclude-from-classmap": ["/src/Tests/", "/lib/tests/"]
    }
}
```

This behavior differs from standard PHP where the map above is used to generate autoloaders which are invoked every time when an unknown class, interface or trait is being used in every new web request.
