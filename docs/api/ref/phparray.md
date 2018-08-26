# PhpArray

<small>**assembly:** Peachpie.Runtime.dll</small><br/>
<small>**implements:** `IList`, `IList<PhpValue>`, `IEnumerable<PhpValue>`, `IDictionary`, `IDictionary<IntStringKey, PhpValue>`, `IEnumerable<KeyValuePair<IntStringKey, PhpValue>>`, `IPhpConvertible`, `IPhpArray`, `IPhpComparable`, `IPhpEnumerable`</small>

Represents an ordered dictionary used as PHP's `array` type.

## Examples

```c#
// creates new array and initializes it with entries
var phparray = new PhpArray(5) {
    {"value", true},
    {"point", new PhpArray { {"x", 1 }, {"y", 2} } },
    {"name", "John Smith"},
    {"weight", 168.5},
    {"dob", "10/12/1991"},
}
```

```c#
// fast allocation-less enumeration of array entries
// no using() or try/catch needed
var e = phparray.GetFastEnumerator();
while (e.MoveNext()) {
    // e.CurrentKey, e.CurrentValue
}
```

## Construction

Constructor | Summary
---         | ---
`#!c# .ctor()` | Creates a new array object with no entries.
`#!c# .ctor(int)` | Creates a new array object with an initial capacity.
`#!c# .ctor(IEnumerable)` | Creates a new array object and initializes it with values from given enumeration.

## Properties

Property | Summary
---      | ---
Count | Gets the number of items in the array.

## Methods

Method | Summary
---    | ---
GetValues() : [PhpValue](phpvalue)[] | Most efficient way of copying contained values (without keys) into a new array. Order of values is preserved.
Add(key, value) | Adds an entry to the end of the array. If the given `key` already exists, the existing entry is overwritten.
RemoveKey(key) | Removes an entry from the array by its key.
[key] : [PhpValue](phpvalue) | Gets or sets a value at specified `key`.
GetFastEnumerator() | Gets lightweight enumerator object (as *struct*) to be used for allocation-less enumeration of the array.

## Remarks

**PhpArray** is used by runtime as an internal type for values of type `array`, unoptimized local variables, global variables and class's runtime properties.
