## Structure of the generated class

PHP classes are compiled into corresponding CLR types. The sample below depicts a PHP class and the resulting CLR type decompiled into the C# language.

```php
<?php
class X {
  // ...
}
```

```c#
[PhpType("X", "index.php")]
public class X {
  // ...
}
```

## Constructors

The PHP class constructor is separated into three methods as follows:

* ![](/img/icon_method.png) `#!c# [PhpFieldsOnlyCtor] protected .ctor(Context ctx)`<br/>is a minimalistic constructor that initializes the instance without invoking a PHP constructor. This is used when a PHP class inherits another PHP class; in such cases, the base PHP constructor must not be called.
* ![](/img/icon_method.png) `#!c# .ctor(Context ctx [, ... ctorparams])`<br/>is used by C# programs and for the purposes of constructing a new instance of the object. `.ctor()` internally constructs the object, initializes fields and calls the proper PHP constructor if available.
* ![](/img/icon_method.png) `#!c# __construct([ctorparams])`<br/>is an optional PHP constructor that might be called explicitly or as a part of `.ctor`.

In addition, the compiled PHP class contains `#!c# .cctor()` (static constructor) that initializes internal runtime descriptors and call sites.

## Additional class members

The class also contains the following fields used by both the compiler and runtime.

* `#!c# protected Context <ctx>`<br/>holds the reference to the owning [Context](/api/ref/context) instance.
* `#!c# internal PhpArray <runtimeFields>`<br/>holds dynamic class fields; is `null` when empty.
* `#!c# IPhpCallable.Invoke(Context, PhpValue[])`<br/>implementation of the [IPhpCallable](/api/ref/iphpcallable) interface in case the class implements the magic `__invoke` function.
* `#!c# class __statics` { ... }<br/>nested container for actual instances of PHP static fields. This is used by the runtime to manage different values of static fields for each [Context](/api/ref/context) (typically an HTTP Request).

## Methods

The declared class methods are compiled as corresponding CLR methods. The provided PHP type hints are respected and translated to the corresponding .NET type. Whenever the PHP type hint is missing, [PhpValue](/api/ref/phpvalue) type is used instead.

Optional parameters (those with an initial value) are translated to corresponding CLR (.NET) initial value metadata for those types that allow this. In case the initial value is an expression or anything not allowed as .NET `[Optional]`, a function overload is automatically created.

## Attributes

The type is annotated with `#!c# [PhpTypeAttribute]`. The attribute contains a fully qualified PHP class name and relative file path where it was declared.
