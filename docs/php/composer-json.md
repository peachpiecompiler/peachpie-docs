# Composer.json

`composer.json` is a JSON file placed in the root folder of PHP project. Its purpose is to specify a common project properties, meta data and dependencies, and it is a part of vast array of existing projects. In most ways, it is a counterpart to .NET project file. At least, the information from the `composer.json` file can be represented by standard .NET project properties and items (not the other way around).

## Metadata

By default, the `composer.json` file is processed during build time. As a result, certain composer metadata is mapped to the corresponding project properties, thanks to which the created NuGet packages are automatically annotated.

Following table lists composer meta and corresponding project properties being automatically set:

Meta | MsBuild Property | Nuspec Value
---  | --- | ---
"name" | PackageId | Id
"description" | PackageDescription | Description
"version" | Version, PackageVersion /1/ | Version
"license" | PackageLicenseExpression | license
"homepage" | PackageProjectUrl | ProjectUrl
"authors" | Authors | Authors

**/1/** Version respects specified `$(VersionSuffix)` property. In case project has non-empty `VersionSuffix`, the resulting `Version` will have the suffix specified even composer's `version` meta does not have it.

## MSBuild Properties

### $(ComposerJsonPath)

The `ComposerJsonPath` property controls path to the `composer.json` file. If the property is empty, the file is being located next to the project file implicitly.

```xml
<ComposerJsonPath>false</ComposerJsonPath>
```

Set `ComposerJsonPath` to `false` in order to disable processing of composer.json meta data during build.

### $(ComposerAutoload)

Setting `ComposerAutoload` to `true` or `false` controls whether autoload rules are processed.

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

> Sections "require", "require-dev" and "suggest" are not processed (yet).

## Composer Autoload

> Available since `0.9.980`

Composer autoloading provides a standard approach in defining what classes will be loaded automatically when needed. Also, it allows to specify what files will be included by the runtime at the very beginning of request or the program start. When the compiler processes the `"autoload"` section, it remembers the autoloading rules and stores the information in metadata. It does not use the information to compile any additional files - all the files meant to be compiled have to be listed within the `<Compile>` MSBuild item group explicitly.

- Rules from `composer.json` will stored within the assembly's metadata; hence the original `composer.json` file is not required to be bundled with the compiled application.
- Files listed in `"autoload"` are not automatically added to the compilation. Files needed to be compiled have to be listed within the `<Compile>` item group explicitly.
- A syntax error in the json file will cause the compilation to stop with a corresponding error message. A wrong value in the `composer.json` causes a compile-time warning and the compilation will continue.

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
        "exclude-from-classmap": ["/src/Tests/", "/lib/tests/"],
        "files": [],
    }
}
```

During the compilation, this information is used in order to avoid autoloading process in the first place. Classes, interfaces and traits fulfiling the specified rules are declared implicitly without need of invoking autoloaders during run time. (We can say, the autoloading will performed only once during compilation when it's safe to.) In case a source file contains more than just the class itself, autoloading cannot be fully optimized. In such case, containing source file has to be looked up and invoked during run time causing an unnecesary overhead.

This behavior differs from standard PHP where the map above is used to generate autoloaders which are invoked every time when an unknown class, interface or trait is being used in every new web request.
