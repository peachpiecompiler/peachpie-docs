## How exceptions are approached in PeachPie
All the exceptions in .NET have to be derived from the `System.Exception` class, and PHP's `Exception` class is no different. However, the PHP `Exception` additionally implements the `Throwable` interface.

In summary, a PHP exception looks as follows:

```
public class Exception : System.Exception, Throwable { ... }
```

!!! note
    All PHP exception classes are implemented in regular C# - e.g. https://github.com/peachpiecompiler/peachpie/blob/master/src/Peachpie.Library/Exceptions/Exception.cs#L11)

The entire exception mechanism then works out of the box:

* Custom PHP exceptions (always derived from the `Exception` class) are a .NET `System.Exception` as well
* PHP exceptions can be caught in C#
* C# exceptions can be also caught in PHP

It is common practice in PHP to catch exceptions using the `Throwable` type (which is not implemented by regular C# exceptions). Also the PHP code might expect that exception is of type PHP Exception which does not have to be true.

```
try { ... } // do some call to .NET
catch (Throwable $t) { ... } // this might not be caught, C# exceptions don't impl Throwable
```

To achieve full interoperability and to avoid any unexpected behavior of the PHP code, the exception thrown from C# and caught by the PHP code should inherit PHP's `Exception` (`Pchp.Library.Spl.Exception` class).
