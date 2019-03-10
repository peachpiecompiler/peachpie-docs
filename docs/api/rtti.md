# Runtime Type Information

Runtime Type Information (RTTI) is a mechanism best known from the C++ platform. It allows for types to be resolved and reflected dynamically at run time. Here we introduce several additions due to the nature of dynamic languages.

## Declared types

The runtime (instance of [`Context`](ref/context) class) maintains a set of declared classes, interfaces and traits (types). The set is divided into two parts:

- **Application types** contains implicitly declared types from referenced libraries.
- **User defined types**  are declared during the program (request) execution.

This allows for the application types to be declared just once, and to be shared by many `Context` instances. The set of types is keyed by the type's fully qualified name and points to the type's runtime information [PhpTypeInfo](ref/phptypeinfo).

Types added to the set of declared types can be both PHP types and .NET types. Every type in the set can be consumed by following PHP constructs:

- `new`, `instanceof`
- reflection API
- static member access

### Application-wide types

The set of application-wide types is populated by runtime once during the load of a [PHP assembly](assembly/compiled-assembly). The assembly specifies types contained in referenced assemblies during the PHP assembly compilation. Types being listed has to be annotated with `[PhpTypeAttribute]` attribute. By default, these are all the PHP built-in classes and interfaces like `stdClass`.

### User-defined types

The runtime type resolution mechanism needs the set of additional types declared during the program execution. The set of user-defined types is bound to an instance of `Context`. A type is added to the set in two possible ways:

- PHP's `class` (or `interface` or `trait`) statement. The statement is actually translated by the compiler to the API call below.
- Call to [Context.DeclareType()](ref/context#methods).

## Autoload

The runtime supports a simulation of autoloading. This means that every time the program requests a type that is not declared in the `Context` yet and the situation allows the autoloading, the autoload mechanism is invoked.

The autoload mechanism complies with autoloading in the PHP language, taking into account both the `__autoload` function and SPL autoloading. The mechanism itself is provided by the service `IPhpAutoloadService`, which is maintained by the instance of `Context`.

For seamless usability of PHP libraries within .NET programs, the autoload may implicitly perform `include_once` of containing script file when needed. This "implicit autoload" is enabled by default and is disabled if SPL autoload gets enabled.

## Related links

- [PhpTypeInfo](ref/PhpTypeInfo)
