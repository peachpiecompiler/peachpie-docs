It is possible to use generic types and generic methods in the PHP code. Use the extended syntax for specifying the type arguments. The syntax is very similar to the C# syntax:

```php

// instantiating new generic type
new System\Collections\Generic\Dictionary<int, string>;

// calling a generic static method
System\Activator::CreateInstance<object>();

// calling a generic instance method
$urhoNode->CreateComponent<Urho\Light>();

// accessing the generic type's members
print_r( System\Collections\Generic\Comparer<int>::$Default );

```

Type arguments must be resolved in compile time. It is not possible to specify type arguments as variables or expressions.

There are no additional options or settings for the syntax extension. It is always available and it does not break the existing PHP code. Note, some PHP IDE might report the extended syntax as syntax error.
