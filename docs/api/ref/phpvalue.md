# PhpValue

<small>**assembly:** Peachpie.Runtime.dll</small>

PHP is a loosely typed language. It specifies the value of a variable not to be restricted to a single type. This is referred to as type ambiguity, type dynamicity, or is also known as `mixed`.

PeachPie defines struct `PhpValue` as the abstraction of PHP's `mixed`. This .NET type is used in case a type of value cannot be resolved in compile time. It applies to global variables in general, function parameters without a type hint, function return types without a type hint, class properties and local variables.

## Conversions

### To PhpValue

Any .NET type can be converted to PhpValue. The following table lists the types and the corresponding conversion function.

.NET type | Conversion routine | Sample
---       | ---                | ---
bool | implicit cast | `#!c# (PhpValue)true`
int | implicit cast | `#!c# (PhpValue)(-1)`
long | implicit cast | `#!c# (PhpValue)9876543210L`
double | implicit cast | `#!c# (PhpValue)123.456`
string | implicit cast | `#!c# (PhpValue)"Hello"`
byte[] | implicit cast | `#!c# (PhpValue)Encoding.UTF8.GetBytes("Hello")`
[PhpArray](/api/ref/phparray/) | implicit cast | `#!c# (PhpValue)new PhpArray()`<br/>`PhpArray` represents PHP's `array` object.
delegate | implicit cast | `#!c# (PhpValue)new Func<int>(() => 123)`<br/>In PHP, the delegate is treated as an instance of a `callable` class.
object | `#!c# FromClass()` | `#!c# PhpValue.FromClass(new System.Object())`

### From PhpValue

A value can be converted to a standard .NET type using the following conversion routines. When applicable, the conversion respects the PHP semantic of the casting values.

.NET type | Conversion routine | Sample | Remarks
---       | ---                | ---    | ---
bool | implicit cast | `#!c# (bool)value` | -
ushort | explicit cast | `#!c# (ushort)value` | `OverflowException`, `PHP notice`
int | explicit cast | `#!c# (int)value` | `OverflowException`, `PHP notice`
uint | explicit cast | `#!c# (uint)value` | `OverflowException`, `PHP notice`
long | explicit cast | `#!c# (long)value` | `PHP notice`
double | explicit cast | `#!c# (double)value` | `PHP notice`
string | explicit cast | `#!c# value.ToString()` | byte[] is encoded using UTF-8
[PhpNumber](phpnumber) | explicit cast | `#!c# (PhpNumber)value` | `InvalidCastException`
[PhpArray](/api/ref/phparray/) | explicit cast | `#!c# (PhpArray)value` | conversion to array according to PHP semantic
PhpAlias | EnsureAlias() | `#!c# value.EnsureAlias()` | -
Object | AsObject() | `#!c# value.AsObject()` | gets underlaying class instance, can be `null`.
Object | ToClr() | `#c# value.ToClr()` | boxes any underlaying value into `System.Object`, can be `null`.
T | Cast<T>() | `#c# value.Cast<MyClass>()` | performs appropriate conversion of underlaying value into CLR type `T`.

## Operators

The type defines arithmetic and comparison operators according to PHP semantic.

Operator | Sample | Remarks
---      | ---    | ---
`==` | `#!c# val1 == val2` | non-string equality
`!=` | `#!c# val1 != val2` | non-strict inequality
`<` | `#!c# val1 < val2` | comparison
`~` | `#!c# ~val1` | bit negation
`&` | `#!c# val1 & val2` | bit and
`|` | `#!c# val1 | val2` | bit or
`^` | `#!c# val1 ^ val2` | bit xor
`/` | `#!c# val1 / val2` | division, operands are converted to number
`*` | `#!c# val1 * val2` | multiplication, operands are converted to number
`[]` | `#!c# val[1]` | accessing value item as array according to PHP semantic
`StrictEquals` | `#!c# val1.StrictEquals(val2)` | strict equality, PHP' `===`
`ToArray` | `#!c# val.ToArray()` | conversion to array according to PHP semantic
`AsArray` | `#!c# val.AsArray()` | gets underlaying [PhpArray](/api/ref/phparray/) or `null`
`AsCallable` | `#!c# val.AsCallable()` | gets `IPhpCallable` from PHP' `callable` which can be invoked, can be `null`

## Visitor pattern

`PhpValue` type implements a visitor pattern so you can traverse through the underlaying value structure. This is useful in case of arrays or objects, in case of implementing a value serializer, but also in order to quickly call a method depending on the value's type.

Method: `#!c# PhpValue.Accept( PhpVariableVisitor visitor)`

Sample:

```c#

class MyVisitor : PhpVariableVisitor {
    public override void AcceptNull() { } // PhpValue contains NULL!
}
value.Accept( new MyVisitor() ); // traverses through the value, arrays and objects
```

> Note, the visitor implementation does not check for cycles in the underlaying structure. Infinite recursion may occur when the underlaying object or array contauns a referenced value to itself.
