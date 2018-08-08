`Late Static Binding` is a PHP feature that allows referening the type that was used within the call of the current static method. In the example below, a program can reference to `A` or `B` using the single keyword `static`.

```php
<?php

class A {
  static function make() { return new static; } }
}
class B extends A {}

A::make(); // => new A
B::make(); // => new B
```

## Compiler

The compiler analyses the content of every function. When the `static` keyword is used within a function, it generates an additional (hidden, synthesized, compiler-generated, implicit) parameter `PhpTypeInfo <static>`.

In the example above, the .NET signature of method `make()` would be
```C#
public static void make(Context <ctx>, PhpTypeInfo <static>)
```
Both synthesized parameters are well known to the compiler and runtime. When compiler generates code that calls such a method; the values for these synthesized parameters are filled by the compiler.

Occurrences of `static` within the function are translated to a specific use of the `<static>` parameter. In the example above, the PHP code `new static` is lowered to the C# equivalent `<ctx>.Create(<static>)`.

## Use from C# (or another .NET language)

Since functions using late static binding have additional generated parameters, it has to be taken into account when invoking them. The parameters must not be ignored; passing a `null` value would cause an exception. The runtime library (Peachpie.Runtime) provides helper methods for creating `PhpTypeInfo` from a type. Use the `PhpTypeInfoExtension` helper class in order to obtain an instance of `PhpTypeInfo` to be passed into a generated `<static>` parameter, like in the following example:

```C#
B.make(ctx, PhpTypeInfoExtension.GetPhpTypeInfo<B>()); // ctx is an instance of Context representing current execution context
```
