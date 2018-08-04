The runtime (instance of `Context` class) maintains a set of declared classes, interfaces and traits (types in general). This simulates PHP behavior by extending the set automatically when the execution passes a type declaration and by providing the set of declared classes.

## Built-in Types

When a new `Context` (a web request or an application instance) is created, the list of all standard PHP types is populated. This includes `stdClass`, `Exception` and others.

## User defined types

When the program execution passes a user type declaration, the type is added to the set of declared types maintained within the current `Context`. The API allows to add a user defined type into the `Context` so a C# class for example can be 'injected' dynamically into the set of declared classes and used by PHP programs without the need of re-compiling.

## Autoload

The runtime supports a simulation of autoloading. This means that every time the program requests a type that is not declared in the `Context` yet and the situation allows the autoloading, the autoload mechanism is invoked.

The autoload mechanism complies with autoloading in the PHP language, taking into account both the `__autoload` function and SPL autoloading. The mechanism itself is provided by the service `IPhpAutoloadService`, which is maintained by the instance of `Context`. This allows you to handle or change the autoloading mechanism.

## Reflection

The runtime not only maintains the set of declared types. Every maintained type is associated with the CLR type and the `PhpTypeInfo` structure providing additional metadata and methods.

This allows the [[Reflection]] extension or a consumer of the compiled program to perform an additional utilization. It is thus possible to analyze running programs or dynamically find and instantiate declared PHP classes within C# programs.

## Internals

See [[Peachpie Architecture]] for more details on how the PHP type is represented in CLI.