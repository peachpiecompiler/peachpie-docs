## Structure of generated class

PHP classes are compiled into corresponding CLR classes. The PHP class constructor is separated into three methods as follows:

![](/img/icon_class.png) `#!c# [PhpType("X")] class X`

- ![](/img/icon_method.png) `#!c# [PhpFieldsOnlyCtor] protected .ctor(Context ctx)`
is minimal constructor that initializes the instance without invoking PHP constructor. This is used when PHP class inherits another PHP class; in such case base PHP constructor must not be called.
- ![](/img/icon_method.png) `#!c# .ctor(Context ctx [, ... ctorparams])`
is used by C# programs and for purposes of constructing a new instance of the object. .ctor() internally constructs the object, initializes fields and calls proper PHP constructor if any.
- ![](/img/icon_method.png) `#!c# __construct([ctorparams])`
is an optional PHP constructor that might be called explicitly or as a part of `.ctor`.

In addition, compiled PHP class contains `#!c# .cctor()` (static constructor) that initializes internal runtime descriptors and call sites.

The class also contains following fields used by compiler and runtime.

* internal PhpArray &lt;runtimeFields>; // holds additional fields that might be set during runtime.
* IPhpCallable.Invoke(Context, PhpValue[]); // implementation of IPhpCallable interface in case the class has the magic `__invoke` function.
* class __statics { ... } // nested container for actual instances of PHP static fields. This is used by runtime to manage different values of static fields for each Context (typically an HTTP Request).
