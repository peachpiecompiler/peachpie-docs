# CLR vs. PHP types

This article provides information on how the runtime treats .NET types. As a result, with respect to this specification, it is possible to pass values between .NET (assuming `C#`) and `PHP` code implicitly, without the need of marshalling or additional conversions.

## Type System

The following table shows compatible .NET types and the corresponding PHP type:

.NET | PHP | PHP Features
--- | --- | ---
[PhpValue](/api/ref/phpvalue) | mixed | 
bool | boolean | 
int, uint, long | integer | 
double, float | double | 
string, PhpString, byte[] | string | 
object | object | `->`
null | NULL | 
[PhpResource](/api/ref/phpresource) | resource | `is_resource`
[PhpNumber](/api/ref/phpnumber) | integer\|double | 
[PhpArray](/api/ref/phparray/), ArrayAccess, IList | array, ArrayAccess | `[]`
Iterator, IteratorAggregate, IEnumerable | iterable | `foreach`, `is_iterable`
delegate, [IPhpCallable](/api/ref/iphpcallable/), string, [PhpArray](/api/ref/phparray/)(2) | callable | `call_user_func`, `is_callable`, etc.
Nullable&lt;T&gt; | value\|NULL | `isset`, `unset`

## System.Nullable&lt;T&gt;

Values can be read from and assigned to the `Nullable<T>` type. Any value of type `Nullable<T>` is treated as its contained value or `NULL`. An automatic conversion is performed. The operator `isset` is using the `Nullable.HasValue` property implicitly.

```c#
class Test {
    public int? Number;           // nullable field
    public double? Foo() { ... }; // return nullable from method
    public void Bar(bool? b) { }  // gets nullable parameter
}
```

```php
<?php
$t = new Test;
$t->Number = 123; // assigns `new Nullable<int>(123)`
$t->Number = null; // assigns `default(Nullable<int>)`
isset( $t->Number ); // gets Number.HasValue
print_r( $t->Foo() ); // gets NULL or double
$t->Bar( NULL ); // passes `default(Nullable<bool>)` to the method
$t->Bar( true ); // passes `new Nullable<bool>(true)` to the method
```

## System.Delegate

PHP's concept of callables works with `string` pointing to a function name, `array` of two dimensions referring to a class and its method, classes with the `__invoke` method or instances of the `Closure` class. Variables of these types, denoted as `callable`, can be used for indirect calls as depicted in the sample below:

```php
<?php
assert( is_callable($delegate) );
print_r( $delegate($arg1, $arg2) ); // $delegate is `callable`
```

PeachPie extends the set of `callable` types with any CLR `delegate` or objects implementing the `IPhpCallable` interface (Peachpie.Runtime.dll).

Sample C# code that passes a delegate to a PHP global variable:
```c#
mycontext.Globals["delegate"] = new Func<string, bool>( str => str.IsNormalized() );
```

## System.Collections.IEnumerable

The sample PHP code below is able to consume a variety of CLR objects in addition to PHP's `array` and `Traversable`.

```php
<?php
foreach ($enumerable as $key => $value) { }
```

`$enumerable` may implement the following CLR interfaces:

- `IPhpEnumerable` (Peachpie.Runtime.dll) is the extended version of `IEnumerable`. Objects implementing this interface are capable of being enumerated in PHP's `foreach`.
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
In order to support an iteration by reference, the enumerable object must return the value of type `PhpAlias` from the enumerator. Otherwise an exception of type `InvalidOperationException` is thrown.

## System.Collections.IList

PHP allows the accessing of an `array` and objects implementing `ArrayAccess` with square brackets `[]` as shown in the example below:

```php
<?php
echo $list[10];
```

PeachPie provides the feature for `System.Collections.IList`, which allows consuming .NET arrays, `List`s and other classes in PHP.

## C# Event

> Implemented in `1.2.0` ([#1141](https://github.com/peachpiecompiler/peachpie/issues/1141))

PeachPie runtime allows working with .NET/CLR `event` class members in order to register and unregister callables. The following code depicts a sample C# class and a sample PHP program adding and removing an anonymous function (or any PHP callable) to it.

```c#
class SampleContainer
{
    public event EventHandler MyEvent;    
}
```

```php
<?php
$obj = new SampleContainer;
// add callable to the event handler:
$hook = $obj->MyEvent->add(
    function ($sender, $arg) {
        echo "hello!";
    }
);

// remove callable from the event handler
$hook->close();
```

In PHP, the `event` class member is represented by an instance of a special class `#!php Pchp\Core\ClrEvent` with the following method:

- `#!php ClrEvent::add( callable $callback ): Pchp\Core\ClrEvent\Hook`

The `Pchp\Core\ClrEvent\Hook` class methods:

- `#!php Hook::close()`
- `#!php Hook::dispose() // alias to close`

## C# Indexers

PHP array operator `[]` can be used on objects implementing [C# indexers](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/indexers/). 

The following example defines a C# indexer with sample `get` and `set` accessors.

```c#
using System;

class SampleIndexer
{
   string[] arr = new string[100];

   // Define the indexer to allow to use [] operator.
   public string this[int i]
   {
      get { return arr[i]; }
      set { arr[i] = value; }
   }
}
```

The following PHP code makes use of the C# indexer implicitly.

```php
<?php
$sample = new \SampleIndexer;
$sample[0] = "Hello";
echo $sample[0]; // prints "Hello"
```

> The indexer implementation `#c# this[]` is a syntactic sugar that results in compiler generated special `get_Item` and `set_Item` methods. PeachPie translates the array operator into the call to the corresponding `get_Item` or `set_Item`method.
