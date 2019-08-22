## How exceptions are approached in PeachPie
All the exceptions in .NET have to be derived from the `System.Exception` class, and PHP's `Exception` class is no different. However, the PHP `Exception` additionally implements the `Throwable` interface.

In summary, a PHP exception looks as follows:

``` csharp
public class Exception : System.Exception, Throwable { ... }
```

!!! note
    All PHP exception classes are implemented in regular C# - e.g. https://github.com/peachpiecompiler/peachpie/blob/master/src/Peachpie.Library/Exceptions/Exception.cs#L11

The entire exception mechanism then works out of the box and allows for:

* Custom PHP exceptions (always derived from the `Exception` class) are a .NET `System.Exception` as well
* PHP exceptions to be caught in C#
* C# exceptions to be caught in PHP as well

In PHP, exceptions are commonly caught using the `Throwable` type (which is not implemented by regular C# exceptions). Additionally, the PHP code might expect that an exception is of the PHP type `Exception`, which doesn't have to be true, e.g.:

``` php
try { ... } // make a call to .NET
catch (Throwable $t) { ... } // this might not be caught, C# exceptions don't implement Throwable
```

To achieve full interoperability and to avoid any unexpected behavior of the PHP code, the exception thrown from C# and caught by the PHP code should inherit PHP's `Exception` (`Pchp.Library.Spl.Exception` class).
