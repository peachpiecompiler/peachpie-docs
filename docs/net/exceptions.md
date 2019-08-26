PHP exceptions and the exception handling are both-way interoperable with CLR exception handling. All the throwable exception types in CLR have to be derived from the `System.Exception` class, so the base PHP exception classes `\Error` and `\Exception` are no different.

*Following code samples depict the pseudo-implementation of the base PHP exception classes.*

```c#
// base PHP exception class - \Error
public class Error : System.Exception, Throwable { ... }
```

```c#
// base PHP exception class - \Exception
public class Exception : System.Exception, Throwable { ... }
```

The entire exception mechanism between .NET languages and PHP works out of the box.

## Catch PHP Exception in C#

Since all the PHP exception classes and user PHP exception classes are derived from `System.Exception`, thay can be caught in .NET using standard `#!c# try/catch/finally` blocks.

```c#
try { /* invoke a PHP code */ }
// handle only Error exception class (full name is Pchp.Library.Spl.Error)
catch (Error err)
// handle any exception including PHP exception
catch (Exception ex) { ... }
```

## Catch C# Exception in PHP

When catching standard .NET exceptions in PHP code, keep in mind they are not inherited from PHP's `\Exception`, `\Throwable` or `\Error` types. In order to catch a standard `System.Exception` or a derived type, the type must be specified in the `catch` block as follows.

```php
<?php
try { /* call a .NET method that throws */}
// C# exceptions don't implement Throwable, won't catch
catch (\Throwable $t) { ... }
// C# exceptions don't inherit PHP \Exception type, won't catch
catch (\Exception $e) { ... }
// catches everything - C# and PHP exceptions
catch (\System\Exception $se) { ... }
```

## Note to Implementors

In PHP, exceptions are commonly caught using the `\Throwable` type (which is not implemented by regular C# exceptions). Additionally, the PHP code might expect that an exception object is of the PHP type `\Exception`, which doesn't have to be true, and might expect there are certain properties (like `Exeption::$file`).

Not necessarily, but to achieve full interoperability and to avoid any unexpected behavior of the PHP code, the user exceptions thrown from C# and caught by the PHP code should inherit PHP's `\Exception` class (full CLR name: `Pchp.Library.Spl.Exception` implemented in `Peachpie.Library.dll`).
