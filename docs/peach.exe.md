**peach.exe** is a command-line utility invoking the compiler in order to generate DLL from set of PHP files. The utility targets .NET Framework 4.6. For .NET Core and .NET Standard projects see [[msbuild]] project.

### Usage
`peach.exe [options] file1 file2 wildcards ...`

|Option|Purpose|
|---|---|
|/?, /help|Displays the command line compiler options.|
|/r, /reference|References metadata from the specified assembly files. By default compiler already references `mscorlib`, `Peachpie.Runtime` and `Peachpie.Library`|
|/debug, /debug+|Whether to emit debugging information.|
|/debug-|Does not emit debugging information.|
|/o, /optimize, /o+, /optimize+|Whether to emit code optimized for release.|
|/langversion|The version of language to parse. Options are 5.4, 5.5, 5.6, 7.0, 7.1 or 7.2. The default value is the latest supported version.|
|/shortopentag|Whether to enable PHP short open tag syntax (`<?`). Disabled by default.|
|/shortopentag+|Shortcut for `/shortopentag:true`.|
|/nologo|Suppresses compiler copyright message.|
|/m, /main|Specifies the application entry point (.exe target only). A script file, a class with Main method, a global function or a static method.|
|/pdb|Specifies the file name and location of the .pdb file.|
|/out|Specifies the output file name. Default is a base name of file with main class or first file.|
|/doc, /xmldoc|If given, XML documentation will be generated. Optional value specifies the XML file name, without the value the name of output assembly will be used.|
|/t, /target|Specifies the format of the output file. Options are `exe`(default), `library`, `winexe`, `module`,  `winmdobj`, `appcontainerexe`.|
|/phpdoctypes+, /phpdoctypes-|Shortcut for `/phpdoctypes:All` or `/phpdoctypes:None`.|
|/phpdoctypes|Specifies what PHPDoc is used for strict type information. Possible values are `None`, `FieldTypes`, `ParameterTypes`, `ReturnTypes` or `All` or their combination using vertical bar `\|`. In case there is a PHP type hint, the PHPDoc type is ignored.|
|/d, /define|Defines compile-time constant. Usage `/d:C=VALUE` specifies that constant `C` in source code will be treated as `VALUE`.|
|/nowarn|Disable specific warning messages|

### Example
* Compile a console application to an executable file.

`peach.exe /target:exe /out:myprogram.exe main.php src/**/*.php`

* Compile a web application to be deployed on Web Server.

`peach.exe /target:library /out:website.dll **/*.php`

* Compile a class library to be referenced and used from a C# project. XML documentation will be created so IntelliSense in Visual Studio gives you symbols documentation.

`peach.exe /target:library /doc /out:mylibrary.dll **/*.php`