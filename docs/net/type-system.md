# CLR vs. PHP types

This article provides information on how the runtime treats .NET types. In result, with respect to this specification, it is possible to pass values between .NET (assuming `C#`) and `PHP` code implicitly, without a need of marshalling or an additional conversions.

## Type System

Following table shows compatible .NET types and corresponding PHP type:

.NET | PHP | PHP Features
--- | --- | ---
PhpValue\* | mixed | 
bool | boolean | 
int, uint, long | integer | 
double, float | double | 
string, PhpString\*, byte[] | string | 
object | object | `->`
null | NULL | 
PhpResource\* | resource | `is_resource`
PhpNumber\* | integer\|double | 
PhpArray\*, ArrayAccess\*, IList | array, ArrayAccess | `[]`
Iterator\*, IteratorAggregate\*, IEnumerable | iterable | `foreach`, `is_iterable`
delegate, IPhpCallable\*, string, PhpArray(2)\* | callable | `call_user_func`, `is_callable`, etc.

> `*` .NET types defined in `Peachpie.Runtime.dll` module.

## System.Collections.IEnumerable

The sample PHP code below is able to consume a variety of CLR objects in addition to PHP's `array` and `Traversable`.

```php
<?php
foreach ($enumerable as $key => $value) { }
```

`$enumerable` may implement following CLR interfaces:

- `IPhpEnumerable` (Peachpie.Runtime.dll) is the extended version of `IEnumerable`. Objects implementing this interface are capable of being enumerated in PHP `foreach`.
- `IDictionary`; objects implementing this interface.
- `IEnumerable<(Key, Value)>`; objects implementing `IEnumerable<>` of `ValueTuple` with two items.
- `IEnumerable<KeyValuePair<Key, Value>>`; objects implementing `IEnumerable<>` of `KeyValuePair<,>`.
- `IEnumerable` in general works with `foreach` as well. `$key` is auto-incremented starting with `0`, `$value` is the current value of the enumerator.

As a result, standard .NET classes such as .NET arrays, `ArrayList`, `List<>`, `Dictionary<,>` or enumerators created using C# `yield` are transparently supported by PHP's `foreach` construct.

### `foreach` by reference

```php
<?php
foreach ($enumerable as $key => &$value) { $value = 0; }
```
In order to support iteration by reference, the enumerable object must return value of type `PhpAlias` from the enumerator. Otherwise an exception of type `InvalidOperationException` is thrown.

## System.Delegate

PHP's concept of callables works with `string` pointing to a function name, `array` of two dimensions referring to a class and its method, classes with `__invoke` magic method or `Closure`s.

```php
<?php
print_r( $delegate($arg1, $arg2) );
```

PeachPie extends the list of callable types with any CLR `delegate` or objects implementing `IPhpCallable` interface (Peachpie.Runtime.dll).

Sample C# code that passes a delegate to a PHP global variable:
```csharp
Context.Globals["delegate"] = PhpValue.FromClr( new Func<string, bool>( str => str.IsNormalized() ) );
```

## System.Collections.IList

PHP allows you to access an `array` and objects implementing `ArrayAccess` with square brackets as shown in the example below.

```php
<?php
echo $list[10];
```

PeachPie provides the feature for `System.Collections.IList` which allows consuming of .NET arrays, `List`s and other classes in PHP.
