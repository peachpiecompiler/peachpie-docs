# PhpFatalErrorException

<small>**assembly:** Peachpie.Runtime.dll</small><br/>
<small>**inherits:** `PhpErrorException`, `System.Exception`</small>

`PhpFatalErrorException` is thrown once an unhandled fatal error occurs.

## Properties

Property | Description
---      | ---
Message | The original error message.

## Remarks

This exception is thrown by the runtime as a response to an unhandled error, for example:

```
Error : Cannot use object of type stdClass as array
```

The error is caused by the application and reported to the eventual debug output and "PeachPie" event source. After it is reported to the debug output, the runtime throws `Pchp.Core.PhpFatalErrorException` to exit the program.

Although it is usually a fatal error for the PHP code, here it can be safely handled using regular `try/catch` construct.
