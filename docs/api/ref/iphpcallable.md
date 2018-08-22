# IPhpCallable

<small>**assembly:** Peachpie.Runtime.dll</small>

The interface represents an abstraction of a value converted to `callable`. It is used internally in order to perform call operation on a value dynamically.

## Construction

From | Method
---  | ---
[PhpValue](phpvalue) | `#!c# value.AsCallable()`<br/>Casts given value to a callable according to PHP semantics. Can result in a reference to invalid `PhpCallback`.
`#!c# System.Delegate` | `#!c# RoutineInfo.CreateUserRoutine(name, delegate)`<br/>Creates callable to a delegate.
`#!c# string` | `#!c# PhpCallback.Create(name)`<br/>Creates callable to a declared function. When the callable is invoked, function gets resolved within given [Context](context).

## Methods

Method | Description
---    | ---
`#!c# Invoke(Context ctx, params PhpValue[] arguments) : PhpValue` | Performs dynamic invocation of the callable object.
`#!c# ToPhpValue() : PhpValue` | Gets PHP representation of the callable. Used internally to print the callable object.

## Remarks

The list of declared functions is managed as a set of **IPhpCallable** instances by [Context](context).

Library functions may accept an argument of type **IPhpCallable**. It is a well known argument type and the compiler and the runtime will convert passed value to **IPhpCallable** implicitly using [construction](#construction).

The compiler implicitly implements **IPhpCallable** interface on PHP classes defining magic `__invoke` method.
