## Structure of the generated class

PHP classes are compiled into corresponding CLR classes. The PHP class constructor is separated into three methods as follows:

![](/img/icon_class.png) `#!c# [PhpType("X")] class X`

- ![](/img/icon_method.png) `#!c# [PhpFieldsOnlyCtor] protected .ctor(Context ctx)`
is a minimalistic constructor that initializes the instance without invoking a PHP constructor. This is used when a PHP class inherits another PHP class; in such cases, the base PHP constructor must not be called.
- ![](/img/icon_method.png) `#!c# .ctor(Context ctx [, ... ctorparams])`
is used by C# programs and for the purposes of constructing a new instance of the object. `.ctor()` internally constructs the object, initializes fields and calls the proper PHP constructor if available.
- ![](/img/icon_method.png) `#!c# __construct([ctorparams])`
is an optional PHP constructor that might be called explicitly or as a part of `.ctor`.

In addition, the compiled PHP class contains `#!c# .cctor()` (static constructor) that initializes internal runtime descriptors and call sites.

The class also contains the following fields used by both the compiler and runtime.

* internal PhpArray &lt;runtimeFields>; // holds additional fields that might be set during runtime.
* IPhpCallable.Invoke(Context, PhpValue[]); // implementation of IPhpCallable interface in case the class has the magic `__invoke` function.
* class __statics { ... } // nested container for actual instances of PHP static fields. This is used by the runtime to manage different values of static fields for each Context (typically an HTTP Request).
