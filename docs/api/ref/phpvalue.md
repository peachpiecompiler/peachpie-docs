# PhpValue

PHP language specifies a value of a variable to not be restricted to a single type. This is refered to as a type ambiguity, a type dynamicity, aka `mixed`.

PeachPie defines struct `PhpValue` as the abstraction of the PHP' `mixed`. This .NET type is used in case a type of a value cannot be resolved in compile time. It applies to global variables in general, function parameters without a type hint, function return type without a type hint, class' properties and local variables.

## Conversions

### To PhpValue

Any .NET type can be converted to PhpValue. Following table lists the types and corresponding conversion function.

.NET type | Conversion routine | Sample
---       | ---                | ---
bool | implicit cast | `#!c# (PhpValue)true`
int | implicit cast | `#!c# (PhpValue)(-1)`
long | implicit cast | `#!c# (PhpValue)9876543210L`
double | implicit cast | `#!c# (PhpValue)123.456`
string | implicit cast | `#!c# (PhpValue)"Hello"`
byte[] | implicit cast | `#!c# (PhpValue)Encoding.UTF8.GetBytes("Hello")`
PhpArray | implicit cast | `#!c# (PhpValue)new PhpArray()`
Delegate | implicit cast | `#!c# (PhpValue)new Func<int>(() => 123)`
object | FromClass() | `#!c# PhpValue.FromClass(new System.Object())`

### From PhpValue

Value can be converted to a standard .NET type using following conversion routines. When applicable, the conversion respects the PHP semantic of casting values.

.NET type | Conversion routine | Sample | Remarks
---       | ---                | ---    | ---
bool | implicit cast | `#!c# (bool)value` | -
ushort | explicit cast | `#!c# (ushort)value` | `OverflowException`, `PHP notice`
int | explicit cast | `#!c# (int)value` | `OverflowException`, `PHP notice`
uint | explicit cast | `#!c# (uint)value` | `OverflowException`, `PHP notice`
long | explicit cast | `#!c# (long)value` | `PHP notice`
double | explicit cast | `#!c# (double)value` | `PHP notice`
string | explicit cast | `#!c# value.ToString()` | byte[] is encoded using UTF-8
PhpNumber | explicit cast | `#!c# (PhpNumber)value` | `PHP notice`
PhpArray | explicit cast | `#!c# (PhpArray)value` | can result in `null`
PhpAlias | EnsureAlias() | `#!c# value.EnsureAlias()` | -
Object | AsObject() | `#!c# value.AsObject()` | gets underlaying object, dereferenced

## Operators

The type defines arithmetic and comparison operators according PHP semantic.

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
`AsCallable` | `#!c# val.AsACallable()` | gets `IPhpCallable` from PHP' `callable` which can be invoked
