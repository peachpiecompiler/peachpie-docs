# Adding a plugin or theme

Plugins and themes, either your own or plugins and themes downloaded from the [WordPress directory](https://wordpress.org/plugins/), need to be added during the development process and compiled. They are not installed from the dashboard into an already published build.

The public feed previously documented at `https://feed.peachpie.io/wpdotnet/v3/index.json` returns 404. Compile the plugin as a project instead, and take packages from nuget.org.

**Sample project**: https://github.com/iolevel/peachpie-wordpress/tree/master/MyContent

## Project structure

The following project structure respects the `/wp-content/` directory used by WordPress. Put the plugin source files in `plugins`, and themes in `themes`.

Following is the file structure for the basic WordPress [*Hello Dolly* plugin](https://wordpress.org/plugins/hello-dolly/).

```shell
MyContent
└ plugins
  └ hello.php
```

The name of the folder is not relevant.

The plugin must contain the standard plugin metadata. The main source file needs the following header:

```php
<?php
/*
Plugin Name: Hello Dolly
Version: 1.7.2
*/
```

## Project file

Create a project file next to the content folder.

```shell
MyContent
├ MyContent.msbuildproj
└ plugins
  └ hello.php
```

```xml
<Project Sdk="PeachPied.WordPress.Build.Plugin/6.7.1">
</Project>
```

`PeachPied.WordPress.Build.Plugin` 6.7.1 is on nuget.org. The version has to match the other `PeachPied.WordPress.*` packages in the application. The sample repository pins the same version in `global.json`:

```json
{
  "msbuild-sdks": {
    "Peachpie.NET.Sdk": "1.1.11",
    "PeachPied.WordPress.Build.Plugin": "6.7.1"
  }
}
```

With that file, the project can say `Sdk="PeachPied.WordPress.Build.Plugin"` without a version. PeachPie here is **1.1.11**, because that is what `PeachPied.WordPress` 6.7.1 depends on. The 1.1.13 compiler is a different release.

For most cases the project file does not specify anything else. The SDK sets the default properties. Add a property or an item only when you need to change them. The sample sets `PhpRelativePath` to `wp-content/`.

## Build

```shell
dotnet build
```

The first build downloads the SDK and its dependencies. Warnings are printed. An error in the PHP code fails the build. WordPress plugins often contain code that does not compile, such as tests or adapters for plugins you do not use. Exclude those files from compilation, or fix them.

## Reference the plugin

From the ASP.NET Core application (see [overview](overview)), reference `MyContent.msbuildproj`:

```xml
<ItemGroup>
  <ProjectReference Include="../MyContent/MyContent.msbuildproj" />
</ItemGroup>
```

The plugin still needs to be activated in the WordPress dashboard once you compile and run the application.
