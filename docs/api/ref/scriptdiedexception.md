# ScriptDiedException

<small>**assembly:** Peachpie.Runtime.dll</small><br/>
<small>**inherits:** System.Exception</small>

`ScriptDiedException` is thrown to simulate PHP' `die` and `exit` constructs. This is a well known exception that can be ignored.

## Properties

Property | Description
---      | ---
Status | Original argument passed to the `die` function. If no argument is provided, the property is set to a number `255` according to PHP semantics.
ExitCode | `Status` as a number. Gets `0` if `Status` is not a number.
Message | `Status` converted to a string.

## Remarks

The exception is thrown as a response to `die` and `exit` constructs. The reason is this is the only way how to terminate the program at the current location without an unnnecesary overhead. 

Since it is a CLR exception, it is always handled by the .NET debugger and eventual `catch` constructs. This can be used in C# application to handle `die` of a PHP code without terminating the request.

PHP' `try`/`catch` constructs are translated into corresponding CLR code respecting `ScriptDiedException` and re-throwing it away. By default the request handler catches the exception in order to simulate PHP' `die` behavior outputing the status message.
