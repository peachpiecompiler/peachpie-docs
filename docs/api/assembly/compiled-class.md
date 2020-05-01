## Structure of the generated class

PHP classes are compiled into corresponding CLR types. The sample below depicts a PHP class and the resulting CLR type decompiled into the C# language.

```php
<?php
class X {
  function __construct() {
    // ...
  }
}
```

```c#
[PhpType("X", "index.php", 0)]
public class X {
  
  // Reference to Context associated with the current instance.
  // Context is needed for most of PHP functions and PHP program lifecycle.
  protected readonly Context <ctx>;

  // Lazily instantiated array with dynamically added fields.
  internal PhpArray <runtime_fields>;
  
  // Constructor used internally to initialize the class without calling the `__construct` function.
  [EditorBrowsable(EditorBrowsableState.Never)]
  [CompilerGenerated, PhpFieldsOnlyCtor]
  protected internal X(Context <ctx>, DummyFieldsOnlyCtor _) : base() {
    this.<ctx> = <ctx>;
  }  
  // Regular class constructor.
  public X(Context <ctx>) : this(<ctx>) {
    __construct();
  }  
  // Context-less constructor to be used from other .NET languages.
  // Context is obtained or created for the current `ExecutionContext`.
  [CompilerGenerated, PhpHidden]
  public X() : this(ContextExtensions.CurrentContext) {
  }  
  // Compiled `__construct` function.
  public PhpValue __construct() {
    // ...
  }
}
```

## Constructors

The PHP class constructor is separated into several `.ctor` overloads as follows:

* ![](/img/icon_method.png) `#!c# [PhpFieldsOnlyCtor] protected internal .ctor(Context, QueryValue``1)`<br/>is an internally used constructor that initializes the instance without invoking the `__construct()` method. This is used when inheriting another PHP class, for object unserialization and when cloning. Note, the special `QueryValue``1` parameter is here just to distinguish this internal `.ctor` and the regular `.ctor`.
* ![](/img/icon_method.png) `#!c# .ctor(Context[, ... ctorparams])`<br/>is used for the purposes of constructing a new instance of the object. `.ctor()` internally constructs the object, initializes fields and calls the proper PHP constructor if available.
* ![](/img/icon_method.png) `#!c# .ctor([, ... ctorparams])`<br/>is used by C# programs to create a new instance of the object. It is a wrapper of the `.ctor` above that does not require the instance of `Context`.
* ![](/img/icon_method.png) `#!c# __construct([ctorparams])`<br/>is an optional PHP constructor that might be called explicitly or as a part of `.ctor`.

In addition, the compiled PHP class contains `#!c# .cctor()` (static constructor) that initializes internal runtime descriptors and call sites.

## Additional class members

The class also contains the following fields used by both the compiler and runtime.

* `#!c# protected Context <ctx>`<br/>holds the reference to the owning [Context](/api/ref/context) instance.
* `#!c# internal PhpArray <runtimeFields>`<br/>holds dynamic class fields; is `null` by default.
* `#!c# IPhpCallable.Invoke(Context, PhpValue[])`<br/>implementation of the [IPhpCallable](/api/ref/iphpcallable/) interface in case the class implements the magic `__invoke` function.
* `#!c# class _statics` { ... }<br/>nested container for actual instances of PHP static fields. This is used by the runtime to manage different values of static fields for each [Context](/api/ref/context) (typically an HTTP Request).

## Methods

The declared class methods are compiled as corresponding CLR methods. The provided PHP type hints are respected and translated to the corresponding .NET type. Whenever the PHP type hint is missing, [PhpValue](/api/ref/phpvalue) type is used instead.

Optional parameters (those with an initial value) are translated to corresponding CLR (.NET) initial value metadata for those types that allow this. In case the initial value is an expression or anything not allowed as .NET `[Optional]`, a function overload is automatically created.

## Attributes

### PhpTypeAttribute

The type is annotated with `#!c# [PhpTypeAttribute]`. The attribute annotates the type with following properties:
- *ExplicitTypeName* (string) - fully qualified PHP type name as it appears in PHP context.
- *FileName* (string) - relative file path where the type was declared.
- *Autoload* (byte) - flag indicating how was the type set for autoloading. See [composer.json](/php/composer-json/) for enabling the autoload. The values of the flag are:
  - `0`: the type was not marked as autoloadable.
  - `1`: the type is set to be autoloaded, but containing file or base types have side effects.
  - `2`: the type can be safely autoloaded without side effects.

### PhpTraitAttribute

The attribute annotates types of type trait. See [compiled trait](/api/assembly/compiled-trait/) for more details.

## Remarks

Every PHP class is bound to a [Context](/api/ref/context). Internally every class is instantiated using a reference to an existing `Context` object. (This object is used for operations like `echo` and maintaining PHP options and request state).

It is possible to omit the `Context` instance; then keep in mind a new `Context` is created within the current [ExecutionContext](https://docs.microsoft.com/en-us/dotnet/api/system.threading.executioncontext). In case of ASP.NET Core application, the `Context` is bound to the current `HttpContext` expecting the [HttpContextAccessor](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/http-context) service is registered.
