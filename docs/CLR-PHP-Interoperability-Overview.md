This article provides an overview of the features that allow passing objects between .NET (assuming C#) and PHP code, and the expected behavior of such scenarios.

## Type System

Following table shows compatible C# types and corresponding PHP type. Types from the left column should are consumed by PHP runtime transparently.

CLR | PHP | PHP Features
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
delegate, IPhpCallable\*, string, PhpArray(2)\* | callable | `call_user_func`, `$var()`, `is_callable`

> `*` CLR types declared in Peachpie.Runtime.dll library.

## (CLR) `IEnumerable`

The sample PHP code below is able to consume a variety of CLR objects in addition to PHP's `array` and `Traversable`.

```php
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
foreach ($enumerable as $key => &$value) { $value = 0; }
```
In order to support iteration by reference, the enumerable object must return value of type `PhpAlias` from the enumerator. Otherwise an exception of type `InvalidOperationException` is thrown.

## (CLR) `delegate`

PHP's concept of callables works with `string` pointing to a function name, `array` of two dimensions referring to a class and its method, classes with `__invoke` magic method or `Closure`s.

```php
print_r( $delegate($arg1, $arg2) );
```

Peachpie extends the list of callable types with any CLR `delegate` or objects implementing `IPhpCallable` interface (Peachpie.Runtime.dll).

Sample C# code that passes a delegate to a PHP global variable:
```csharp
Context.Globals["delegate"] = PhpValue.FromClr( new Func<string, bool>( str => str.IsNormalized() ) );
```

## (CLR) `IList`

PHP allows you to access an `array` and objects implementing `ArrayAccess` with square brackets as shown in the example below.

```php
echo $list[10];
```

Peachpie provides the feature for `System.Collections.IList` which allows consuming of .NET arrays, `List`s and other classes in PHP.