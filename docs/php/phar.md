# Phar archives

Phar is PHP's unique way of packing libraries or applications into a single file. The support for the Phar archives is built in the compiler and supported by the runtime.

## Phar compilation

File with the extension `.phar` can be included into the compilation, like any other source file.

```xml
<Compile Include="**/*.phar" />
```

### Remarks

In compile time, `.phar` files are opened and containing scripts compiled separatelly.

Non-script entries, content files, are stored within the resulting assembly as resources. Such resources are accessed in runtime from within PHP code using `phar://` scheme prefix, or using .NET method `#!c# System.Reflection.Assembly.GetManifestResourceStream(name)` where name is in form of *"phar://{relative_phar_path}/{phar_entry_name}"*.

## StartupObject

Phar's stub code can be specified as the application's [startup object](msbuild#startupobject). In case a `.phar` file is specified as the first source file being compiled, it is automatically used as the application's entry point. Phar entries (files contained in the archive except for the phar stub) cannot be used as the application's startup object.

## Phar content files

Any Phar entry that is not recognized as a source file is compiled as a resource. Source files are determined using following rules:

- entry has an extension `.php`
- entry has no extension and starts with `#!php# <?php` openinig tag.
- entry has a well known extension (`.inc`, `.php5`, `.module`) and contains the openinig tag `#!php# <?php`.

Note, this behaviour may change.

## Runtime API

Phar support allows for compilation, inclusion, mapping Phar aliases and retrieving Phar content files.

The support for modifying or creating of Phar archives is not supported.
